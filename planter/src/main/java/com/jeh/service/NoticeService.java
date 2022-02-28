package com.jeh.service;

import java.util.ArrayList;

import com.jeh.domain.NoticeDTO;

public interface NoticeService {
	// 1.글 쓰기 설계
	public void write(NoticeDTO notice);
	
	// 2.글 목록 설계
	public ArrayList<NoticeDTO> list();
	
	// 3.글 상세 설계
	public NoticeDTO detail(NoticeDTO notice);
	
	// 4.글 수정 설계
	public void modify(NoticeDTO notice);
}
