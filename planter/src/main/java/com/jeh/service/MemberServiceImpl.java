package com.jeh.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jeh.domain.MemberDTO;
import com.jeh.mapper.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService{
	@Autowired
	MemberMapper mmapper;
	
	// 1-1.회원가입 구현
	public void postJoin(MemberDTO mdto) {
		mmapper.postJoin(mdto);
	}
	
	// 1-2.아이디 중복체크
    @Override
    public int idCheck(String mid) {
        int data = mmapper.idCheck(mid);
        return data;
    }
    
	// 1-3.이메일 중복체크
    @Override
    public int emailCheck(String email) {
        int data = mmapper.emailCheck(email);
        return data;
    }
    
    // 2.로그인 구현
    public MemberDTO getLogin(MemberDTO mdto) {
    	return mmapper.getLogin(mdto);
    }
	/*public int loginCheck(MemberDTO mdto) {
		return mmapper.loginCheck(mdto);
	}*/
    @Override
    public int loginCheck(String mid, String passwd) {
    	int data = mmapper.loginCheck(mid, passwd);
        return data;
    }
    
    // 3.ID 찾기 구현
	public MemberDTO postFindId(String email) {
		return mmapper.postFindId(email);
	}
	public int findIdCheck(String email) {
		return mmapper.findIdCheck(email);
	}
	
	// 4.PW 찾기 구현	
	public void postFindPw(String email,String mid) {
		System.out.println("service");
	}
	public int findPwCheck(MemberDTO mdto) {
		return mmapper.findPwCheck(mdto);
	}
	public void updatePw(MemberDTO mdto) {
		mmapper.updatePw(mdto);
	}
	
	// 5.MY ACCOUNT-MODIFY 수정 설계
	public void postMyAccMod(MemberDTO mdto) {
		mmapper.postMyAccMod(mdto);
	}
}
