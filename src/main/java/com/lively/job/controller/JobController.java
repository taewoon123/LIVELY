package com.lively.job.controller;

import java.io.File;
import java.io.FileInputStream;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.lively.job.vo.JobVo;
import com.lively.member.vo.MemberVo;
import com.lively.page.vo.PageVo;

import lombok.extern.slf4j.Slf4j;

import com.lively.common.FileUploader;
import com.lively.common.FileVo;
import com.lively.common.locaion.vo.LocationVo;
import com.lively.job.service.JobService;

@Slf4j
@Controller
@RequestMapping("job")
public class JobController {

	private final JobService js;

	@Autowired
	public JobController(JobService js) {
		this.js = js;
	}

//	목록 조회
	@GetMapping("list")
	public String list(String searchValue, @RequestParam(defaultValue = "1") int page, JobVo vo, Model model) {

		int listCount = js.getJobListCnt();
		int currentPage = page;
		int pageLimit = 5;
		int boardLimit = 5;

		PageVo pv = new PageVo(listCount, currentPage, pageLimit, boardLimit);

		// 서비스
		List<JobVo> jvoList = js.getJobList(pv, searchValue);

		model.addAttribute("searchMap", searchValue);
		model.addAttribute("pv", pv);
		model.addAttribute("jvoList", jvoList);

		return "board/job/job-list";
	}

	// 작성하기(화면)
	@GetMapping("write")
	public String write(HttpSession session, JobVo vo, LocationVo locationVo) throws Exception {
		
		MemberVo memberLog = (MemberVo) session.getAttribute("memberLog");
		if (memberLog == null) {
			throw new Exception("로그인 후 이용 가능합니다.");
		}

		vo.setWriter(memberLog.getNo());
		List<LocationVo> locationList = js.getLocationList(locationVo);

		
		session.setAttribute("locationList", locationList);
		return "board/job/job-write";
	}

	// 작성하기
	@PostMapping("write")
	public String write(JobVo vo, HttpSession session, HttpServletRequest req, List<MultipartFile> f) {

		
		String path = req.getServletContext().getRealPath("/resources/upload/job/");
		List<String> changeNameList = FileUploader.upload(f, path);
		List<String> originNameList = FileUploader.getOriginNameList(f);

		List<FileVo> fvoList = new ArrayList<FileVo>();

		if (changeNameList != null) {
			int size = changeNameList.size();
			for (int i = 0; i < size; i++) {
				FileVo fvo = new FileVo();
				fvo.setOriginName(originNameList.get(i));
				fvo.setChangeName(changeNameList.get(i));
				fvoList.add(fvo);
			}
		}

		int result = js.write(vo, fvoList);

		if (result == 1) {
			session.setAttribute("alertMsg", " 작성 완료");
		} else {
			session.setAttribute("alertMsg", " 작성 실패");
		}

		return "redirect:/job/list";

	}

	// 상세조회 (조회수)
	@GetMapping("detail")
	public String detail(String no, Model model, HttpSession session, LocationVo locationVo, String ano,
			List<MultipartFile> f) throws Exception {
		JobVo vo = js.getJob(no);
		List<LocationVo> locationList = js.getLocationList(locationVo);

		session.setAttribute("locationList", locationList);

		if (vo == null) {

			model.addAttribute("errorMsg", "조회 실패...");
			return "common/error-page";
		}

		model.addAttribute("jvo", vo);
		model.addAttribute("jobNo", no);
		model.addAttribute("path", "/resources/upload/job");

		return "board/job/job-detail";
	}

	// 수정하기 화면

	// 수정하기 (작성자 본인만)
	@PostMapping("edit")
	public String edit(JobVo vo, Model model, HttpSession session, @RequestParam("locationNo") String locationNo)
			throws Exception {
		int result = js.edit(vo);

		LocationVo locationVo = new LocationVo();
		locationVo.setLocationNo(locationNo);
		vo.setLocationNo(locationNo);

		if (result != 1) {
			model.addAttribute("errorMsg", "수정실패...");
			return "common/error-page";
		} else {
			session.setAttribute("alertMsg", "수정성공!!");

			return "redirect:/job/detail?no=" + vo.getJobNo();
		}
	}

	// 삭제하기 (작성자 본인만)
	@GetMapping("delete")
	public String delete(String no) throws Exception {

		int result = js.delete(no);

		if (result != 1) {

			throw new Exception("삭제 실패...");
		}

		return "redirect:/job/list";
	}


}// class
