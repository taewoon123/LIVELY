package com.lively.friend.controller;

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
import org.springframework.web.multipart.MultipartFile;

import com.lively.common.FileUploader;
import com.lively.common.FileVo;
import com.lively.friend.service.FriendService;
import com.lively.friend.vo.FriendVo;
import com.lively.member.vo.MemberVo;

@Controller
@RequestMapping("friend")
public class FriendController {
	
	private final FriendService fs;
	
	@Autowired
	public FriendController(FriendService fs) {
		this.fs = fs;
	}
	
	//피드목록
	@GetMapping("list")
	public String list(Model model) {
		
		List<FriendVo> friendList = fs.getFriendFeed();
		
		model.addAttribute("friendList", friendList);
		return "board/friend/friend-list";
	}
	
	//피드작성(화면)
	@GetMapping("write")
	public String write() {
		return "board/friend/friend-write";
	}
	
	//피드작성
	@PostMapping("write")
	public String write(FriendVo vo , List<MultipartFile> f, HttpSession session, HttpServletRequest requestion) throws Exception {
		
		//로그인 여부 체크
	      MemberVo memberLog = (MemberVo) session.getAttribute("memberLog");
	      if (memberLog == null) {
	         throw new Exception("로그인 후 이용가능합니다.");
	      }
	      
	   //데이터 준비 (파일)
	      String path = requestion.getServletContext().getRealPath("/resources/upload/friend");
	      List<String> changeNameList = FileUploader.upload(f, path);
	      List<String> originNameList = FileUploader.getOriginNameList(f);

	   //데이터 준비 (이름 리스트)
	      List<FileVo> fvoList = new ArrayList<FileVo>();
	      int size = changeNameList.size();
	      for (int i = 0; i < size; i++) {
	         FileVo fvo = new FileVo();
	         fvo.setOriginName(originNameList.get(i));
	         fvo.setChangeName(changeNameList.get(i));
	         fvoList.add(fvo);
	      }
	      
	      vo.setWriter(memberLog.getNo());
	      
	      int result = fs.write(vo, fvoList);
	      if (changeNameList != null && result < 1) {
	         throw new Exception("게시글 작성 실패");
	      }

	      
	      return "redirect:/board/friend/friend-list";
		
		
	}
}
