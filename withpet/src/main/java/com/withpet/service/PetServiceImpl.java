package com.withpet.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.withpet.domain.PetVO;
import com.withpet.dto.Criteria;
import com.withpet.mapper.PetMapper;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class PetServiceImpl implements PetService {
	
	@Autowired
	private PetMapper pet;

	//펫등록
	@Override
	public void insertPet(PetVO vo) {
		
		
		pet.insertPet(vo);
		
		
	}
	
	//펫 목록
	@Override
	public List<PetVO> listPet(Criteria cri) {
		
		return pet.listPet(cri);
	}

	@Override
	public List<PetVO> imgList(int petno) {
		return pet.imgList(petno);
	}

}
