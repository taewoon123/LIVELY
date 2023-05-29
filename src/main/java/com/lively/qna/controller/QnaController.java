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

import com.lively.member.vo.MemberVo;
import com.lively.page.vo.PageVo;
import com.lively.qna.service.QnaService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("qna")
public class QnaController {
	
		private final QnaService qs;
		
		@Autowired
		public QnaController(QnaService qs) {
			this.qs = qs;
			
		}

	//목록 조회
		@GetMapping("list")
		public String getQnaList(@RequestParam(defaultValue = "1") int page , @RequestParam Map<String , String> searchMap,  Model model) {
			
			//데이터
			int listCount = qs.getCnt(searchMap);
			int currentPage = page;
			int pageLimit = 5;
			int boardLimit = 10;
			PageVo pv = new PageVo(listCount, currentPage, pageLimit, boardLimit);
			
			//서비스
			List<QnaVo> qvoList = qs.getQnaList(pv, searchMap);
			List<Map<String, String>> cvoList = qs.CategoryList();
			
			model.addAttribute("cvoList" , cvoList);
			model.addAttribute("searchMap" , searchMap);
			model.addAttribute("pv" , pv);
			model.addAttribute("qvoList" , qvoList);
			return "board/manage/qna/qna-list";
		}
		
		//공지사항 작성하기 (화면)
		@GetMapping("write")
		public String write() {
			return "board/manage/qna/qna-write";
		}
		
		// 작성하기
		@PostMapping("write")
		public String write(QnaVo vo, HttpSession session) throws Exception {
			
			//로그인 여부 체크
//			MemberVo memberVo = (MemberVo) session.getAttribute("Membervo");
//			if( memberVo == null ) {
//				throw new Exception("로그인 후 이용 가능합니다.");
//			}
//			
			int result = qs.write(vo);
			
			if(result == 1) {
				session.setAttribute("alertMsg", "qna 작성 완료");
			} else {
				session.setAttribute("alertMsg", "qna 작성 실패");
			}
			
			return "redirect:/qna/list"; 
		}

		// 상세조회
		@GetMapping("detail")
		public String detail(String no, Model model) throws Exception {
			QnaVo vo = qs.getQna(no);
			if(vo == null) {
				System.out.println(vo);
				model.addAttribute("errorMsg", "조회 실패...");
				return "common/error-page";
			}
			
			model.addAttribute("qvo", vo);
			model.addAttribute("qnaNo",no);
			return "board/manage/qna/qna-detail";
		}
		
		
		// 수정하기
		@PostMapping("edit")
		public String edit(QnaVo vo, Model model, HttpSession session) {
			
			int result = qs.edit(vo);
			
			if(result != 1) {
				model.addAttribute("errorMsg", "수정실패...");
				return "common/error-page";
			}
			
			session.setAttribute("alertMsg", "수정성공!!");
			return "redirect:qna/detail?no=" + vo.getQnaNo();
		}
		
		//삭제하기
		@GetMapping("delete")
		public String delete(String no, HttpSession session) throws Exception {
			
			int result = qs.delete(no);
			
			if(result != 1) {
				throw new Exception("삭제 실패...");
			}
			
			session.setAttribute("alertMsg", "삭제 성공!");
			return "redirect:/qna/list";
		}
		
	}
