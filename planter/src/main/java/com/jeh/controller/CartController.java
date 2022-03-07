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
import com.jeh.domain.PageDTO;
import com.jeh.domain.Search;
import com.jeh.service.CartService;
import com.jeh.service.NoticeService;

@Controller
@RequestMapping("cart")
public class CartController {
	@Autowired
	CartService cservice;
	
	// 1.카트 기본 화면
	@GetMapping("list")
	public void cart () {
		System.out.println("cart/list - basic.jsp");
	}
	
	// 2.카트 추가
	@PostMapping("add")
	public String addCartPOST(CartDTO cart, MemberDTO mdto) {

		// 카트 등록
		cservice.addCart(cart);
		
		System.out.println("장바구니 추가 성공");
		return "redirect:/main";


	}
	
	@GetMapping("list/{mid}")
	public String cartPageGET(Model model) {
		
		model.addAttribute("cart", cservice.getCart());
		
		return "redirect:/cart/list";
	}
}
