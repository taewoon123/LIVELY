package com.lively.help.reply.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
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
		
		int result = hrs.write(vo);
		
		if(result != 1) {
			return "fail";
		}
		
		return "ok";
	}
	
	//댓글 목록 조회
	@GetMapping("list")
	public String list(String helpNo, Model model) {
		//서비스
		List<HelpReplyVo> list = hrs.getHelpReplyList(helpNo);
		
		String str = gson.toJson(list);
		
		return str;
	}
	
	//댓글 삭제
	@DeleteMapping("delete")
	public String delete(String rno, HttpSession session) throws Exception {
		MemberVo memberLog = (MemberVo) session.getAttribute("memberLog");
		if(memberLog == null) {
			return "unauthor";
		}
		String writer = memberLog.getNo();
		
		HelpReplyVo rvo = new HelpReplyVo();
		rvo.setHelpReplyNo(rno);
		rvo.setWriter(writer);
		
		int result = hrs.delete(rvo);
		
		System.out.println("delete result : " + result);
		
		if(result == 1) {
			return "삭제 성공!";
		} else {
			return "삭제 실패...";
		}
	}
	
}
