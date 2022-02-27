package com.jeh.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jeh.domain.BoardDTO;
import com.jeh.service.BoardService;

@Controller
@RequestMapping("board")
public class BoardController {
	@Autowired
	BoardService bservice;
	
	// 1-1.글 쓰기 화면
	@GetMapping("write")
	public void write() {
		System.out.println("board/write.jsp"); 
	}
	// 1-2.글 쓰기 실행
	@PostMapping("write")
	public String postWrite(BoardDTO board) {
		bservice.write(board);
		System.out.println("postWrite = " + board);
		
		return "redirect:/board/list";
	}
	
	// 2.글 목록
	@GetMapping("list")
	public void list(Model model) {
		bservice.list();
		model.addAttribute("list", bservice.list());
		System.out.println("board/list.jsp");
	}
	
	// 3.글 상세
	@GetMapping("detail")
	public void detail(BoardDTO board, Model model) {
		bservice.detail(board);
		
		model.addAttribute("detail", bservice.detail(board));
		System.out.println("board/detail.jsp");
	}
	
	// 4-1.글 수정 화면
	@GetMapping("modify")
	public void modify(BoardDTO board, Model model) {
		model.addAttribute("detail", bservice.detail(board));
		
		// 콘솔 테스트
		System.out.println("board/modify.jsp");
	}
	
	// 4-2.글 수정 실행
	@PostMapping("modify")
	public String PostModify(BoardDTO board, RedirectAttributes rttr) {
		bservice.modify(board);
		
		// 수정 후 내가 수정한 글 상세페이지을 보여주기 위해서
		rttr.addAttribute("bno", board.getBno());
		
		
		// 콘솔 테스트
		System.out.println("글 수정 완료");
		
		return "redirect:/board/detail";
	}
}
