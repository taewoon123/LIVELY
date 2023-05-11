package com.lively.friend.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lively.friend.service.FriendService;
import com.lively.friend.vo.FriendVo;

@Controller
@RequestMapping("friend")
public class FriendController {
	
	private final FriendService fs;
	
	public FriendController(FriendService fs) {
		this.fs = fs;
	}
	
	
	@GetMapping("list")
	public String list(Model model) {
		
		List<FriendVo> friendList = fs.getFriendFeed();
		
		model.addAttribute("friendList", friendList);
		return "board/friend/friend-list";
	}
	
	@GetMapping("write")
	public String write() {
		return "board/friend/friend-write";
	}
}
