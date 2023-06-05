package com.lively.market.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
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
import com.lively.market.service.MarketService;
import com.lively.market.vo.MarketVo;
import com.lively.member.vo.MemberVo;
import com.lively.page.vo.PageVo;

@Controller
@RequestMapping("market")
public class MarketController {
	
	private final MarketService ms;
	
	@Autowired
	public MarketController(MarketService ms) {
		this.ms = ms;
	}

	//피드 목록
	@GetMapping("list")
	public String list(Model model, String no, String searchValue) throws Exception {
		
		//데이터
		/*
		 * int listCount = ms.getFeedCount(); int currentPage = page; int pageLimit = 3;
		 * int boardLimit = 3; PageVo pageVo = new PageVo(listCount, currentPage,
		 * pageLimit, boardLimit);
		 */
		
		List<MarketVo> marketList = ms.getMarketFeed(searchValue);
		List<LocationVo> LocationList = ms.getLocationList();
		
		System.out.println(marketList);
		
//		model.addAttribute("marketVo", marketVo);
//		model.addAttribute("pageVo", pageVo);
//		model.addAttribute("searchMap", searchMap);
		model.addAttribute("marketList", marketList);
		model.addAttribute("LocationList", LocationList);
		
		return "board/market/market-list";
	}
	
	//피드 작성 (화면)
	@GetMapping("write")
	public String write(HttpSession session) {
		//로그인 여부
		MemberVo memberLog = (MemberVo) session.getAttribute("memberLog");
		if(memberLog == null) {
			session.setAttribute("alertMsg", "로그인 먼저 해주세요 !");
			return "redirect:/market/list";
		}
				
		return "board/market/market-write";
	}
	
	//피드 작성
	@PostMapping("write")
	public String write(MarketVo marketVo, List<MultipartFile> f,HttpSession session, HttpServletRequest request, Model model) throws Exception {
		MemberVo memberLog = (MemberVo) session.getAttribute("memberLog");
		
		//데이터 준비 (파일)
		String path = request.getServletContext().getRealPath("/resources/upload/market/");
		
		List<String> changeNameList = FileUploader.upload(f, path);
		List<String> originNameList = FileUploader.getOriginNameList(f);
		
		//데이터 준비
		int size = 0;
		List<FileVo> fileVoList = new ArrayList<FileVo>();
		if(changeNameList != null) {
			size = changeNameList.size();
			System.out.println(size);
			for(int i=0; i < size; i++) {
				FileVo fileVo = new FileVo();
				fileVo.setOriginName(originNameList.get(i));
				fileVo.setChangeName(changeNameList.get(i));
				fileVoList.add(fileVo);
				
//				MarketVo marketVo = new MarketVo();
				marketVo.setOriginNameList(originNameList.get(i));
				marketVo.setChangeNameList(changeNameList.get(i));
			}
		}

		marketVo.setWriter(memberLog.getNo());
		
		int result = ms.write(marketVo, fileVoList);
		
		if(result <= 0) {
			session.setAttribute("alertMsg", "작성에 실패하셨습니다ㅠㅠ");
			
			return "board/market/market-write";
		}
		model.addAttribute("marketVo", marketVo);
		model.addAttribute("fileVoList", fileVoList);
		model.addAttribute("changeNameList", changeNameList);
		model.addAttribute("size", size);
		
		return "redirect:/market/list";
	}
	
	//피드 수정 화면 (작성자만)
	@GetMapping("edit/{no}")
	public String edit(@PathVariable(required = true) String no, Model model) throws Exception {
		
		MarketVo marketDetail = ms.getFeed(no);
		
		model.addAttribute("marketDetail", marketDetail);
		
		return "board/market/market-detail";
	}
	
	//피드 수정 (작성자만)
	@PostMapping("edit")
	public String edit(MarketVo marketVo, HttpSession session, RedirectAttributes ra) {
		
		int result = ms.updateFeed(marketVo);
		
		System.out.println("수정 : " + marketVo);
		
		if(result != 1) {
			session.setAttribute("alertMsg", "수정 실패ㅠㅠ");
			
			return "redirect:/member/my-market-feed";
		}
		
		session.setAttribute("alertMsg", "수정 성공 ~ !");
		ra.addAttribute("no", marketVo.getMarketNo());
		
		return "redirect:/member/my-market-feed";
	}
	
	//피드 삭제 (작성자만)
		@GetMapping("delete/{no}")
		public String delete(MarketVo marketVo, HttpSession session, @PathVariable(required = true) String no) {
			
			int result = ms.delete(no);
			
			if(result != 1) {
				session.setAttribute("alertMsg", "삭제 실패ㅠㅠ");
				
				return "board/member/my-market-feed";
			}
			
			session.setAttribute("alertMsg", "삭제 성공  ~ !");
			
			return "redirect:/member/my-market-feed";
		}
		
	
	//피드 상태 변경 (거래중)
	@GetMapping("statusY/{no}")
	public String statusY(@PathVariable(required = true) String no, HttpSession session) {
		int result = ms.statusY(no);
		
		if(result != 1) {
			session.setAttribute("alertMsg", "변경에 실패하였습니다 .. (거래중)");
			
			return "redirect:/member/my-market-feed";
		}
		
		session.setAttribute("alertMsg", "변경에 성공하였습니다 ~ (거래중)");
		
		return "redirect:/member/my-market-feed";
	}
		
	//피드 상태 변경 (거래완료)
	@GetMapping("statusN/{no}")
	public String statusN(@PathVariable(required = true) String no, HttpSession session) {
		int result = ms.statusN(no);
		
		if(result != 1) {
			session.setAttribute("alertMsg", "변경에 실패하였습니다 .. (거래완료)");
			
			return "redirect:/member/my-market-feed";
		}
		
		session.setAttribute("alertMsg", "변경에 성공하였습니다 ~ (거래완료)");
		
		return "redirect:/member/my-market-feed";
	}
	
}
	
	


