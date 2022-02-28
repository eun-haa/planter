package com.jeh.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jeh.domain.NoticeDTO;
import com.jeh.domain.Search;
import com.jeh.mapper.NoticeMapper;

@Service
public class NoticeServiceImpl implements NoticeService{
	@Autowired
	NoticeMapper nmapper;
	
	// 1.글 쓰기 구현
	public void write(NoticeDTO notice) {
		nmapper.write(notice);
	}
	
	// 2.글 목록 구현
	public ArrayList<NoticeDTO> list(Search sc){
		return nmapper.list(sc);
	}
	// 2-2.게시판 페이징 - 글 전체 갯수
	public int getTotalCount(Search sc) {
		return nmapper.getTotalCount(sc);
	}
	
	// 3.글 상세 구현
	@Transactional
	public NoticeDTO detail(NoticeDTO notice) {
		// notice 테이블 - hit(조회수) 속성에  +1
		nmapper.hitUpdate(notice);
		
		return nmapper.detail(notice);
	}
	
	// 4.글 수정 구현
	public void modify(NoticeDTO notice) {
		nmapper.modify(notice);
	}
	
	// 5.글 삭제 구현
	public void delete(NoticeDTO notice) {
		nmapper.delete(notice);
	}
}
