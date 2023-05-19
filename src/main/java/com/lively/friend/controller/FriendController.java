package com.lively.friend.controller;

import java.io.File;
import java.io.FileInputStream;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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


import com.lively.common.FileUploader;
import com.lively.common.FileVo;
import com.lively.friend.service.FriendService;
import com.lively.friend.vo.FriendVo;
import com.lively.member.vo.MemberVo;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("friend")
@Slf4j
public class FriendController {
	
	private final FriendService fs;
	
	@Autowired
	public FriendController(FriendService fs) {
		this.fs = fs;
	}
	
	//피드목록
	@GetMapping("list")
	public String list(Model model,  @RequestParam Map<String, String> searchMap) {
		
		List<FriendVo> friendList = fs.getFriendFeed(searchMap);
		List<Map<String, String>> lvoList = fs.getLocationNoList();
		
		model.addAttribute("friendList", friendList);
		model.addAttribute("searchMap" , searchMap);
		model.addAttribute("lvoList", lvoList);
		return "board/friend/friend-list";
	}
	
	//피드작성(화면)
	@GetMapping("write")
	public String write(HttpSession session) {
		//로그인 여부 체크
		MemberVo memberLog = (MemberVo) session.getAttribute("memberLog");
		if (memberLog== null) {
			session.setAttribute("alertMsg", "로그인을 먼저 해주세요");
			return "redirect:/friend/list";
			
		}
		return "board/friend/friend-write";
	}
	
	
	//피드작성
	@PostMapping("write")
	public String write(FriendVo vo , List<MultipartFile> f, HttpSession session, HttpServletRequest requestion) throws Exception {
		MemberVo memberLog = (MemberVo) session.getAttribute("memberLog");
		
	   //데이터 준비 (파일)
	      String path = requestion.getServletContext().getRealPath("/resources/upload/friend/");
	      List<String> changeNameList = FileUploader.upload(f, path);
	      List<String> originNameList = FileUploader.getOriginNameList(f);

	   //데이터 준비 (이름 리스트)
	      List<FileVo> friendList = new ArrayList<FileVo>();
	      if(changeNameList != null) {
	    	  int size = changeNameList.size();
	    	  for (int i = 0; i < size; i++) {
	    		  FileVo fvo = new FileVo(); 
	    		  fvo.setOriginName(originNameList.get(i));
	    		  fvo.setChangeName(changeNameList.get(i));
	    		  friendList.add(fvo);
	    	  }
	      }
	      
	    //데이터 준비 (지역 관련)
	      if ("없음".equals(vo.getLocationNo())) {
	          vo.setLocationNo(null);
	       }
	      vo.setWriter(memberLog.getNo());
	      
	      int result = fs.write(vo, friendList);
	      if ( result <= 0 ) {
	         throw new Exception("게시글 작성 실패");
	      }
	      
	      return "redirect:/friend/list";
		
		// 수정하기(작성자만)
	      
	    // 삭제하기(작성자만)
	      
	    
	}
	
	
}
