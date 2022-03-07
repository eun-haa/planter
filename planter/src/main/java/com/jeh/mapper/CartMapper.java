package com.jeh.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jeh.domain.CartDTO;
import com.jeh.domain.MemberDTO;

public interface CartMapper {
	/* 카트 추가 */
	public void addCart(CartDTO cart);
	
	/* 카트 삭제 */
	public int deleteCart(int cartId);
	
	/* 카트 수량 수정 */
	public int modifyCount(CartDTO cart);
	
	/* 카트 목록 */
	public List<CartDTO> getCart();	
	
	/* 카트 확인 */
	public CartDTO checkCart(CartDTO cart);
	
	
}
