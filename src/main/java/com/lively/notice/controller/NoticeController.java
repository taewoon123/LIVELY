package com.lively.notice.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.lively.notice.page.vo.PageVo;
import com.lively.notice.service.NoticeService;
import com.lively.notice.vo.NoticeVo;

@Controller
@RequestMapping("notice")
public class NoticeController {
	
	//서비스 객체
	private final NoticeService ns;
	
	@Autowired
	public NoticeController(NoticeService ns) {
		this.ns = ns;
	}
	
	@GetMapping("list")
    public String list(Model model) {
		
		//서비스 호출
//		int listCount = ns.getNoticeListCnt();
//		int currentPage = page;
//		int pageLimit = 5;
//		int boardLimit = 10;
		
		List<NoticeVo> nvoList = ns.getNoticeList();
		
		//화면
		model.addAttribute("nvoList", nvoList);
		
		return "board/manage/notice/notice-list";
   }
	
	//공지사항 작성하기 (화면)
	@GetMapping("write")
	public String write() {
		return "board/manage/notice/notice-write";
	}
	
	//공지사항 작성하기
	@PostMapping("write")
	public String write(NoticeVo vo, HttpSession session) {
		
		int result = ns.write(vo);
		
		if(result == 1) {
			session.setAttribute("alertMsg", "공지사항 작성 완료");
		} else {
			session.setAttribute("alertMsg", "공지사항 작성 실패");
		}
		
		return "redirect:/notice/list"; 
	}

	@GetMapping("detail")
	public String detail() {
		return "board/manage/notice/notice-detail";
	}
	
}
