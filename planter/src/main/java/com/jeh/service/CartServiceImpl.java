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
	
	// 1.장바구니 추가
	@Override
	public int addCart(CartDTO cart) {
		// 장바구니 정보 확인
		CartDTO checkCart = cmapper.checkCart(cart);
		
		if(checkCart != null) {
			return 2;
		}
		
		// 장바구니 등록 & 에러 시 0반환
		try {
			return cmapper.addCart(cart);
		} catch (Exception e) {
			return 0;
		}

	}
	
	// 2.장바구니 목록
	@Override
	public ArrayList<CartDTO> getCart(String mid){
		return cmapper.getCart(mid);
	}
	
	// 3.장바구니 상품 수량 수정
	@Override
	public int modifyCount(CartDTO cart) {
		return cmapper.modifyCount(cart);
	}
	
	// 4.장바구니 상품 삭제
	@Override
	public int deleteCart(int cartId) {
		return cmapper.deleteCart(cartId);
	}
	
	// 5.header 장바구니 갯수
	@Override
	public int cartCount(CartDTO cart) {
		return cmapper.cartCount(cart);
	}
}
