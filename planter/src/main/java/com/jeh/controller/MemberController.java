package com.jeh.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jeh.domain.MemberDTO;
import com.jeh.service.MemberService;

@Controller
@RequestMapping("member")
public class MemberController {
	@Autowired
	MemberService mservice;
	
	// 1-1.회원가입 화면
	@GetMapping("join")
	public void join() {
		System.out.println("join.jsp");
	}
	
	// 1-2.회원가입 실행
	@PostMapping("join")
	public String postJoin(MemberDTO mdto) {
		mservice.postJoin(mdto);
		System.out.println("postJoin = " + mdto);
		return "redirect:/main"; // 회원가입 완료시 로그인 화면으로 이동
	}
	

	// 1-3.아이디 중복체크
	@PostMapping("/id_check")
	@ResponseBody
	public int idCheck(@RequestParam("mid") String mid){
		System.out.println("idCheck 진입");
		System.out.println("전달받은 id : " + mid);
	    int data = mservice.idCheck(mid);
	    System.out.println("idCheck 확인 결과:" + data);
	    return data;
	}
	
	// 1-4.이메일 중복체크(아이디 찾기와 비밀번호 찾기를 위해서)
	@PostMapping("/email_check")
	@ResponseBody
	public int emailCheck(@RequestParam("email") String email){
		System.out.println("emailCheck 진입");
		System.out.println("전달받은 email : " + email);
	    int data = mservice.emailCheck(email);
	    System.out.println("emailCheck 확인 결과 : " + data);
	    return data;
	}
	
	// 2-1.로그인 화면
	@GetMapping("login")
	public void login() {
		System.out.println("login.jsp");
	}
	
	// 2-2.로그인 실행
	@PostMapping("login")
	public String postLogin(MemberDTO mdto, HttpSession session) {
		/* mservice.postLogin(mdto)을 MemberDTO login에 저장해서 session에 이용 */
		MemberDTO login = mservice.postLogin(mdto);
		
		/* MemberDTO에 있는 로그인 할 회원 정보를 세션 영역에 login이라는 변수에 저장 */
		// 세션 객체에 "login" 변수에, login 값을 저장(setAttribute)
		session.setAttribute("login", login);
		
		// session 영역에 login이라는 변수("login")에 값이 있으면 로그인 된 채로
		if(session.getAttribute("login") != null) {
			// main 페이지로 이동 = 로그인 성공
			System.out.println("login SUCCESS");
			return "redirect:/main";
		}else {// session 영역에 login이라는 변수("login")에 값이 없으면
			// login 페이지로 다시 이동 = 로그인 실패
			System.out.println("login FAIL");
			return "redirect:/member/login";
		}
	}
	
	// 3.로그아웃
	@GetMapping("logout")
	public String logout(MemberDTO mdto, HttpSession session) {
		// 로그아웃 처리
		session.invalidate();
		// 콘솔 확인용
		System.out.println("logout success");
		// login 페이지로 이동
		return "redirect:/member/login";
	}
	
	// 4-1.ID 찾기 화면
	@GetMapping("findId")
	public void findId() {
		System.out.println("findId.jsp");
	}
		
	
	// 4-2.ID 찾기 결과 화면
	@GetMapping("findIdView")
	public void findIdView() {
		System.out.println("findIdView.jsp");
	}
	
	// 4-3.ID 찾기 실행
	@PostMapping("findId")
	public String postFindId(MemberDTO mdto, Model model) {
		System.out.println("아이디 찾기 버튼 눌렀음");
		System.out.println("memberEmail = " + mdto.getEmail());
				
		if(mservice.findIdCheck(mdto.getEmail()) == 0) {//사용자가 입력한 이메일이 member 테이블에 없으면
			System.out.println("FIND ID FAIL");
			
			// (2)model을 통해 "msg" 변수에 아래 문구를 저장해서 jsp로 보냄 -> jsp에서 스크립트를 사용해 화면에 alert 띄울 것
			model.addAttribute("msg", "이메일을 확인해주세요.");
			// (3)findId.jsp 화면으로 리턴
			return "/member/findId";
		}else {// 사용자가 입력한 이메일이 member 테이블에 있으면(=회원이라면)
			System.out.println("FIND ID SUCCESS");
			
			// (1) model을 통해 "member" 변수에 mservice.postFindId(mdto.getEmail()를 저장
			model.addAttribute("member", mservice.postFindId(mdto.getEmail()));
			// (2) findIdView.jsp 화면으로 리턴(아이디 찾기 결과 화면)
			return "/member/findIdView";
		}
	}
	
	// 5-1.PW 찾기 화면
	@GetMapping("findPw")
	public void findPw() {
		System.out.println("findPw.jsp");
	}
	
	// 5-2.PW 찾기 결과 화면
	@GetMapping("findPwView")
	public void findPwView() {
		System.out.println("findPwView.jsp");
	}
	
	// 5-3.PW 찾기 실행을 위한 임시 비밀번호 생성과 이메일 전송 함수
	// 임시 비밀번호 랜덤 생성
	public static String randomPw (int length) {
		int index = 0;
		char[] charSet = new char[] {
				'0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F','G','H',
				'I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z',
				'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r',
				's','t','u','v','w','x','y','z'};
		
		StringBuffer sb = new StringBuffer();
		for(int i=0;i<length;i++) {
			index = (int) (charSet.length * Math.random());
			sb.append(charSet[index]);
		}
		return sb.toString();
	}
	
	// 임시 비밀번호 발급 - 이메일 전송
	public int sendEmailPw(String passwd, String email) {
		String random_pw = randomPw(6);
		String mailCode = new MailSend().mailSend(email, passwd, random_pw);
		
		MemberDTO mdto = new MemberDTO();
		mdto.setEmail(email);
		mdto.setPasswd(random_pw);
		
		mservice.updatePw(mdto);
		return 0;
	}
	
	// 5-4.PW 찾기 실행
	@PostMapping("findPw")
	public String postFindPw(MemberDTO mdto, Model model) {
		System.out.println("member ID = " + mdto.getMid());
		System.out.println("member email = " + mdto.getEmail());
		
		if(mservice.findPwCheck(mdto)==0) {
			model.addAttribute("msg", "아이디와 이메일을 확인해주세요.");
			System.out.println("FIND PW FAIL");
			return "/member/findPw";
			
		}else {
			mservice.postFindPw(mdto.getEmail(),mdto.getMid());
			model.addAttribute("member", mdto.getEmail());
			System.out.println("FIND PW SUCCESS");
			sendEmailPw(mdto.getMid(), mdto.getEmail());
			return"/member/findPwView";
		}
	}
	


		
		
	

	





}
