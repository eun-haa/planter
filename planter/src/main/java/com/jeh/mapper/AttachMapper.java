package com.jeh.mapper;

import java.util.ArrayList;

import com.jeh.domain.AttachFileDTO;
import com.jeh.domain.ProductDTO;

public interface AttachMapper {
	/* notice */
	// 게시판 글쓰기할 때 파일과 관련이 되어있는 attach 테이블에 insert
	public void insert(AttachFileDTO notice);
	
	// 게시판 상세페이지에 업로드 된 이미지를 뿌리기 위한 데이터 list
	// 게시판 번호를 AttachFileDTO에 실어서 controller에 넘겨주기
	public ArrayList<AttachFileDTO> fileList(int nno);
	
	// 게시판 글 첨부파일 수정시 기존 파일 삭제
	public void deleteNoticeFile(int pno);
	
	/* product */
	// 게시판 글쓰기할 때 파일과 관련이 되어있는 attach 테이블에 insert
	public void insert2(AttachFileDTO prod);
	
	// 게시판 상세페이지에 업로드 된 이미지를 뿌리기 위한 데이터 list
	// 게시판 번호를 AttachFileDTO에 실어서 controller에 넘겨주기
	public ArrayList<AttachFileDTO> fileList2();
	
	// 상품 상세 설계
	public ProductDTO shopDetail(ProductDTO prod);
	public ArrayList<AttachFileDTO> detailFile(int pno);
	
	// 상품 수정 설계
	// 기존 파일 삭제
	public void deleteFile(int pno);
	
	// 상품 삭제 설계
	// 파일 삭제
	public void deleteFile2(int pno);
	

}
