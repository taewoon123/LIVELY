package com.lively.friend.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("friend")
public class FriendController {

	@GetMapping("form")
	public String form() {
		return "board/friend/friend-form";
	}
	
	@GetMapping("list")
	public String list() {
		return "board/friend/friend-list";
	}
	
}
