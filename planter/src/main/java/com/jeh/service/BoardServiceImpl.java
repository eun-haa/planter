package com.jeh.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jeh.domain.BoardDTO;
import com.jeh.mapper.BoardMapper;

@Service
public class BoardServiceImpl implements BoardService{
	@Autowired
	BoardMapper bmapper;
	
	// 1.글 쓰기 구현
	public void write(BoardDTO board) {
		bmapper.write(board);
	}
	
	// 2.글 목록 구현
	public ArrayList<BoardDTO> list(){
		return bmapper.list();
	}
	
	// 3.글 상세 설계
	public BoardDTO detail(BoardDTO board) {
		return bmapper.detail(board);
	}
	
	// 4.글 수정 설계
	public void modify(BoardDTO board) {
		bmapper.modify(board);
	}
}
