package com.jeh.mapper;

import java.util.ArrayList;

import com.jeh.domain.BoardDTO;

public interface BoardMapper {
	// 1.글쓰기 설계
	public void write(BoardDTO board);
	
	// 2.글목록 설계
	public ArrayList<BoardDTO> list();
	
	// 3.글상세 설계
	public BoardDTO detail(BoardDTO board);
	
	// 4.글 수정 설계
	public void modify(BoardDTO board);
}
