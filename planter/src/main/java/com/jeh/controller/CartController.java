package com.jeh.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

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
	@PostMapping("/add")
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
	

}
