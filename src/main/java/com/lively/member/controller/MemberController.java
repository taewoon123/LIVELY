package com.lively.member.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lively.friend.vo.FriendVo;
import com.lively.help.vo.HelpVo;
import com.lively.market.vo.MarketVo;
import com.lively.member.service.MemberService;
import com.lively.member.vo.MemberVo;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("member")
public class MemberController {

	private final MemberService ms;

	@Autowired
	public MemberController(MemberService ms) {
		this.ms = ms;
	}

	// 회원가입 화면
	@GetMapping("join")
	public void join() {
	}

	// 회원가입 처리
	@PostMapping("join")
	public String join(MemberVo vo, HttpServletRequest req, HttpSession session, Model model) throws Exception {

		// 서비스
		int result = ms.join(vo);

		if (result != 1) {
			// 에러메세지 담아서 forwording 하기
			model.addAttribute("alertMsg", "회원가입 실패");
			return "member/join";
		}
		session.setAttribute("alertMsg", "회원가입완료! 로그인 해주세요 :)");
		return "redirect:/member/login";

	}// join

	// 아이디 중복확인
	@PostMapping("id-check") // url은 케밥케이스로
	@ResponseBody // 문자 그대로 반환되도록
	public String idCheck(String id) {

		int result = ms.checkId(id);

		if (result > 0) {
			return "isDup";
		} else {
			return "notDup";
		}
	}// idCheck

	// 로그인 화면
	@GetMapping("login")
	public String login() {
		return "member/login";
	}

	// 로그인 처리
	@PostMapping("login")
	public String login(MemberVo memberVo, HttpSession session) {
		MemberVo memberLog = ms.login(memberVo);

		if (memberLog == null) {
			session.setAttribute("alertMsg", "아이디 또는 비밀번호를 확인해주세요.");
			return "member/login";
		}
		session.setAttribute("memberLog", memberLog);
		return "redirect:/main";
	}
	
	// 로그아웃
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/main";
	}
	
	//비밀번호 찾기 화면
	@GetMapping("forgot-password")
	public String forgotPassword() {
		return "member/forgot-password";
	}
	
	//비밀번호 찾기 처리
	@PostMapping("forgot-password")
	public String forgotPassword(MemberVo memberVo, HttpSession session) {
		MemberVo memberLog = ms.login(memberVo);
		if(memberLog == null) {
			session.setAttribute("alertMsg", "일치하는 회원정보가 없습니다. 다시 시도해주세요.");
			return "member/forgot-password";
		}
		session.setAttribute("memberLog", memberLog);
		return "member/reset-password";
	}
	

	// my-info 화면
	@GetMapping("my-info")
	public String myInfo(HttpSession session) {
		if (session.getAttribute("memberLog") == null) {
			session.setAttribute("alertMsg", "로그인이 필요합니다.");
			return "member/login";
		}
		return "member/my-info";
	}

	// 정보수정 처리
	@PostMapping("my-info")
	public String myInfo(MemberVo vo, Model model, HttpSession session) throws Exception {

		// 서비스
		MemberVo updatedMember = ms.myInfo(vo);

		// 화면
		if (updatedMember == null) {
			model.addAttribute("alertMsg", "정보수정실패");
			return "member/my-info";
		}
		session.setAttribute("memberLog", updatedMember);
		session.setAttribute("alertMsg", "정보 수정 성공!!");
		return "redirect:/member/my-info";
	}

	// my-board 화면
	@GetMapping("my-board")
	public void myBoard() {

	}

	// my-query-board 화면
	@GetMapping("my-query-board")
	public String myQuery() {
		return "member/my-query-board";
	}

	// my-help-board 화면
	@GetMapping("my-help-board")
	public String myHelp(HelpVo helpVo, HttpSession session, Model model, @RequestParam(defaultValue = "1") int page) {

		MemberVo memberLog = (MemberVo) session.getAttribute("memberLog");
		String writeNo = memberLog.getNo();
			System.out.println("writeNo : " + writeNo);
		
		helpVo.setWriter(writeNo);
			System.out.println("helpVo : " + helpVo);
				
		List<HelpVo> myHelpList = ms.getMyHelpBoard(helpVo, writeNo);
			System.out.println("myHelpList : " + myHelpList);
		
		List<Map<String, String>> LocationList = ms.getLocationList();


		model.addAttribute("myHelpList", myHelpList);//범구가 수정함 "myMarketList => myHelpList"
		model.addAttribute("LocationList", LocationList);

		return "member/my-help-board";
	}

	// my-job-board 화면
	@GetMapping("my-job-board")
	public String myJob() {
		return "member/my-job-board";
	}

	// my-fundraise-board 화면
	@GetMapping("my-fundraise-board")
	public String myFundraise() {
		return "member/my-fundraise-board";
	}

	// my-market-feed 화면
	@GetMapping("my-market-feed")
	public String myFeed(MarketVo marketVo, HttpSession session, Model model) {

		MemberVo memberLog = (MemberVo) session.getAttribute("memberLog");
		String writerNo = memberLog.getNo();

		marketVo.setWriter(writerNo);

		// 내 피드 총 갯수
		int MyMarketFeedCount = ms.getMyMarketFeedCount(marketVo);

		List<MarketVo> myMarketList = ms.getMyMarketFeed(marketVo);
		List<Map<String, String>> LocationList = ms.getLocationList();

		System.out.println(myMarketList);

		model.addAttribute("MyFeedCount", MyMarketFeedCount);
		model.addAttribute("myMarketList", myMarketList);
		model.addAttribute("LocationList", LocationList);

		return "member/my-market-feed";
	}

	// my-friend-feed 화면
	@GetMapping("my-friend-feed")
	public String myFeed(FriendVo friendVo, HttpSession session, Model model) {

		MemberVo memberLog = (MemberVo) session.getAttribute("memberLog");
		String writerNo = memberLog.getNo();

		friendVo.setWriter(writerNo);

		// 내 피드 총 갯수
		int MyFriendFeedCount = ms.getMyFriendFeedCount(friendVo);

		List<FriendVo> myFriendList = ms.getMyFriendFeed(friendVo);
		List<Map<String, String>> LocationList = ms.getLocationList();

		model.addAttribute("MyFeedCount", MyFriendFeedCount);
		model.addAttribute("myFriendList", myFriendList);
		model.addAttribute("LocationList", LocationList);

		return "member/my-friend-feed";
	}

}// class
