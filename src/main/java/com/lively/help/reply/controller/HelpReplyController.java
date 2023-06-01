package com.lively.help.reply.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;
import com.lively.help.reply.service.HelpReplyService;
import com.lively.help.reply.vo.HelpReplyVo;
import com.lively.member.vo.MemberVo;

@RestController
@RequestMapping("help/reply")
public class HelpReplyController {

	private final Gson gson;
	private final HelpReplyService hrs;
	
	@Autowired
	public HelpReplyController(HelpReplyService hrs, Gson gson) {
		this.hrs = hrs;
		this.gson = gson;
	}
	
	//댓글 작성
	@PostMapping("write")
	public String write(HelpReplyVo vo, HttpSession session) {
		MemberVo memberLog = (MemberVo) session.getAttribute("memberLog");
		if(memberLog == null) {
			return "unauthor";
		}
		
		String writer = memberLog.getNo();
		vo.setWriter(writer);
		
		System.out.println(vo);
		
		int result = hrs.write(vo);
		
		if(result != 1) {
			return "fail";
		}
		
		return "ok";
	}
	
	//댓글 목록 조회
	@GetMapping("list")
	public String list(String helpNo) {
		//서비스
		List<HelpReplyVo> list = hrs.getHelpReplyList(helpNo);
		
		String str = gson.toJson(list);
		
		return str;
	}
	
}
