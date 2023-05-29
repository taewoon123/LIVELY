package com.lively.market.chat.controller;

import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lively.market.vo.MarketVo;
import com.lively.member.vo.MemberVo;


@Controller
@RequestMapping("market")
public class MarketChatController {

private static final Logger logger = LoggerFactory.getLogger(MarketChatController.class);
	
	/*
	 * @RequestMapping(value = "/", method = RequestMethod.GET) public String
	 * home(Locale locale, Model model) { return "login"; }
	 */
	
	@GetMapping("marketChat")
	public String login(HttpSession session, MemberVo memberVo, Model model, MarketVo marketVo) {
		
		session.setAttribute("memberVo", memberVo);
		session.setAttribute("marketVo", marketVo);
		
		return "chat/marketChat";
	}
}
