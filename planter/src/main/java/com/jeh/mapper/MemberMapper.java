package com.jeh.mapper;

import java.util.ArrayList;

import com.jeh.domain.MemberDTO;

public interface MemberMapper {
	// 1-1.회원가입 설계
	public void postJoin(MemberDTO mdto);
	
	// 1-2.아이디 중복체크
	public int idCheck(String mid);
	
	// 1-3.이메일 중복체크
	public int emailCheck(String email);
	
	// 2.로그인 설계
	public MemberDTO postLogin(MemberDTO mdto);
	
	// 3.ID 찾기 설계
	public MemberDTO postFindId(String email);
	public int findIdCheck(String email);
	
	// 4.PW 찾기 설계
	/*public MemberDTO postFindPw(MemberDTO mdto);
	public int findPwCheck(String check);*/
	
	public int postFindPw(String email,String mid);
	public int findPwCheck(MemberDTO mdto);
	public void updatePw(MemberDTO mdto);
}
