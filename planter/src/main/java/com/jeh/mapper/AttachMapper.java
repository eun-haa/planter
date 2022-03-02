package com.jeh.mapper;

import java.util.ArrayList;

import com.jeh.domain.AttachFileDTO;

public interface AttachMapper {
	// 게시판 글쓰기할 때 파일과 관련이 되어있는 attach 테이블에 insert
	public void insert(AttachFileDTO notice);
	
	// 게시판 상세페이지에 업로드 된 이미지를 뿌리기 위한 데이터 list
	// 게시판 번호를 AttachFileDTO에 실어서 controller에 넘겨주기
	public ArrayList<AttachFileDTO> fileList(int nno);
}
