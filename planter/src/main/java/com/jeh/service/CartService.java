package com.jeh.service;

import java.util.ArrayList;


import com.jeh.domain.CartDTO;


public interface CartService {
	// 1.장바구니 추가
	public int addCart(CartDTO cart);
	
	// 2.장바구니 목록
	public ArrayList<CartDTO> getCart(String mid);
	
	// 3.장바구니 상품 수량 수정
	public int modifyCount(CartDTO cart);
	
	// 4.장바구니 상품 삭제
	public int deleteCart(int cartId);
	
	// 5.header 장바구니 갯수
	public int cartCount(CartDTO cart);
}
