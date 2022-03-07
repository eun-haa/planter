package com.jeh.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jeh.domain.CartDTO;
import com.jeh.domain.MemberDTO;

public interface CartService {
	/* 카트 추가 */
	public void addCart(CartDTO cart);
	
	/* 카트 목록 */
	public List<CartDTO> getCart();
	
	
}
