package com.lively.friend.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("friend")
public class FriendController {

	@GetMapping("form")
	public String friend() {
		return "board/friend/friend-form";
	}
	
}
