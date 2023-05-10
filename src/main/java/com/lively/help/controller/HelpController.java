package com.lively.help.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("help")
public class HelpController {
	
	@GetMapping("list")
    public String list() {
      return "board/help/help-list";
   }
	
	@GetMapping("write")
	public String write() {
		return "board/help/help-write";
	}
	
	@GetMapping("detail")
	public String detail() {
		return "board/help/help-detail";
	}
	
}
