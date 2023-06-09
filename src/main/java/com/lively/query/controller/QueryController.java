package com.lively.query.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.lively.common.FileUploader;
import com.lively.common.FileVo;
import com.lively.common.locaion.vo.LocationVo;
import com.lively.member.vo.MemberVo;
import com.lively.page.vo.PageVo;
import com.lively.query.service.QueryService;
import com.lively.query.vo.QueryVo;

@Controller
@RequestMapping("query")
public class QueryController {

	// 서비스 객체
	private final QueryService qs;

	@Autowired
	public QueryController(QueryService qs) {
		this.qs = qs;
	}

	// 질문 목록 조회
	@GetMapping("list")
	public String list(QueryVo vo, Model model, @RequestParam(defaultValue = "1") int page, String searchValue) {

		// 서비스 호출
		int listCount = qs.getQueryListCnt();

		int currentPage = page;
		int pageLimit = 5;
		int boardLimit = 5;

		PageVo pv = new PageVo(listCount, currentPage, pageLimit, boardLimit);
		List<QueryVo> qvoList = qs.getQueryList(pv, searchValue);

		if (qvoList != null) {
			// 화면
			model.addAttribute("pv", pv);
			model.addAttribute("qvoList", qvoList);
		}

		return "board/query/query-list";
	}

	// 질문 작성하기 (화면)
	@GetMapping("write")
	public String write(HttpSession session, QueryVo vo, LocationVo locationVo) {
		List<LocationVo> locationList = qs.getLocationList(locationVo);

//		session.setAttribute("queryVo", vo);
		session.setAttribute("locationList", locationList);

		return "board/query/query-write";
	}

	// 질문 작성하기
	@PostMapping("write")
	public String write(QueryVo vo, List<MultipartFile> f, HttpSession session, HttpServletRequest req)
			throws Exception {

//		session.setAttribute("", );
//		System.out.println();

		// 로그인 여부 체크
		MemberVo memberLog = (MemberVo) session.getAttribute("memberLog");
		if (memberLog == null) {
			throw new Exception("로그인 후 이용 가능합니다.");
		}

		// 데이터 준비(파일)
		String path = req.getServletContext().getRealPath("/resources/upload/query/");
		List<String> changeNameList = FileUploader.upload(f, path);
		List<String> originNameList = FileUploader.getOriginNameList(f);

		// 데이터 준비(이름 리스트)
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

		vo.setWriter(memberLog.getNo());

		System.out.println(" con-write-setWriter 한 vo : " + vo);

		int result = qs.write(vo, fvoList);

		return "redirect:/query/list";
	}

	// 게시글 상세조회
	@GetMapping("detail")
	public String detail(@RequestParam("num") int num, Model model) throws Exception {
		QueryVo vo = qs.getQuery(num);

		if (vo == null) {
			model.addAttribute("errorMsg", "조회 실패...");
			return "board/query/query-detail";
		}

		model.addAttribute("qvo", vo);
		model.addAttribute("queryNo", num);
		model.addAttribute("path", "/resources/upload/query");
		return "board/query/query-detail";
	}

	// 수정하기 (화면)
	@GetMapping("edit")
	public String edit(Model model, @RequestParam("num") int num) throws Exception {
		QueryVo vo = qs.getQuery(num);

		List<LocationVo> locationList = qs.getLocationList(new LocationVo());

		model.addAttribute("qvo", vo);
		model.addAttribute("locationList", locationList);

		return "board/query/query-edit";
	}

	// 수정하기
	@PostMapping("edit")
	public String edit(QueryVo vo, HttpSession session, @RequestParam("locationNo") String locationNo) {
		
		int result = qs.edit(vo);

		LocationVo locationVo = new LocationVo();
		locationVo.setLocationNo(locationNo);
		vo.setLocationNo(locationNo);

		if (result > 0) {
			return "redirect:/query/detail?num=" + vo.getQueryNo();
		}

		session.setAttribute("errorMsg", "도움 글 수정 실패...");
		return "redirect:/query/detail?num=" + vo.getQueryNo();
	}

	// 삭제하기
	@GetMapping("delete")
	public String delete(String num) throws Exception {

		int result = qs.delete(num);

		if (result != 1) {
			throw new Exception("도움글 삭제 실패...");
		}

		return "redirect:/query/list";
	}

}// class
