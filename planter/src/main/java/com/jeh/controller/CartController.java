package com.jeh.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jeh.domain.CartDTO;
import com.jeh.domain.MemberDTO;

import com.jeh.service.CartService;


@Controller
@RequestMapping("cart")
public class CartController {
	@Autowired
	CartService cservice;
	

	
	// 1.장바구니 추가
	@PostMapping("add")
	@ResponseBody
	public int addCartPOST(CartDTO cart, HttpServletRequest request) {
		// 로그인 체크
		HttpSession session = request.getSession();
		MemberDTO mdto = (MemberDTO)session.getAttribute("login");
		if(mdto == null) {
			return 5;
		}
		// 카트 등록
		int result = cservice.addCart(cart);
		
		return result;
	}
	
	// 2.장바구니 목록
	@GetMapping("list/{mid}")
	public String cartPageGET(@PathVariable("mid") String mid, Model model, CartDTO cart) {
		// 해당 아이디가 가진 장바구니 정보를 "cart"라는 변수에 넣기
		model.addAttribute("cart", cservice.getCart(mid));
		
		// cart/list 화면으로 이동
		return "/cart/list";
	}
	
	// 3.장바구니 상품 수량 수정
	@PostMapping("update")
	public String updateCartPOST(CartDTO cart) {
		// 수량 수정
		cservice.modifyCount(cart);
		System.out.println("장바구니 수량 수정 완료");
		
		// 수량이 수정된 장바구니 화면으로 이동
		return "redirect:/cart/list/" + cart.getMid();
		
	}
	// 4.장바구니 상품 삭제
	@PostMapping("delete")
	public String deleteCartPOST(CartDTO cart) {
		// 장바구니 삭제
		cservice.deleteCart(cart.getCartId());
		System.out.println("장바구니 상품 삭제 완료");
		
		// 장바구니 상품 삭제 후 해당 회원의 장바구니 목록으로
		return "redirect:/cart/list/" + cart.getMid();
		
	}
	
	// 5.header에 장바구니 상품 갯수
	@PostMapping("/cartCount")
	@ResponseBody
	public int cartCount(CartDTO cart){
		System.out.println("cartCount 진입");
		// 장바구니 갯수
	    int count = cservice.cartCount(cart);
	    System.out.println("count 확인 결과:" + count);
	    
	    // 장바구니 갯수 리턴
	    return count;
	}
	

}
