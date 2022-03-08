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
import org.springframework.web.bind.annotation.ResponseBody;

import com.jeh.domain.CartDTO;
import com.jeh.domain.MemberDTO;

import com.jeh.service.CartService;


@Controller
@RequestMapping("cart")
public class CartController {
	@Autowired
	CartService cservice;
	

	
	// 1.카트 추가
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
	
	// 2.카트 목록
	@GetMapping("list/{mid}")
	public String cartPageGET(@PathVariable("mid") String mid, Model model) {
		
		model.addAttribute("cart", cservice.getCart(mid));
		
		return "/cart/list";
	}
	
	// 3.카트 수량 수정
	@PostMapping("update")
	public String updateCartPOST(CartDTO cart) {
		
		cservice.modifyCount(cart);
		System.out.println("카트 수량 수정 완료");
		
		return "redirect:/cart/list/" + cart.getMid();
		
	}
}
