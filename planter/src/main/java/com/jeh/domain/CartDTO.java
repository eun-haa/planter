package com.jeh.domain;

public class CartDTO {
	// 카트 아이디
	private int cartId;
	// 회원 아이디
	private String mid;
	// 상품 아이디
	private int pid;
	// 상품 갯수
	private int pcount;
	
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
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public int getPcount() {
		return pcount;
	}
	public void setPcount(int pcount) {
		this.pcount = pcount;
	}
	
	@Override
	public String toString() {
		return "CartDTO [cartId=" + cartId + ", mid=" + mid + ", pid=" + pid + ", pcount=" + pcount + "]";
	}
	
	
}
