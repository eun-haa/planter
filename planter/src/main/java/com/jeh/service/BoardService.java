package com.jeh.service;

import java.util.ArrayList;

import com.jeh.domain.BoardDTO;

public interface BoardService {
	// 1.글 쓰기 설계
	public void write(BoardDTO board);
	
	// 2.글 목록 설계
	public ArrayList<BoardDTO> list();
	
	// 3.글 상세 설계
	public BoardDTO detail(BoardDTO board);
	
	// 4.글 수정 설계
	public void modify(BoardDTO board);
}
