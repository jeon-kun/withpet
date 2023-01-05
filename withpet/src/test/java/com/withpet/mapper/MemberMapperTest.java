package com.withpet.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.withpet.domain.MemberVO;
import com.withpet.mapper.MemberMapper;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/root-context.xml" })
@Log4j
@WebAppConfiguration
public class MemberMapperTest {
	
	@Autowired
	private MemberMapper mapper;
	
	//회원가입 테스트
//	@Test
//	public void memberJoin() throws Exception{
//		MemberVO vo =  new MemberVO();
//		
//		vo.setName("test3");
//		vo.setEmail("test3");
//		vo.setPassword("test3");
//		vo.setBirth(111111);
//		vo.setAuthority("ROLE_ADMIN");
//		
//		mapper.memberInsert(vo);
//	}
	
//	//아이디 중복검사
//	@Test
//	public void idChk() {
//		String email1 = "test3";
//		String email2 = "noemail";
//		
//		mapper.idChk(email1);
//		mapper.idChk(email2);
//	}
	
	//로그인
	@Test
	public void memberLogin() {
		MemberVO vo = new MemberVO();
		vo.setEmail("test");
		vo.setPassword("test");

//		vo.setEmail("xxxxx");
//		vo.setPassword("xxxxx");
		
		
		mapper.memberLogin(vo);
		System.out.println("결과값 " + mapper.memberLogin(vo));
	}
	

}
