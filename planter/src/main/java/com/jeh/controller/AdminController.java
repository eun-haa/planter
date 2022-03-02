package com.jeh.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jeh.domain.ProductDTO;
import com.jeh.service.NoticeService;
import com.jeh.service.ProductService;

@Controller
@RequestMapping("admin")
public class AdminController {
	@Autowired
	ProductService pservice;
	
	// 1.ADMIN-main 화면
	@GetMapping("main")
	public void main() {
		System.out.println("/admin/main.jsp");
	}
	
	// 2-1.상품 등록 화면
	@GetMapping("productReg")
	public void productReg() {
		System.out.println("/admin/productReg.jsp");
	}
	// 2-2.상품 등록 실행
	@PostMapping("productReg")
	public String postProductReg(ProductDTO prod) {
		// 글 쓴 내용을 담아서 INSERT
		pservice.productReg(prod);
		
		// 확인용
		System.out.println("postProductReg = " + prod);
		
		// /notice/list로 redirect
		return "redirect:/shop/list";
	}
}
