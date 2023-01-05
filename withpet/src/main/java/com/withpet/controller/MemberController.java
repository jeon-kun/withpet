package com.withpet.controller;

import java.util.Random;

import javax.mail.internet.MimeMessage;import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.withpet.domain.MemberVO;
import com.withpet.dto.MemberDTO;
import com.withpet.mapper.MemberMapper;
import com.withpet.service.MemberService;

import lombok.extern.log4j.Log4j;
import oracle.jdbc.proxy.annotation.Post;

@Controller
@Log4j
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
    @Autowired
    private JavaMailSender mailSender;
    
    @Autowired
    private BCryptPasswordEncoder pwEncoder;
	
	//회원가입폼
	@GetMapping("/join")
	public String joinForm() {
		log.info("회원가입페이지");
		return "member/join";
	}
	@PostMapping("/join")
	public String join(MemberDTO memberDTO) {
	
			String rawPw = "";            // 인코딩 전 비밀번호
	        String encodePw = "";        // 인코딩 후 비밀번호
	        
	        rawPw = memberDTO.getPassword();            // 비밀번호 데이터 얻음
	        encodePw = pwEncoder.encode(rawPw);        // 비밀번호 인코딩
	        memberDTO.setPassword(encodePw);            // 인코딩된 비밀번호 member객체에 다시 저장
		
		memberService.memberRegister(memberDTO);
		
		log.info("회원가입진행");
		return "redirect:/main";
		
	}
	//로그인폼
	@GetMapping("/login")
	public String loginForm() {
		log.info("로그인페이지");
		return "member/login";
	}
	
	@PostMapping("/emailChk")
	@ResponseBody
	public String memberEmailChk(String email) {
		log.info("아이디중복검색 진행");
		 int result = memberService.idChk(email);
		 log.info("여기는 아이디 중복검사");
		 log.info(email);
		 if(result != 0) {
			 return "fail";
			 
		 } else {
			 return " succes";
		 }
		
	}
	
	@GetMapping("/mailChk")
	@ResponseBody
	public String mailChk(String emailChk) {
		
		

		
		//인증번호 생성
		Random random = new Random();
		int checkNum = random.nextInt(888888)+111111;
		
			String setFrom = "gm045723@gmail.com";
	        String toMail = emailChk;
	        String title = "회원가입 인증 이메일 입니다.";
	        String content = 
	                "홈페이지를 방문해주셔서 감사합니다." +
	                "<br><br>" + 
	                "인증 번호는 " + checkNum + "입니다." + 
	                "<br>" + 
	                "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
	        
	        try {
	            
	            MimeMessage message = mailSender.createMimeMessage();
	            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
	            helper.setFrom(setFrom);
	            helper.setTo(toMail);
	            helper.setSubject(title);
	            helper.setText(content,true);
	            mailSender.send(message);
	            
	        }catch(Exception e) {
	            e.printStackTrace();
	        }
	        String num = Integer.toString(checkNum);

	        return num;
			}
	
//	//로그인
//	@PostMapping("/login")
//	public String login(HttpServletRequest request, MemberDTO member, RedirectAttributes rttr) {
//		
//		HttpSession session = request.getSession();
//		MemberVO vo = memberService.memberLogin(member);
//		
//        if(vo == null) {                                // 일치하지 않는 아이디, 비밀번호 입력 경우
//            
//            int result = 0;
//            rttr.addFlashAttribute("result", result);
//            return "redirect:/member/login";
//            
//        }
//        
//        session.setAttribute("member", vo);             // 일치하는 아이디, 비밀번호 경우 (로그인 성공)
//        
//        return "redirect:/main";
//	}
	//로그인
	@PostMapping("/login")
	public String login(HttpServletRequest request, MemberDTO member, RedirectAttributes rttr) {
        HttpSession session = request.getSession();
        String rawPw = "";
        String encodePw = "";
    
        MemberVO vo = memberService.memberLogin(member);    // 제출한아이디와 일치하는 아이디 있는지 
        
        if(vo != null) {            // 일치하는 아이디 존재시
            
            rawPw = member.getPassword();        // 사용자가 제출한 비밀번호
            encodePw = vo.getPassword();        // 데이터베이스에 저장한 인코딩된 비밀번호
            
            if(true == pwEncoder.matches(rawPw, encodePw)) {        // 비밀번호 일치여부 판단
                
                vo.setPassword("");                    // 인코딩된 비밀번호 정보 지움
                session.setAttribute("member", vo);     // session에 사용자의 정보 저장
                return "redirect:/main";        // 메인페이지 이동
                
                
            } else {
 
                rttr.addFlashAttribute("result", 0);            
                return "redirect:/member/login";    // 로그인 페이지로 이동
                
            }
            
        } else {                    // 일치하는 아이디가 존재하지 않을 시 (로그인 실패)
            
            rttr.addFlashAttribute("result", 0);            
            return "redirect:/member/login";    // 로그인 페이지로 이동
            
        }	
	
	}
	
//    /* 메인페이지 로그아웃 */
//    @GetMapping("logout")
//    public String logout(HttpServletRequest request) throws Exception{
//    	
//    	log.info("로그아웃 매서드 실행");
//    	
//    	HttpSession session = request.getSession();
//        session.invalidate();
//        
//        return "redirect:/main";
//        
//    }
    /* 비동기방식 로그아웃 메서드 */
    @PostMapping("logout")
    @ResponseBody
    public void logoutPOST(HttpServletRequest request) throws Exception{
        
       
        
        HttpSession session = request.getSession();
        
        session.invalidate();
        
    }
	
}
