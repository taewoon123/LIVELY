package com.lively.qna.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.lively.qna.vo.QnaVo;
import com.lively.admin.vo.AdminVo;
import com.lively.member.vo.MemberVo;
import com.lively.notice.service.NoticeService;
import com.lively.notice.vo.NoticeVo;
import com.lively.page.vo.PageVo;
import com.lively.qna.service.QnaService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("")

public class QnaController {

	private final QnaService qs;
	private final NoticeService ns;

	@Autowired
	public QnaController(QnaService qs, NoticeService ns) {
		this.qs = qs;
		this.ns = ns;

	}

	// 메인페이지 목록 조회
	@GetMapping("main")
	public String getQnaListMain(Model model) {

		List<QnaVo> qvoListMain = qs.getQnaListMain();
		//notice랑 같은 컨트롤러 사용하기위해 적음
		List<NoticeVo> nvoListMain = ns.getNoticeListMain();

		model.addAttribute("qvoList", qvoListMain);
		model.addAttribute("nvoList", nvoListMain);
		return "main";
	}

	// 목록 조회
	@GetMapping("qna/list")
	public String list(String searchValue, @RequestParam(defaultValue = "1") int page, QnaVo vo, Model model) {

		int listCount = qs.getQnaListCnt();
		int currentPage = page;
		int pageLimit = 5;
		int boardLimit = 5;

		PageVo pv = new PageVo(listCount, currentPage, pageLimit, boardLimit);
		List<QnaVo> qvoList = qs.getQnaList(pv, searchValue);

		// 화면
		model.addAttribute("pv", pv);
		model.addAttribute("qvoList", qvoList);
		return "board/manage/qna/qna-list";
	}

	// 작성하기 (화면)
	@GetMapping("qna/write")
	public String write(HttpSession session, QnaVo vo) throws Exception {
		
		// 로그인 여부 체크
		MemberVo memberLog = (MemberVo) session.getAttribute("memberLog");
		if (memberLog == null) {
			throw new Exception("로그인 후 이용 가능합니다.");
		}
		vo.setWriter(memberLog.getNo());
		return "board/manage/qna/qna-write";
	}

	// 작성하기
	@PostMapping("qna/write")
	public String write(QnaVo vo, HttpSession session) {
		 MemberVo memberLog = (MemberVo) session.getAttribute("memberLog");
		    if (memberLog != null) {
		        vo.setWriter(memberLog.getNo());
		    }
		    
		    int result = qs.write(vo);


		if (result == 1) {
			session.setAttribute("alertMsg", "qna 작성 완료");
			System.out.println(vo);
		} else {
			session.setAttribute("alertMsg", "qna 작성 실패");
		}

		return "redirect:/qna/list";
	}

	// 상세조회
	@GetMapping("qna/detail")
	public String detail(String no, Model model) throws Exception {
		
		QnaVo vo = qs.getQna(no);
		
		if (vo == null) {
			model.addAttribute("errorMsg", "조회 실패...");
			return "common/error-page";
		}

		model.addAttribute("qvo", vo);
		model.addAttribute("qnaNo", no);
		return "board/manage/qna/qna-detail";
	}

	//수정하기(작성자만)
	@PostMapping("qna/edit")
	public String edit(QnaVo vo, Model model, HttpSession session) {
		
		int result = qs.edit(vo);

		if (result != 1) {
			System.out.println(vo);
			model.addAttribute("errorMsg", "수정실패...");
			return "common/error-page";
		} else {
			session.setAttribute("alertMsg", "수정성공!!");
			return "redirect:/qna/detail?no=" + vo.getQnaNo();
		}
	}

	//답변 작성
	@PostMapping("qna/reply")
	public String reply(QnaVo vo, Model model, HttpSession session) {
		int result = qs.reply(vo);

		if (result != 1) {
			
			model.addAttribute("errorMsg", "답변 작성 실패..");
			return "common/error-page";
		} else {
			session.setAttribute("alertMsg", "답변 작성 성공!!");
			return "redirect:/qna/detail?no=" + vo.getQnaNo();
		}
	}

	/*
	 * AdminVo adminLog = (AdminVo) session.getAttribute("adminLog"); String adminId
	 * = ""; if(adminLog != null) { adminId = adminLog.getAdminId(); }
	 * 
	 * if(!"admin".equalsIgnoreCase(adminId)) { model.addAttribute("errorMsg",
	 * "잘못된 요청입니다..."); return "common/error-page"; }
	 */

	// 삭제하기
	@GetMapping("qna/delete")
	public String delete(String no, HttpSession session) throws Exception {

		int result = qs.delete(no);

		if (result != 1) {
			throw new Exception("삭제 실패...");
		}

		session.setAttribute("alertMsg", "게시물 삭제 완료");
		return "redirect:/qna/list";
	}

}
