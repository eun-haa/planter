package com.jeh.mapper;

import java.util.ArrayList;

import com.jeh.domain.CartDTO;


public interface CartMapper {
	// 1.장바구니 추가
	public int addCart(CartDTO cart);
	
	// 2.장바구니 목록
	public ArrayList<CartDTO> getCart(String mid);
	
	// 3.장바구니 상품 수량 수정
	public int modifyCount(CartDTO cart);
	
	// 4.장바구니 상품 삭제
	public int deleteCart(int cartId);
	
	/* 장바구니 정보 확인 */
	public CartDTO checkCart(CartDTO cart);
	
	public int cartCount(CartDTO cart);
}
