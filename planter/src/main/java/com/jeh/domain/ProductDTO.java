package com.jeh.domain;

import java.util.ArrayList;

public class ProductDTO {
	// 상품 아이디
	private int pno;
	// 상품 이름
	private String pname;
	// 상품 가격
	private int pprice;
	// 상품 할인가
	private String pdiscount;
	// 상품 재고
	private int pstock;
	// 상품 설명
	private String pmemo;
	// 상품 업로드 날짜
	private String pregdate;
	// 상품 수정 날짜
	private String pupdate;
	// 상품 조회수
	private int phit;
	// 카테고리 코드
	private int cid;
	
	// file upload를 위해 AttachFileDTO를 NoticeDTO에 포함관계 설정
	private ArrayList<AttachFileDTO> attachList;

	public int getPno() {
		return pno;
	}

	public void setPno(int pno) {
		this.pno = pno;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public int getPprice() {
		return pprice;
	}

	public void setPprice(int pprice) {
		this.pprice = pprice;
	}

	public String getPdiscount() {
		return pdiscount;
	}

	public void setPdiscount(String pdiscount) {
		this.pdiscount = pdiscount;
	}

	public int getPstock() {
		return pstock;
	}

	public void setPstock(int pstock) {
		this.pstock = pstock;
	}

	public String getPmemo() {
		return pmemo;
	}

	public void setPmemo(String pmemo) {
		this.pmemo = pmemo;
	}

	public String getPregdate() {
		return pregdate;
	}

	public void setPregdate(String pregdate) {
		this.pregdate = pregdate;
	}

	public String getPupdate() {
		return pupdate;
	}

	public void setPupdate(String pupdate) {
		this.pupdate = pupdate;
	}

	public int getPhit() {
		return phit;
	}

	public void setPhit(int phit) {
		this.phit = phit;
	}

	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}

	public ArrayList<AttachFileDTO> getAttachList() {
		return attachList;
	}

	public void setAttachList(ArrayList<AttachFileDTO> attachList) {
		this.attachList = attachList;
	}

	@Override
	public String toString() {
		return "ProductDTO [pno=" + pno + ", pname=" + pname + ", pprice=" + pprice + ", pdiscount=" + pdiscount
				+ ", pstock=" + pstock + ", pmemo=" + pmemo + ", pregdate=" + pregdate + ", pupdate=" + pupdate
				+ ", phit=" + phit + ", cid=" + cid + ", attachList=" + attachList + "]";
	}
	
	
	
	
	
	
	
	

	
	
	
	
	
	
	
}
