package com.withpet.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.withpet.domain.MemberVO;
import com.withpet.mapper.MemberMapper;

import lombok.extern.log4j.Log4j;


@Service
@Log4j
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private MemberMapper mapper;
	
	@Override
	public void memberRegister(MemberVO memberVO) {
		
		
		memberVO.setAuthority("ROLE_USER");
		mapper.memberInsert(memberVO);
		
	}

	@Override
	public int idChk(String email) {
		
		return mapper.idChk(email);
	}

	@Override
	public MemberVO memberLogin(MemberVO memberVO) {
 
		
		return mapper.memberLogin(memberVO);
	}
	
	
	
	
	

}
