package com.withpet.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.withpet.domain.MemberVO;
import com.withpet.dto.MemberDTO;
import com.withpet.mapper.MemberMapper;

import lombok.extern.log4j.Log4j;


@Service
@Log4j
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private MemberMapper mapper;
	
	@Override
	public void memberRegister(MemberDTO memberDTO) {
		MemberVO memberVO = new MemberVO();
		memberVO.setEmail(memberDTO.getEmail());
		memberVO.setBirth(memberDTO.getBirth());
		memberVO.setMno(memberDTO.getMno());
		memberVO.setPassword(memberDTO.getPassword());
		memberVO.setName(memberDTO.getName());
		memberVO.setAuthority("ROLE_USER");
		mapper.memberInsert(memberVO);
		
	}

	@Override
	public int idChk(String email) {
		
		return mapper.idChk(email);
	}

	@Override
	public MemberVO memberLogin(MemberDTO memberDTO) {
		MemberVO memberVO = new MemberVO();
		
		memberVO.setEmail(memberDTO.getEmail());
		memberVO.setPassword(memberDTO.getPassword());
		
		return mapper.memberLogin(memberVO);
	}
	
	
	
	
	

}
