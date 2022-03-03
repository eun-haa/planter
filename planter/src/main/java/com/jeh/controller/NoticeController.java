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
		// 확인용
		System.out.println("notice/write.jsp"); 
	}
	// 1-2.글 쓰기 실행
	@PostMapping("write")
	public String postWrite(NoticeDTO notice) {
		// 글 쓴 내용을 담아서 INSERT
		nservice.write(notice);
		
		// 확인용
		System.out.println("postWrite = " + notice);
		
		// /notice/list로 redirect
		return "redirect:/notice/list";
	}
	
	// 2.글 목록
	@GetMapping("list")
	public void list(Model model, Search sc) {
		/* 글 목록 보여주기 */
		model.addAttribute("list", nservice.list(sc));
		
		/* 글 목록 페이징 */
		// 전체 글 갯수 -> total이라는 새로운 변수를 만들어 count
		int total = nservice.getTotalCount(sc);
		// pager 사용
		model.addAttribute("pager", new PageDTO(sc, total));
		
		// 확인용
		System.out.println("total = " + total);
		System.out.println("notice/list.jsp");
	}
	
	// 3-1.글 상세
	@GetMapping("detail")
	public void detail(NoticeDTO notice, Model model) {
		// nservice.detail(notice)를 "detail"이라는 이름의 모델에 담아서 화면에 보여줄 수 있게
		model.addAttribute("detail", nservice.detail(notice));
		// 확인용
		System.out.println("notice/detail.jsp");
	}
	// 3-2.파일 업로드 관련
	@GetMapping(value="fileList/{nno}", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<ArrayList<AttachFileDTO>> fileList(@PathVariable int nno){
		// 통신 상태가 정상적이면 select된 결과를 보내라
		System.out.println("fileList");
		return new ResponseEntity<>(nservice.fileList(nno), HttpStatus.OK);
	}

	
	// 4-1.글 수정 화면
	@GetMapping("modify")
	public void modify(NoticeDTO notice, Model model) {
		// nservice.detail(notice)를 "detail"이라는 이름의 모델에 담아서 화면에 보여줄 수 있게
		model.addAttribute("detail", nservice.detail(notice));
		
		// 확인용
		System.out.println("notice/modify.jsp");
	}
	
	// 4-2.글 수정 실행
	@PostMapping("modify")
	public String postModify(NoticeDTO notice, RedirectAttributes rttr) {
		nservice.modify(notice);
		
		// 수정 후 내가 수정한 글 상세페이지를 보여주기 위해서
		rttr.addAttribute("nno", notice.getNno());
		
		
		// 확인용
		System.out.println("글 수정 완료");
		
		// /notice/detail로 redirect
		return "redirect:/notice/detail";
	}
	
	// 5.글 삭제
	@GetMapping("delete")
	public String delete(NoticeDTO notice) {
		// delete 실행
		nservice.delete(notice);
		
		// 확인용
		System.out.println("글 삭제 완료");
		
		// /notice/list로 redirect
		return "redirect:/notice/list";
	}
}
