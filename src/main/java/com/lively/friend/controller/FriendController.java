package com.lively.friend.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FriendController {

	@RequestMapping("friend")
	public String friend() {
		return "board/friend/friend-form";
	}
	
}
