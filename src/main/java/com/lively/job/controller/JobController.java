package com.lively.job.controller;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lively.job.vo.JobVo;

import lombok.extern.slf4j.Slf4j;


import com.lively.job.service.JobService;

@Slf4j
@Controller
@RequestMapping("job")
public class JobController{
	
	private final JobService js;
	
	@Autowired
	public JobController(JobService js) {
		this.js = js;
	}
	//목록 조회
	@GetMapping("list")
	public String getJobList(Model model) {
	
		List<JobVo>getjobList = js.getJobList();
		System.out.println(getjobList);
	    model.addAttribute("jobList", getjobList);

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