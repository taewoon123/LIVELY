package com.lively.job.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class JobController {
	@RequestMapping("jobl")
	public String jobl() {
		return "board/job/job-list";
	}
	@RequestMapping("jobw")
	public String jobw() {
		return "board/job/job-write";
	}
	@RequestMapping("jobd")
	public String jobd() {
		return "board/job/job-detail";
	}

}
