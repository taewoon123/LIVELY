package com.lively.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("member")

public class MemberController {

	@GetMapping("login")
	public void login() {}
	
	@GetMapping("join")
	public void join() {}
	
	@GetMapping("edit")
	public void edit() {}

	@GetMapping("mypage")
	public void mypage() {}
	
}//class