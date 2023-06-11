package com.lively.chat.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lively.friend.vo.FriendVo;
import com.lively.market.chat.controller.MarketChatController;
import com.lively.market.vo.MarketVo;
import com.lively.member.vo.MemberVo;

@Controller
@RequestMapping("friendfeed")
public class ChatController {
	
private static final Logger logger = LoggerFactory.getLogger(ChatController.class);
	
	/*
	 * @RequestMapping(value = "/", method = RequestMethod.GET) public String
	 * home(Locale locale, Model model) { return "login"; }
	 */
	
	@GetMapping("chat/{no}")
	public String login(@PathVariable(required = true) String no, HttpSession session, MemberVo memberVo, Model model, FriendVo friendVo) {
		
		MemberVo memberLog = (MemberVo) session.getAttribute("memberLog");

		
		session.setAttribute("friendNo", no);
		
		session.setAttribute("memberVo", memberVo);
		session.setAttribute("friendVo", friendVo);
		
		return "chat/chat";
	}
	
}
