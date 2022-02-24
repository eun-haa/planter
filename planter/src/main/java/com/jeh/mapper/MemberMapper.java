package com.jeh.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.jeh.domain.MemberDTO;

public interface MemberMapper {
	// 1-1.회원가입 설계
	public void postJoin(MemberDTO mdto);
	
	// 1-2.아이디 중복체크
	public int idCheck(String mid);
	
	// 1-3.이메일 중복체크
	public int emailCheck(String email);
	
	// 2.로그인 설계
	public MemberDTO getLogin(MemberDTO mdto);
	//public int loginCheck(MemberDTO mdto);
	public int loginCheck(@Param("mid")String mid, @Param("passwd")String passwd);
	
	// 3.ID 찾기 설계
	public MemberDTO postFindId(String email);
	public int findIdCheck(String email);
	
	// 4.PW 찾기 설계
	public int postFindPw(String email,String mid);
	public int findPwCheck(MemberDTO mdto);
	public void updatePw(MemberDTO mdto);
}
