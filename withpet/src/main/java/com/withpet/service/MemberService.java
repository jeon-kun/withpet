package com.withpet.service;

import com.withpet.domain.MemberVO;


public interface MemberService {
	
	public void memberRegister(MemberVO memberVO);
	
	public int idChk(String email);
	
	public MemberVO memberLogin(MemberVO memberVO);

}
