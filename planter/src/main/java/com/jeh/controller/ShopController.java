package com.jeh.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jeh.domain.AttachFileDTO;
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
	// 3-3.파일 업로드 관련
	// 상품 목록 화면에 이미지 파일 가져오기
	@GetMapping(value="/shop/fileList2", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<ArrayList<AttachFileDTO>> fileList(){
		// 통신 상태가 정상적이면 select된 결과를 보내기
		System.out.println("fileList2");
		return new ResponseEntity<>(pservice.fileList2(), HttpStatus.OK);
	}
	
	@GetMapping(value="/shop/fileList3", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<ArrayList<ProductDTO>> fileList2(){
		// 통신 상태가 정상적이면 select된 결과를 보내기
		System.out.println("shopList");
		return new ResponseEntity<>(pservice.shopList(), HttpStatus.OK);
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
