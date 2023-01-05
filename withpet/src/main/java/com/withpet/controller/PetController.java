package com.withpet.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/main")
public class PetController {
	
	@GetMapping
	public void main() {
		log.info("메인페이지");
		
	}

}
