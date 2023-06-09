package com.lively.help.controller;

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
import com.lively.help.service.HelpService;
import com.lively.help.vo.HelpVo;
import com.lively.member.vo.MemberVo;
import com.lively.page.vo.PageVo;

@Controller
@RequestMapping("help")
public class HelpController {
	
	//서비스 객체
	private final HelpService hs;
	
	@Autowired
	public HelpController(HelpService hs) {
		this.hs = hs;
	}
	
	//도움 목록 조회
	@GetMapping("list")
    public String list(HelpVo vo, Model model, @RequestParam(defaultValue = "1") int page, String searchValue) {
      
		//서비스 호출
		int listCount = hs.getHelpListCnt();
		int currentPage = page;
		int pageLimit = 5;
		int boardLimit = 5;
		
		PageVo pv = new PageVo(listCount, currentPage, pageLimit, boardLimit);
		List<HelpVo> hvoList = hs.getHelpList(pv, searchValue);
		
		if(hvoList != null) {
			//화면
			model.addAttribute("pv", pv);
			model.addAttribute("hvoList", hvoList);			
		}
		
		return "board/help/help-list";
   }
	
	//도움 작성하기 (화면)
	@GetMapping("write")
	public String write(HttpSession session, HelpVo vo, LocationVo locationVo) {
		List<LocationVo> locationList = hs.getLocationList(locationVo);
		
		session.setAttribute("locationList", locationList);
		
		return "board/help/help-write";
	}
	
	//도움 작성하기
	@PostMapping("write")
	public String write(HelpVo vo, List<MultipartFile> f, HttpSession session, HttpServletRequest req) throws Exception {
		
		//로그인 여부 체크
		MemberVo memberLog = (MemberVo)session.getAttribute("memberLog");
		if(memberLog == null) {
			throw new Exception("로그인 후 이용 가능합니다.");
		}
		
		//데이터 준비(파일)
		String path = req.getServletContext().getRealPath("/resources/upload/help/");
		List<String> changeNameList = FileUploader.upload(f, path);
		List<String> originNameList = FileUploader.getOriginNameList(f);
		
		//데이터 준비(이름 리스트)
		List<FileVo> fvoList = new ArrayList<FileVo>();
		if(changeNameList != null) {
			int size = changeNameList.size();
			for(int i = 0; i < size; i++) {
				FileVo fvo = new FileVo();
				fvo.setOriginName(originNameList.get(i));
				fvo.setChangeName(changeNameList.get(i));
				fvoList.add(fvo);
			}
		}
		
		vo.setWriter(memberLog.getNo());
		
		int result = hs.write(vo, fvoList);
		
		return "redirect:/help/list";
	}
	
	//도움 상세조회
	@GetMapping("detail")
	public String detail(@RequestParam("num") int num, Model model) throws Exception {
		HelpVo vo = hs.getHelp(num);
		
		if(vo == null) {
			model.addAttribute("errorMsg", "조회 실패...");
			return "board/help/help-detail";
		}
		
		model.addAttribute("hvo", vo);
		model.addAttribute("helpNo", num);
		model.addAttribute("path", "/resources/upload/help");
		return "board/help/help-detail";
	}
	
	//도움 수정하기 (화면)
	@GetMapping("edit")
	public String edit(Model model, @RequestParam("num") int num) throws Exception {
		HelpVo vo = hs.getHelp(num);
		
		List<LocationVo> locationList = hs.getLocationList(new LocationVo());
		
		model.addAttribute("hvo", vo);
		model.addAttribute("locationList", locationList);
		
		return "board/help/help-edit";
	}
	
	//도움 수정하기
	@PostMapping("edit")
	public String edit(HelpVo vo, HttpSession session, @RequestParam("locationNo") String locationNo) {
		int result = hs.edit(vo);
		
		LocationVo locationVo = new LocationVo();
	    locationVo.setLocationNo(locationNo);
	    vo.setLocationNo(locationNo);
		
		if(result > 0) {
			return "redirect:/help/detail?num=" + vo.getHelpNo();
		}
		
		session.setAttribute("errorMsg", "도움 글 수정 실패...");
		return "redirect:/help/detail?num=" + vo.getHelpNo();
	}
	
	//도움 삭제하기
	@GetMapping("delete")
	public String delete(String num) throws Exception {
		
		int result = hs.delete(num);
		
		if(result != 1) {
			throw new Exception("도움글 삭제 실패...");
		}
		
		return "redirect:/help/list";
	}
}
