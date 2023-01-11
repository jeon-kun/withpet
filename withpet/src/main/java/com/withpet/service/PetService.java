package com.withpet.service;

import java.util.List;

import com.withpet.domain.PetVO;
import com.withpet.dto.Criteria;


public interface PetService {
	
	//펫등록
	public void insertPet(PetVO vo);
	
	//펫리스트
	public List<PetVO> listPet(Criteria cri);
	public List<PetVO> imgList(int petno);

}
