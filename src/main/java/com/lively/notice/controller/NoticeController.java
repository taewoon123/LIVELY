package com.lively.notice.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.lively.page.vo.PageVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.lively.admin.vo.AdminVo;
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
	
	//공지사항 목록 조회
	@GetMapping("list")
    public String list(Model model, @RequestParam(defaultValue = "1") int page, String searchValue) {
		
		//서비스 호출
		int listCount = ns.getNoticeListCnt();
		int currentPage = page;
		int pageLimit = 5;
		int boardLimit = 5;
		
		PageVo pv = new PageVo(listCount, currentPage, pageLimit, boardLimit);
		List<NoticeVo> nvoList = ns.getNoticeList(pv, searchValue);
		
		//화면
		model.addAttribute("pv", pv);
		model.addAttribute("nvoList", nvoList);
		return "board/manage/notice/notice-list";
   }
	
	//공지사항 작성하기 (화면 / 관리자)
	@GetMapping("write")
	public String write(HttpSession session, Model model) {
		AdminVo adminLog = (AdminVo) session.getAttribute("adminLog");
		
		if(adminLog == null) {
			model.addAttribute("errorMsg", "잘못된 접근입니다.");
			return "common/error-page";
		}
		
		String adminId = adminLog.getAdminId();
		boolean isAdmin = "admin".equals(adminId);
		
		if(!isAdmin) {
			model.addAttribute("errorMsg", "잘못된 접근입니다.");
			return "common/error-page";
		}
		
		return "board/manage/notice/notice-write";
	}
	
	//공지사항 작성하기
	@PostMapping("write")
	public String write(NoticeVo vo, HttpSession session) {
		
		int result = ns.write(vo);
		
		if(result != 1) {
			session.setAttribute("alertMsg", "공지사항 작성 실패");
		}
		
		return "redirect:/notice/list"; 
	}

	//공지사항 상세조회
	@GetMapping("detail")
	public String detail(String num, Model model) throws Exception {
		NoticeVo vo = ns.getNotice(num);
		
		if(vo == null) {
			model.addAttribute("errorMsg", "조회 실패...");
			return "common/error-page";
		}
		
		model.addAttribute("vo", vo);
		return "board/manage/notice/notice-detail";
	}
	
	//공지사항 수정하기
	@PostMapping("edit")
	public String edit(NoticeVo vo, Model model, HttpSession session) {
		AdminVo adminLog = (AdminVo) session.getAttribute("adminLog");
		String adminId = "";
		if(adminLog != null) {
			adminId = adminLog.getAdminId();
		}
		
		if(!"admin".equalsIgnoreCase(adminId)) {
			model.addAttribute("errorMsg", "잘못된 요청입니다...");
			return "common/error-page";
		}
		
		int result = ns.edit(vo);
		
		if(result != 1) {
			model.addAttribute("errorMsg", "수정실패...");
			return "common/error-page";
		}
		
		return "redirect:/notice/detail?num=" + vo.getNoticeNo();
	}
	
	//공지사항 삭제하기
	@GetMapping("delete")
	public String delete(String num, RedirectAttributes ra) throws Exception {
		
		int result = ns.delete(num);
		
		if(result != 1) {
			throw new Exception("공지사항 삭제 실패...");
		}
		
		return "redirect:/notice/list";
	}
	
}
