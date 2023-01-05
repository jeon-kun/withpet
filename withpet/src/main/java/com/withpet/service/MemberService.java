package com.withpet.service;

import com.withpet.domain.MemberVO;
import com.withpet.dto.MemberDTO;


public interface MemberService {
	
	public void memberRegister(MemberDTO memberDTO);
	
	public int idChk(String email);
	
	public MemberVO memberLogin(MemberDTO memberDTO);

}
