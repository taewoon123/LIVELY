package com.lively.job.controller;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.lively.job.vo.JobVo;
import com.lively.job.page.vo.PageVo;
import com.lively.job.service.JobService;
import com.lively.job.vo.JobVo;

@Controller
@RequestMapping("job")
public class JobController{
	
	private JobService js;
	
	@Autowired
	public JobController(JobService js) {
		this.js = js;
	}
	//목록 조회
	@GetMapping("list")
	public String getJobList(Model model) {
	
		List<JobVo> jobList = JobService.getJobList();
	    model.addAttribute("jobList", jobList);
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