package com.jeh.service;

import java.util.ArrayList;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jeh.domain.CartDTO;

import com.jeh.mapper.CartMapper;
import com.jeh.mapper.MemberMapper;

@Service
public class CartServiceImpl implements CartService{
	@Autowired
	CartMapper cmapper;
	
	@Autowired
	MemberMapper mmapper;
	
	@Override
	public void addCart(CartDTO cart) {
		cmapper.addCart(cart);
	}
	
	/* 카트 목록 */
	public ArrayList<CartDTO> getCart(){
		return cmapper.getCart();
	}
	


}
