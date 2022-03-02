package com.jeh.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jeh.domain.NoticeDTO;
import com.jeh.domain.PageDTO;
import com.jeh.domain.ProductDTO;
import com.jeh.domain.Search;
import com.jeh.service.ProductService;

@Controller
public class ShopController {
	@Autowired
	ProductService pservice;
	
	// 1.ADMIN-main 화면
	@GetMapping("admin/main")
	public void main() {
		System.out.println("admin/main.jsp");
	}
	
	// 2-1.상품 등록 화면
	@GetMapping("admin/productReg")
	public void productReg() {
		System.out.println("admin/productReg.jsp");
	}
	// 2-2.상품 등록 실행
	@PostMapping("admin/productReg")
	public String postProductReg(ProductDTO prod) {
		// 글 쓴 내용을 담아서 INSERT
		pservice.productReg(prod);
		
		// 확인용
		System.out.println("postProductReg = " + prod);
		
		return "redirect:/shop/list";
	}
	
	// 3-1.admin 상품 관리 화면
	@GetMapping("admin/list")
	public void adminList(Model model) {
		/* 상품 목록 보여주기 */
		model.addAttribute("list", pservice.shopList());
		System.out.println("admin/list.jsp");
	}
	
	// 3-2.shop 상품 목록 화면
	@GetMapping("shop/list")
	public void shopList(Model model) {
		/* 상품 목록 보여주기 */
		model.addAttribute("list", pservice.shopList());
		
		// 확인용
		System.out.println("shop/list.jsp");
	}
	
	// 4.shop 상품 상세 화면
	@GetMapping("shop/detail")
	public void shopDetail(ProductDTO prod, Model model) {
		/* 상품 목록 보여주기 */
		model.addAttribute("detail", pservice.shopDetail(prod));
		
		// 확인용
		System.out.println("shop/detail.jsp");
	}
	
}
