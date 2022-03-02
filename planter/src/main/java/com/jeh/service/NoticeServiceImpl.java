package com.jeh.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jeh.domain.AttachFileDTO;
import com.jeh.domain.NoticeDTO;
import com.jeh.domain.Search;
import com.jeh.mapper.AttachMapper;
import com.jeh.mapper.NoticeMapper;

@Service
public class NoticeServiceImpl implements NoticeService{
	@Autowired
	NoticeMapper nmapper;
	
	@Autowired 
	AttachMapper amapper; // 파일 첨부
	
	// 1.글 쓰기 구현
	@Transactional
	public void write(NoticeDTO notice) {
		
		if(notice.getAttachList() != null) {
			// 제목과 내용을 notice 테이블에 insert
			nmapper.insertSelectKey(notice);
			
			// 파일명,파일경로,파일타입, uuid 값을 attach 테이블에 insert
			// BoardDTO에 있는 attachList를 가져와서 반복문으로 실행하여 attach 변수에 저장
			notice.getAttachList().forEach(attach->{
				attach.setNno(notice.getNno());
				System.out.println("attach 테이블의 nno = " + notice.getNno());
				amapper.insert(attach);
			});
		}else {
			nmapper.write(notice);
		}

	}
	
	// 2.글 목록 구현
	public ArrayList<NoticeDTO> list(Search sc){
		return nmapper.list(sc);
	}
	// 2-2.게시판 페이징 - 글 전체 갯수
	public int getTotalCount(Search sc) {
		return nmapper.getTotalCount(sc);
	}
	
	// 3-1.글 상세 구현
	@Transactional
	public NoticeDTO detail(NoticeDTO notice) {
		// notice 테이블 - hit(조회수) 속성에  +1
		nmapper.hitUpdate(notice);
		
		return nmapper.detail(notice);
	}
	// 3-2.상세페이지에 업로드 된 이미지를 화면에 보여주기 위한 데이터 list 구현
	public ArrayList<AttachFileDTO> fileList(int nno){
		return amapper.fileList(nno);
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
