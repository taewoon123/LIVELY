package com.lively.friend.controller;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.lively.common.FileUploader;
import com.lively.common.FileVo;
import com.lively.common.locaion.vo.LocationVo;
import com.lively.friend.service.FriendService;
import com.lively.friend.vo.FriendVo;
import com.lively.member.vo.MemberVo;
import com.lively.page.vo.PageVo;

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
	public String list(Model model,  String searchValue, LocationVo locationVo , String no) {
		ArrayList<FriendVo> fvoList = fs.getFriendFeed(searchValue);
		List<LocationVo> locationList = fs.getLocationList(locationVo);
		/* List<Map<String, String>> LocationList = fs.getLocationNoList(); */
		
		
		if (fvoList != null) {
			model.addAttribute("fvoMap", fvoList);
			model.addAttribute("locationList", locationList);
			
		}
		
		return "board/friend/friend-list";
	}
	
	

	//피드작성(화면)
	@GetMapping("write")
	public String write(HttpSession session, Model model, LocationVo locationVo) {
		//로그인 여부 체크
		MemberVo memberLog = (MemberVo) session.getAttribute("memberLog");
		
		List<LocationVo> locationList = fs.getLocationList(locationVo);
		
		if (memberLog== null) {
			session.setAttribute("alertMsg", "로그인을 먼저 해주세요");
			return "redirect:/friend/list";
			
		}
		
		model.addAttribute("locationList", locationList);
		
		return "board/friend/friend-write";
	}
	
	
	//피드작성
	@PostMapping("write")
	public String write(Model model, LocationVo locationVo, FriendVo vo , List<MultipartFile> f, HttpSession session, HttpServletRequest requestion) throws Exception {
		MemberVo memberLog = (MemberVo) session.getAttribute("memberLog");
		
		
		List<LocationVo> locationList = fs.getLocationList(locationVo);
		model.addAttribute("locationList", locationList);
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
		
	}
	// 수정하기화면(작성자만)
	@GetMapping("edit/{no}")
	public String edit(@PathVariable(required = true) String no, Model model, LocationVo locationVo) throws Exception {
		
		List<FriendVo> friendDetail = fs.getFeed(no);
		
		List<LocationVo> locationList = fs.getLocationList(locationVo);
		
		model.addAttribute("friendDetail", friendDetail);
		model.addAttribute("locationList" , locationList);
		return "board/friend/friend-detail";
	}
	
	//수정하기(작성자만)
	@PostMapping("edit")
	public String edit(FriendVo friendVo, HttpSession session, RedirectAttributes ra, @RequestParam("locationNo") String locationNo) {
		
		int result = fs.updateFeed(friendVo);
		
		LocationVo locationVo = new LocationVo();
	    locationVo.setLocationNo(locationNo);
	    friendVo.setLocationNo(locationNo);
		
		if(result != 1) {
			session.setAttribute("alertMsg", "수정 실패ㅠㅠ");
			
			return "redirect:/member/my-friend-feed";
		}
		
		session.setAttribute("alertMsg", "수정 성공 ~ !");
		ra.addAttribute("no", friendVo.getFriendNo());
		
		return "redirect:/member/my-friend-feed";
	}
	
	// 삭제하기(작성자만)
	@GetMapping("delete/{no}")
	public String delete(FriendVo friendVo, HttpSession session, @PathVariable(required = true) String no) {
		int result = fs.delete(no);
		
		if(result != 1) {
			session.setAttribute("alertMsg", "삭제 실패ㅠㅠ");
			
			return "board/member/my-friend-feed";
		}
		
		session.setAttribute("alertMsg", "삭제 성공  ~ !");
		
		return "redirect:/member/my-friend-feed";
	}
	
	//파일 다운로드
	@GetMapping("att/down")
	public ResponseEntity<ByteArrayResource> download(String friendAttachNo , HttpServletRequest req) throws Exception{
		
		String path = req.getServletContext().getRealPath("/resoureces/upload/friend/");
		FileVo fvo = fs.getAttachment(friendAttachNo);
		File f = new File(path + fvo.getChangeName());
		
		byte[] data = FileUtils.readFileToByteArray(f);
		ByteArrayResource bar = new ByteArrayResource(data);
		
	ResponseEntity<ByteArrayResource> entity = ResponseEntity
	   		.ok()
	   		.contentType(MediaType.APPLICATION_OCTET_STREAM)
	   		.header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=" + "\"" + URLEncoder.encode(fvo.getOriginName() , "UTF-8") + "\"")
	   		.header(HttpHeaders.CONTENT_ENCODING, "UTF-8")
	   		.contentLength(data.length)
	   		.body(bar)
	   		;
	
	return entity;
		
	}
	
	//피드 상태 변경 (모집중)
	@GetMapping("statusY/{no}")
	public String statusY(@PathVariable(required = true) String no, HttpSession session) {
		int result = fs.statusY(no);
		
		if(result != 1) {
			session.setAttribute("alertMsg", "변경에 실패하였습니다 .. (모집중)");
			
			return "redirect:/member/my-friend-feed";
		}
		
		session.setAttribute("alertMsg", "변경에 성공하였습니다 ~ (모집중)");
		
		return "redirect:/member/my-friend-feed";
	}
		
	//피드 상태 변경 (모집완료)
	@GetMapping("statusN/{no}")
	public String statusN(@PathVariable(required = true) String no, HttpSession session) {
		int result = fs.statusN(no);
		
		if(result != 1) {
			session.setAttribute("alertMsg", "변경에 실패하였습니다 .. (모집완료)");
			
			return "redirect:/member/my-friend-feed";
		}
		
		session.setAttribute("alertMsg", "변경에 성공하였습니다 ~ (모집완료)");
		
		return "redirect:/member/my-friend-feed";
	}
	
	
}
