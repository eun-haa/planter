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
	
	/* 카트 추가 */
	@Override
	public int addCart(CartDTO cart) {
		// 장바구니 데이터 체크
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
	
	/* 카트 목록 */
	public ArrayList<CartDTO> getCart(String mid){
		return cmapper.getCart(mid);
	}
	
	/* 카트 수량 수정 */
	@Override
	public int modifyCount(CartDTO cart) {
		return cmapper.modifyCount(cart);
	}

	/* 헤더에 카트 수량 */ 
	/*public int headerView(CartDTO cart) {
		System.out.println("service" + cmapper.headerView(cart));
		return cmapper.headerView(cart);
		
	}*/
	
	/* 카트 삭제 */
	@Override
	public int deleteCart(int cartId) {
		return cmapper.deleteCart(cartId);
	}
}
