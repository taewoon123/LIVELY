package com.lively.help.controller;

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
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.lively.common.FileUploader;
import com.lively.common.FileVo;
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
    public String list(HelpVo vo, Model model, @RequestParam(defaultValue = "1") int page) {
      
		//서비스 호출
		int listCount = hs.getHelpListCnt();
		int currentPage = page;
		int pageLimit = 5;
		int boardLimit = 5;
		
		PageVo pv = new PageVo(listCount, currentPage, pageLimit, boardLimit);
		List<HelpVo> hvoList = hs.getHelpList(pv);
		
		//화면
		model.addAttribute("pv", pv);
		model.addAttribute("hvoList", hvoList);
		return "board/help/help-list";
   }
	
	//도움 작성하기 (화면)
	@GetMapping("write")
	public String write() {
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
		
		if(result == 1) {
			session.setAttribute("alertMsg", "도움글 작성 완료");
		} else {
			session.setAttribute("alertMsg", "도움글 작성 실패");
		}
		
		return "redirect:/help/list";
	}
	
	//도움 상세조회
	@GetMapping("detail")
	public String detail(String num, Model model) throws Exception {
		HelpVo vo = hs.getHelp(num);
		
		if(vo == null) {
			model.addAttribute("errorMsg", "조회 실패...");
			return "board/help/help-detail";
		}
		
		model.addAttribute("hvo", vo);
		model.addAttribute("helpNo", num);
		model.addAttribute("path", "resources/upload/help");
		return "board/help/help-detail";
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
	
	//파일다운로드
	@GetMapping("att/down")
	public void download(HttpServletRequest req, HttpServletResponse resp, String ano) throws Exception {
		
		//파일 객체 준비
		String path = req.getServletContext().getRealPath("/resources/upload/help/");
		FileVo fvo = hs.getAttachment(ano);
		File f = new File(path + fvo.getChangeName());
		
		byte[] data = FileUtils.readFileToByteArray(f);
		
		resp.setHeader("Content-Type", "application/octet-stream");
		resp.setHeader("Content-Disposition", "attachment; filename=" + "\"" + URLEncoder.encode(fvo.getOriginName(), "UTF-8") + "\"");
		resp.setHeader("Content-Length", data.length + "");
		
		//내보낼 통로 준비
		ServletOutputStream os = resp.getOutputStream();
		FileInputStream fis = new FileInputStream(f);
		
		os.write(data);
	}
	
}
