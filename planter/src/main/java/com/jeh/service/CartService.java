package com.jeh.service;

import java.util.ArrayList;


import com.jeh.domain.CartDTO;


public interface CartService {
	/* 카트 추가 */
	public void addCart(CartDTO cart);
	
	/* 카트 목록 */
	public ArrayList<CartDTO> getCart();
	
	
}
