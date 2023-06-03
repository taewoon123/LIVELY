package com.lively.job.reply.controller;

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
import com.lively.job.reply.service.ReplyService;
import com.lively.job.reply.vo.ReplyVo;
import com.lively.member.vo.MemberVo;

@RestController
@RequestMapping("job/reply")
public class ReplyController {

	private final Gson gson;
	private final ReplyService rs;

	@Autowired
	public ReplyController(ReplyService rs, Gson gson) {
		this.rs = rs;
		this.gson = gson;
	}
	// 이하 생략

	// 댓글 작성
	@PostMapping("write")
	public String write(ReplyVo vo, HttpSession session) {
		MemberVo memberLog = (MemberVo) session.getAttribute("memberLog");
		if (memberLog == null) {
			return "unauthor";
		}
		String writer = memberLog.getNo();
		vo.setWriter(writer);

		int result = rs.write(vo);

		if (result != 1) {
			return "fail";
		}

		return "ok";
	}

	// 댓글 목록 조회
	@GetMapping("list")
	public String list(String jobNo, Model model) {

		// 서비스
		List<ReplyVo> list = rs.getReplyList(jobNo);

		String str = gson.toJson(list);
		
		// 화면 == 문자열내보내기
		return str;
	}
	
	//댓글 삭제 
	@DeleteMapping("delete")
	public String delete(String rno , HttpSession session) throws Exception {
		MemberVo memberLog = (MemberVo) session.getAttribute("memberLog");
		if (memberLog == null) {
			return "unauthor";
		}
		String writer = memberLog.getNo();
		
		ReplyVo rvo = new ReplyVo();
		rvo.setJobReplyNo(rno);
		rvo.setWriter(writer);
		
		int result = rs.delete(rvo);
		
		System.out.println("delete result : " + result);
		
		if(result == 1) {
			return "del-ok";
		}else {
			return "del-fail";
		}
	}
	
	
	

}
