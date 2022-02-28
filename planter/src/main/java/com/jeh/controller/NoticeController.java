package com.jeh.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jeh.domain.NoticeDTO;
import com.jeh.domain.PageDTO;
import com.jeh.domain.Search;
import com.jeh.service.NoticeService;

@Controller
@RequestMapping("notice")
public class NoticeController {
	@Autowired
	NoticeService nservice;
	
	// 1-1.글 쓰기 화면
	@GetMapping("write")
	public void write() {
		System.out.println("notice/write.jsp"); 
	}
	// 1-2.글 쓰기 실행
	@PostMapping("write")
	public String postWrite(NoticeDTO notice) {
		nservice.write(notice);
		System.out.println("postWrite = " + notice);
		
		return "redirect:/notice/list";
	}
	
	// 2.글 목록
	@GetMapping("list")
	public void list(Model model, Search sc) {
		model.addAttribute("list", nservice.list(sc));
		model.addAttribute("pager", new PageDTO(sc, 199));
		System.out.println("notice/list.jsp");
	}
	
	// 3.글 상세
	@GetMapping("detail")
	public void detail(NoticeDTO notice, Model model) {
		
		model.addAttribute("detail", nservice.detail(notice));
		System.out.println("notice/detail.jsp");
	}
	
	// 4-1.글 수정 화면
	@GetMapping("modify")
	public void modify(NoticeDTO notice, Model model) {
		model.addAttribute("detail", nservice.detail(notice));
		
		// 콘솔 테스트
		System.out.println("notice/modify.jsp");
	}
	
	// 4-2.글 수정 실행
	@PostMapping("modify")
	public String postModify(NoticeDTO notice, RedirectAttributes rttr) {
		nservice.modify(notice);
		
		// 수정 후 내가 수정한 글 상세페이지를 보여주기 위해서
		rttr.addAttribute("nno", notice.getNno());
		
		
		// 콘솔 테스트
		System.out.println("글 수정 완료");
		
		return "redirect:/notice/detail";
	}
	
	// 5.글 삭제
	@PostMapping("delete")
	public String delete(NoticeDTO notice, Model model) {
		nservice.delete(notice);
		System.out.println("글 삭제 완료");
		return "redirect:/notice/list";
	}
}
