package com.lively.gallery.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;

import com.lively.common.FileUploader;
import com.lively.gallery.service.GalleryService;
import com.lively.gallery.vo.GalleryVo;
import com.lively.member.vo.MemberVo;


@Controller
@RequestMapping("gallery")
public class GalleryController {

	private final GalleryService gs;
	
	@Autowired  //생성자가 1개일때는 Autowired 안써도 된다
	public GalleryController(GalleryService gs) {
		this.gs = gs;
	}
	
	
	//작성 (화면)
	@GetMapping("write")
	public String write(@SessionAttribute(required = false) MemberVo memberLog) {
		
		//로그인 상태 체크
		if(memberLog == null) {
			throw new IllegalStateException("로그인부터 해주세요.");
		}
		
		return "gallery/write";
	}

	//작성
	@PostMapping("write")
	public String write(HttpServletRequest request, MultipartFile file, GalleryVo galleryVo, @SessionAttribute MemberVo memberLog) {
		//로그인 상태 체크
		if(memberLog == null) {
			throw new IllegalStateException("로그인부터 해주세요.");
		}
		
		String path = request.getServletContext().getRealPath("/resources/upload/market/");
		String changeName = FileUploader.upload(file, path);
		
		String writerNo = memberLog.getNo();
		String originName = file.getOriginalFilename();
		
		galleryVo.setWriterNo(writerNo);
		galleryVo.setOriginName(originName);
		galleryVo.setChangeName(changeName);
		
		System.out.println(galleryVo);
		
		//서비스
		int result = gs.write(galleryVo);
		
		if(result != 1) {
			throw new IllegalStateException("갤러리 작성 실패");
		}
		
		//결과
		return "redirect:/gallery/list";
	}
	
	//목록 조회
	@GetMapping("list")
	public String list(Model model) {
		
		List<GalleryVo> galleryVoList = gs.getGalleryList();
		
		model.addAttribute("galleryVoList", galleryVoList);
		
		System.out.println(galleryVoList);
		
		return "gallery/list";
	}
	
	//상세 조회
	@GetMapping("detail/{no}")
	public String detail(@PathVariable(required = true) String no, Model model) {  //경로변수 no (위에 작성한 {no}가 no에 전달된다)  //required = true : 기본값이라 작성 안해도됨
		
		GalleryVo galleryVo = gs.getGallery(no);
		
		model.addAttribute("galleryVo", galleryVo);
		
		return "gallery/detail";
	}
	
//	//수정 (화면)
//	@GetMapping("edit")
//	public String edit() {
//		return "gallery/edit";
//	}
//	
//	//수정
//	@PostMapping("edit")
//	public String edit(GalleryVo galleryVo) {
//		return "redirect:/home";
//	}
//	
//	//삭제
//	@GetMapping("delete")
//	public String delete(String no) {
//		return "redirect:/home";
//	}
}
