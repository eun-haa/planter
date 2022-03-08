package com.jeh.service;

import java.util.ArrayList;


import com.jeh.domain.CartDTO;


public interface CartService {
	/* 카트 추가 */
	public int addCart(CartDTO cart);
	
	/* 카트 목록 */
	public ArrayList<CartDTO> getCart(String mid);
	
	/* 카트 수량 수정 */
	public int modifyCount(CartDTO cart);
	
	/* 헤더에 카트 수량 */ 
	//public int headerView(CartDTO cart);
	
	/* 카트 삭제 */
	public int deleteCart(int cartId);
}
