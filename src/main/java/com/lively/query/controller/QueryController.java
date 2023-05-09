package com.lively.query.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("query")
public class QueryController {

	@GetMapping("list")
	public String list() {
		return "/board/query/query-list";
	}
	
	@GetMapping("detail")
	public String detail() {
		return "/board/query/query-detail";
	}
	
	@GetMapping("write")
	public String write() {
		return "/board/query/query-write";
	}
	
}
