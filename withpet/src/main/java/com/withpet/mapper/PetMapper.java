package com.withpet.mapper;

import java.util.List;

import com.withpet.domain.PetVO;
import com.withpet.dto.Criteria;

public interface PetMapper {
	
	public void insertPet(PetVO petVO);
	
	public List<PetVO> listPet(Criteria cri);
	
	public List<PetVO> imgList(int petno);

}
