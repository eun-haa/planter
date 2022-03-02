package com.jeh.domain;

import java.util.ArrayList;

public class NoticeDTO {
	// 글 번호
	private int nno;
	// 글 제목
	private String title;
	// 글 내용
	private String content;
	// 글 작성자
	private String writer;
	// 글 작성일
	private String regdate;
	// 글 조회수
	private int hit;
	// file upload를 위해 AttachFileDTO를 NoticeDTO에 포함관계 설정
	private ArrayList<AttachFileDTO> attachList;
	
	public int getNno() {
		return nno;
	}
	public void setNno(int nno) {
		this.nno = nno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public ArrayList<AttachFileDTO> getAttachList() {
		return attachList;
	}
	public void setAttachList(ArrayList<AttachFileDTO> attachList) {
		this.attachList = attachList;
	}
	@Override
	public String toString() {
		return "NoticeDTO [nno=" + nno + ", title=" + title + ", content=" + content + ", writer=" + writer
				+ ", regdate=" + regdate + ", hit=" + hit + ", attachList=" + attachList + "]";
	}
	
	
	
	
	
	
	
	
	
}
