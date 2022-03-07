package com.jeh.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;


import com.jeh.domain.CartDTO;
import com.jeh.domain.MemberDTO;

import com.jeh.service.CartService;


@Controller
@RequestMapping("cart")
public class CartController {
	@Autowired
	CartService cservice;
	

	
	// 2.카트 추가
	@PostMapping("add")
	public String addCartPOST(CartDTO cart, MemberDTO mdto) {

		// 카트 등록
		cservice.addCart(cart);
		
		System.out.println("장바구니 추가 성공");
		return "redirect:/main";


	}
	
	@GetMapping("list")
	public void cartPageGET(Model model) {
		
		model.addAttribute("list", cservice.getCart());
		System.out.println("cart/list.jsp");
	}
}
