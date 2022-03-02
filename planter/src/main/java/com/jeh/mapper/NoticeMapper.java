package com.jeh.mapper;

import java.util.ArrayList;

import com.jeh.domain.NoticeDTO;
import com.jeh.domain.Search;

public interface NoticeMapper {
	// 1-1.글 쓰기 설계
	public void write(NoticeDTO notice);
	public void insertSelectKey(NoticeDTO notice);
	
	// 2-1.글 목록 설계
	public ArrayList<NoticeDTO> list(Search sc);
	// 2-2.게시판 페이징 - 글 전체 갯수
	public int getTotalCount(Search sc);
	
	// 3-1.글 상세 설계
	public NoticeDTO detail(NoticeDTO notice);
	// 3-2.글 상세 - 조회수 업데이트 설계
	public void hitUpdate(NoticeDTO notice);
	
	// 4.글 수정 설계
	public void modify(NoticeDTO notice);
	
	// 5.글 삭제 설계
	public void delete(NoticeDTO notice);
}
