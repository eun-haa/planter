package com.jeh.domain;

public class CartDTO {
	// CART 테이블
	// 카트 아이디
	private int cartId;
	// 회원 아이디
	private String mid;
	// 상품 아이디
	private int pno;
	// 상품 갯수
	private int pcount;
	
	// 상품 정보를 가져오기
	private String pname;
	private int pprice;
	private int pdiscount;
	
	// 최종 가격
	private int totalPrice; 
	
	// 최종 가격을 정하는 함수, setter 안 만든 이유
	public void totalPrice() {
		this.totalPrice = this.pprice * this.pcount;
	}

	public int getCartId() {
		return cartId;
	}

	public void setCartId(int cartId) {
		this.cartId = cartId;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public int getPno() {
		return pno;
	}

	public void setPno(int pno) {
		this.pno = pno;
	}

	public int getPcount() {
		return pcount;
	}

	public void setPcount(int pcount) {
		this.pcount = pcount;
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

	public int getPdiscount() {
		return pdiscount;
	}

	public void setPdiscount(int pdiscount) {
		this.pdiscount = pdiscount;
	}

	public int getTotalPrice() {
		return totalPrice;
	}

	@Override
	public String toString() {
		return "CartDTO [cartId=" + cartId + ", mid=" + mid + ", pno=" + pno + ", pcount=" + pcount + ", pname=" + pname
				+ ", pprice=" + pprice + ", pdiscount=" + pdiscount + ", totalPrice=" + totalPrice + "]";
	}

	
	
	

	
	

	
	
	
	
}
