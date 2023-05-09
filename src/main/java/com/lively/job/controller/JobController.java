package com.lively.job.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("job")
public class JobController {
	@GetMapping("list")
	public String jobl() {
		return "board/job/job-list";
	}
	@GetMapping("write")
	public String jobw() {
		return "board/job/job-write";
	}
	@GetMapping("detail")
	public String jobd() {
		return "board/job/job-detail";
	}


}
