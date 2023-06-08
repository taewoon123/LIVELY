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
	public String list( String searchValue, @RequestParam(defaultValue = "1" )int page , JobVo vo, Model model) {
		
		int listCount = js.getJobListCnt();
		int currentPage = page;
		int pageLimit = 5;
		int boardLimit = 5;
		
		
		PageVo pv = new PageVo(listCount, currentPage, pageLimit, boardLimit);


		// 서비스
		List<JobVo> jvoList = js.getJobList(pv, searchValue);
//		List<Map<String, String>> cvoList = js.getCategoryList();

//		model.addAttribute("cvoList" , cvoList);
		model.addAttribute("searchMap", searchValue);
		model.addAttribute("pv", pv);
		model.addAttribute("jvoList", jvoList);

		return "board/job/job-list";
	}

	// 작성하기(화면)
	@GetMapping("write")
	public String write(HttpSession session, JobVo vo, LocationVo locationVo) {
		List<LocationVo> locationList = js.getLocationList(locationVo);
		
		session.setAttribute("locationList", locationList);
		return "board/job/job-write";
	}

	// 작성하기
	@PostMapping("write")
	public String write(JobVo vo, HttpSession session, HttpServletRequest req, List<MultipartFile> f)
			throws Exception {

		MemberVo memberLog = (MemberVo)session.getAttribute("memberLog");
		if(memberLog == null) {
			throw new Exception("로그인 후 이용 가능합니다.");

		}
		

		String path = req.getServletContext().getRealPath("/resources/upload/job/");
		List<String> changeNameList = FileUploader.upload(f, path);
		List<String> originNameList = FileUploader.getOriginNameList(f);

		List<FileVo> fvoList = new ArrayList<FileVo>();
		
		System.out.println(changeNameList);

		if (changeNameList != null) {
			System.out.println(originNameList);
			int size = changeNameList.size();
			for (int i = 0; i < size; i++) {
				FileVo fvo = new FileVo();
				fvo.setOriginName(originNameList.get(i));
				fvo.setChangeName(changeNameList.get(i));
				fvoList.add(fvo);
			}
		}
		
		
		vo.setWriter(memberLog.getNo());

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
	public String detail(String no, Model model, HttpSession session, LocationVo locationVo ,String ano, List<MultipartFile> f) throws Exception {
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
		/*
		 * if(!f.isEmpty()) {
		 * 
		 * String path =
		 * session.getServletContext().getRealPath("/resources/upload/job/"); FileVo fvo
		 * = js.getAttachment(ano); List<String> changeNameList = FileUploader.upload(f,
		 * path); String originNameList = f.getOriginalFilename();
		 * fvo.setOriginName(originNameList); fvo.setChangeName(changeNameList); }
		 */

		return "board/job/job-detail";
	}

	// 수정하기 (작성자 본인만)
	@PostMapping("edit")
	public String edit(JobVo vo, Model model, HttpSession session,@RequestParam("locationNo") String locationNo ,List<MultipartFile> f) throws Exception {
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

	// 파일 다운로드 (방식1)
//		@GetMapping("att/down")
	public void download(HttpServletRequest req, HttpServletResponse resp, String ano) throws Exception {

		// 파일 객체 준비
		String path = req.getServletContext().getRealPath("/resources/upload/board/");
		FileVo fvo = js.getAttachment(ano);
		File f = new File(path + fvo.getChangeName());

		// 바이트 배열로 변환
		byte[] data = FileUtils.readFileToByteArray(f);

		// header 셋팅
//			resp.setContentType("application/octet-stream");	//아래줄과 동일함
		resp.setHeader("Content-Type", "application/octet-stream");
		resp.setHeader("Content-Disposition",
				"attachment; filename=" + "\"" + URLEncoder.encode(fvo.getOriginName(), "UTF-8") + "\"");
		resp.setHeader("Content-Length", data.length + "");
//			resp.setHeader("당근", "유저01입니다.");

		// 내보낼 통로 준비
		ServletOutputStream os = resp.getOutputStream();

		// 파일 객체를 이용해서 통로 준비
		FileInputStream fis = new FileInputStream(f);

		// 데이터 읽고 내보내기 (직접)
//			byte[] buf = new byte[1024];
//			int size = 0;
//			while((size = fis.read(buf)) != -1) {
//				os.write(buf , 0 , size);
//			}

		// 데이터 읽고 내보내기 (라이브러리)

		// 내보내기
		os.write(data);

		/*
		 * Content-Type : 사용자(브라우저)에게 알려주는 이 데이터의 형식 Content-Disposition : 사용자 화면에 표시되는
		 * 다운로드 파일 이름 Content-Length : 데이터의 크기 (사용자 화면에 다운로드 진행상황 표시 가능)
		 * 
		 * 띄어쓰기가 정상적으로 인식되려면, filename="파일명" 형태로 따옴표로 감싸져야함
		 * 
		 * 한글 등 유니코드가 정상처리되려면 다음과 같은 처리가 필요하다. URLEncoder.encode(값,"UTF-8"); 위의 명령은 주소에
		 * 포함될 수 없는 형태의 글자들(%,? 등)을 가능한 형태로 변환
		 */

	}

	// 파일 다운로드 (방식2) //ResponseEntity
	@GetMapping("att/down")
	public ResponseEntity<ByteArrayResource> download2(String ano, HttpServletRequest req) throws Exception {

		// 바디 채우기
		// 파일 객체 준비
		String path = req.getServletContext().getRealPath("/resources/upload/board/");
		FileVo fvo = js.getAttachment(ano);
		File f = new File(path + fvo.getChangeName());
		// 바이트 배열로 변환
		byte[] data = FileUtils.readFileToByteArray(f);
		ByteArrayResource bar = new ByteArrayResource(data);

		// 헤더 채우기 (객체 만들면서 바로 진행)
		// ResponseEntity 만들기
		ResponseEntity<ByteArrayResource> entity = ResponseEntity.ok().contentType(MediaType.APPLICATION_OCTET_STREAM)
				.header(HttpHeaders.CONTENT_DISPOSITION,
						"attachment; filename=" + "\"" + URLEncoder.encode(fvo.getOriginName(), "UTF-8") + "\"")
				.header(HttpHeaders.CONTENT_ENCODING, "UTF-8").contentLength(data.length).body(bar);

		return entity;
	}

}// class
