package com.lively.qna.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("qna")
public class QnaController {
		@GetMapping("list")
		public String qnal() {
			return "board/manage/qna/qna-list";
		}
		
		@GetMapping("write")
		public String qnaw() {
			return "board/manage/qna/qna-write";
		}
		
		@GetMapping("detail")
		public String qnad() {
			return "board/manage/qna/qna-detail";
		}
		
}
		
