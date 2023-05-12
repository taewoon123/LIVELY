package com.lively.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lively.member.service.MemberService;
import com.lively.member.vo.MemberVo;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("member")
public class MemberController {

	private final MemberService ms;

	@Autowired
	public MemberController(MemberService ms) {
		this.ms = ms;
	}

	// 회원가입 화면
	@GetMapping("join")
	public void join() {
	}

	// 회원가입 처리
	@PostMapping("join")
	public String join(MemberVo vo, HttpServletRequest req, HttpSession session, Model model) throws Exception {

		// 서비스
		int result = ms.join(vo);

		if (result != 1) {
			// 에러메세지 담아서 forwording 하기
			model.addAttribute("errorMsg", "회원가입 실패");
			return "member/join";
		}
		session.setAttribute("alertMsg", "회원가입 성공!");
		return "redirect:/member/login";

	}// join

	// 아이디 중복확인
	@RequestMapping("id-check") // url은 케밥케이스로
	@ResponseBody // 문자 그대로 반환되도록
	public String idCheck(String id) {

		int result = ms.checkId(id);

		if (result > 0) {
			return "isDup";
		} else {
			return "notDup";
		}
	}//idCheck

	@GetMapping("login")
	public String login() {
		return "member/login";
	}

	@PostMapping("login")
	public String login(MemberVo memberVo,HttpSession session) {
		MemberVo memberLog = ms.login(memberVo);

		if (memberLog == null) {
			session.setAttribute("memberLoginAlert","아이디 또는 비밀번호를 확인해주세요.");
			System.out.println(memberLog);
			return "member/login";
		}
		System.out.println(memberLog);
		session.setAttribute("memberLog",memberLog);
		return "redirect:/main";
	}

	@GetMapping("my-info")
	public String myInfo(HttpSession session) {
		if (session.getAttribute("memberLog") == null) {
			session.setAttribute("myInfoAlert", "로그인이 필요합니다.");
			return "member/login";
		}
			return "member/my-info";
	}

	@GetMapping("my-board")
	public void myBoard() {

	}

	@GetMapping("my-feed")
	public void myFeed() {
	}

}// class
