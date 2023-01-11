package com.withpet.controller;


import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.withpet.domain.PetVO;
import com.withpet.dto.Criteria;
import com.withpet.service.PetService;

import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

@Controller
@Log4j
@RequestMapping("/pet")
public class PetController {
	
	@Autowired
	private PetService service;
		
	
	//마이펫 진입(글목록)
	@GetMapping("/mypet")
		public void mypet(Criteria cri, Model model) {
		log.info("마이펫진입");
		List list = service.listPet(cri);
		System.out.println("ddddddddddddddd2"+list.get(0));
		model.addAttribute("petlist", list);
		}
	
	//글쓰기폼
	@GetMapping("/register")
		public String registerPet() {
		log.info("마이펫진입");
		return "pet/register";
		}
	
	//글쓰기
	@PostMapping("/registerpet")
	@ResponseBody
	public String registerPet(@RequestBody PetVO petVO,RedirectAttributes rttr) {
		
		log.info("글쓰기 실행됨");
		
		
		service.insertPet(petVO);
		

		rttr.addFlashAttribute("result", "success");

		return "OK";
		
	}
	
	//파일 업로드 폴더 생성
	private final String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = sdf.format(date);
		return str.replace("-", File.separator);
	}
	
	//파일 업로드
	@PostMapping(value = "/upload", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public PetVO uploadFile(MultipartFile file) {
		
		String uploadFolder = "C:\\upload"; //서버에 파일 업로드할 폴더 경로
		
		//폴더 만들기
		File filePath = new File(uploadFolder, getFolder());
		
		if(filePath.exists() == false) {
			filePath.mkdirs();
		}
		
		log.info("파일---------------------------");
		log.info("파일이름 " + file.getOriginalFilename());
		log.info("파일 크키" + file.getSize());
		
		PetVO petDTO = new PetVO();
		
		String fileName = file.getOriginalFilename();
		petDTO.setFilename(fileName);
		fileName = fileName.substring(fileName.lastIndexOf("\\") + 1); //IE의 경우 전체 파일 경로가 전송되므로 수정 필요 
		
		UUID uuid = UUID.randomUUID();
		fileName = uuid.toString() + "_" + fileName; //UUID를 통한 파일명 중복 방지
		
		
		try {
			File saveFile = new File(filePath, fileName);
			file.transferTo(saveFile);
			
			FileOutputStream thumbnail = new FileOutputStream(new File(filePath, "s_" + fileName)); //썸네일 파일명 설정			
			Thumbnailator.createThumbnail(file.getInputStream(), thumbnail, 100, 100); //썸네일 생성			
			thumbnail.close();		
					
			petDTO.setFilepath(getFolder().toString());
			
			petDTO.setUuid(uuid.toString());	
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return petDTO;
	}

}
