package com.lively.notice.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class NoticeController {
	@RequestMapping("notice-list")
    public String notice() {
      return "board/manage/notice/notice-list";
   }

	@RequestMapping("notice-detail")
	public String notice_detail() {
		return "board/manage/notice/notice-detail";
	}

}
