package com.lively.help.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HelpController {
	@RequestMapping("help-list")
    public String notice() {
      return "board/help/help-list";
   }
	
	@RequestMapping("help-write")
	public String help_write() {
		return "board/help/help-write";
	}
	
	@RequestMapping("help-detail")
	public String help_detail() {
		return "board/help/help-detail";
	}
}
