package com.lively.app.notice.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("notice-list")
public class NoticeController {
   @GetMapping
   public String notice() {
      return "board/manage/notice/notice-list";
   }
}