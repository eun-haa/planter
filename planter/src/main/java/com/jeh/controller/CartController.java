package com.jeh.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jeh.service.CartService;
import com.jeh.service.NoticeService;

@Controller
@RequestMapping("shop")
public class CartController {
	@Autowired
	CartService cservice;
	
	
	@GetMapping("cart")
	public void cart () {
		System.out.println("shop/cart.jsp");
	}
}
