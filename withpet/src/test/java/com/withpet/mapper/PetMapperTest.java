package com.withpet.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.withpet.domain.PetVO;
import com.withpet.dto.Criteria;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/root-context.xml" })
@Log4j
@WebAppConfiguration
public class PetMapperTest {
	
	@Autowired
	public PetMapper pet;
	
//	@Test
//	public void insertPet() {
//		PetVO vo =PetVO.builder()
//				
//				.mno(41)
//				.name("솔이")
//				.sex("M")
//				.species("솔이")
//				.age(5)
//				.build();
//		
//		pet.insertPet(vo);
//		
//	}
	
	@Test
	public void listPet() {
		Criteria cir = new Criteria(1, 10); //1페이지 글 10개 보여주기
		
		List<PetVO> list = pet.listPet(cir);
	
	for(PetVO list2 : list) {
		System.out.println("list = "  + "//////////////////////////" + list2);
	}
	}

}
