package com.lively.notice.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("notice")
public class NoticeController {
	
	@GetMapping("list")
    public String list() {
      return "board/manage/notice/notice-list";
   }
	
	@GetMapping("write")
	public String write() {
		return "board/manage/notice/notice-write";
	}

	@GetMapping("detail")
	public String detail() {
		return "board/manage/notice/notice-detail";
	}
	
}
