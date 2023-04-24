package com.lively.qna.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class QnaController {
		@RequestMapping("qnal")
		public String qnal() {
			return "board/manage/qna/qna-list";
		}
		
		@RequestMapping("qnaw")
		public String qnaw() {
			return "board/manage/qna/qna-write";
		}
		
		@RequestMapping("qnad")
		public String qnad() {
			return "board/manage/qna/qna-detail";
		}
		
}
		
