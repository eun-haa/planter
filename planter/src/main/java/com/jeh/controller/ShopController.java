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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	
	// 3-2.admin 상품 관리 화면
	@GetMapping("admin/list")
	public void adminList(Model model) {
		/* 상품 목록 보여주기 */
		model.addAttribute("list", pservice.shopList());
		System.out.println("admin/list.jsp");
	}

	
	// 4-1.shop 상품 목록 화면
	@GetMapping("shop/list")
	public void shopList(Model model) {
		/* 상품 목록 보여주기 */
		model.addAttribute("list", pservice.shopList());
		
		
		// 확인용
		System.out.println("shop/list.jsp");
	}
	// 4-2.파일 업로드 관련
	// 상품 목록 화면에 이미지 파일 가져오기
	@GetMapping(value="/shop/prodFileList", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<ArrayList<AttachFileDTO>> fileList(){
		// 통신 상태가 정상적이면 select된 결과를 보내기
		System.out.println("prodFileList");
		return new ResponseEntity<>(pservice.fileList2(), HttpStatus.OK);
	}
	@GetMapping(value="/shop/prodInfoList", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<ArrayList<ProductDTO>> fileList2(){
		// 통신 상태가 정상적이면 select된 결과를 보내기
		System.out.println("prodInfoList");
		return new ResponseEntity<>(pservice.shopList(), HttpStatus.OK);
	}
	
	// 5.shop 상품 상세 화면
	@GetMapping("shop/detail")
	public void shopDetail(ProductDTO prod, Model model) {
		/* 상품 목록 보여주기 */
		model.addAttribute("detail", pservice.shopDetail(prod));
		
		// 확인용
		System.out.println("shop/detail.jsp");
	}
	@GetMapping(value="/shop/detailFile/{pno}", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<ArrayList<AttachFileDTO>> fileList(@PathVariable int pno){
		// 통신 상태가 정상적이면 select된 결과를 보내라
		System.out.println("fileList");
		return new ResponseEntity<>(pservice.detailFile(pno), HttpStatus.OK);
	}
	
	// 6-1.admin 상품 수정 화면
	@GetMapping("admin/modify")
	public void modify(ProductDTO prod, Model model) {
		pservice.shopDetail(prod);
		model.addAttribute("detail", pservice.shopDetail(prod));
		
		// 확인용
		System.out.println("admin/modify.jsp");
	}
	// 6-2.admin 상품 수정 실행
	@PostMapping("admin/modify")
	public String postModify(ProductDTO prod, RedirectAttributes rttr) {
		pservice.postModify(prod);
		
		// 수정 후 내가 수정한 글 상세페이지를 보여주기 위해서
		rttr.addAttribute("pno", prod.getPno());
		
		
		// 확인용
		System.out.println("상품 수정 완료");
		
		// /admin/detail로 redirect
		return "redirect:/admin/list";
	}
	
	// 7.admin 상품 삭제
	@GetMapping("admin/delete")
	public String delete(ProductDTO prod) {
		// delete 실행
		pservice.delete(prod);
		
		// 확인용
		System.out.println("상품 삭제 완료");
		
		// /admin/list로 redirect
		return "redirect:/admin/list";
	}
	
}
