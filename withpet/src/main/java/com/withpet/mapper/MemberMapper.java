package com.withpet.mapper;

import com.withpet.domain.MemberVO;

public interface MemberMapper {
	
	//회원가입
	public void memberInsert(MemberVO vo);
	
	//아이디 중복검사
	public int idChk(String email);
	
	//로그인
	public MemberVO memberLogin(MemberVO vo);

}
