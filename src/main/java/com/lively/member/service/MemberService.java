package com.lively.member.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lively.friend.vo.FriendVo;
import com.lively.help.vo.HelpVo;
import com.lively.market.vo.MarketVo;
import com.lively.member.dao.MemberDao;
import com.lively.member.vo.MemberVo;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class MemberService {

	private final SqlSessionTemplate sst;
	private final MemberDao dao;
	private final BCryptPasswordEncoder enc;

	@Autowired
	public MemberService(SqlSessionTemplate sst, MemberDao dao, BCryptPasswordEncoder enc) {
		this.sst = sst;
		this.dao = dao;
		this.enc = enc;
	}

	// 회원가입
	public int join(MemberVo vo) throws Exception {
		// 비밀번호 암호화
		String pwd = vo.getPwd();
		String newPwd = enc.encode(pwd);
		vo.setPwd(newPwd);
		// dao 호출
		return dao.join(vo, sst);
	}

	// 아이디 중복확인
	public int checkId(String id) {
		// conn : 이미 지역변수 sst 있음.
		// sql : dao에게 보내기.
		return dao.checkId(sst, id);
		// tx || rs : tx는 자동처리 / rs는 mybatis가 처리해줌.
		// close : spring이 처리해줌
	}

	// 로그인
	public MemberVo login(MemberVo vo) {
		System.out.println("ser - login dao 가기전 vo : " + vo);

		// dao 호출
		MemberVo memberLog = dao.login(sst, vo);
//		System.out.println("ser - login dao 갔다온 memberLog : " + memberLog);

		// 비밀번호 복호화
		String userPwd = vo.getPwd();
		String dbPwd = memberLog.getPwd();
		boolean result = enc.matches(userPwd, dbPwd);
//		System.out.println("ser - 복호화 매칭 result : " + result);

		if (result) {
			return memberLog;
		} else {
			return null;
		}
	}

	// 비밀번호 까묵 - 회원조회
	public MemberVo forgotPassword(MemberVo vo) {
		return dao.forgotPassword(sst, vo);
	}

	// 비밀번호 재설정
	public MemberVo resetPassword(MemberVo memberCheck, MemberVo vo) throws Exception {

		// 비밀번호 암호화
		String pwd = vo.getPwd();
//		System.out.println("ser - reset 클라가 입력한 pwd : " + pwd);

		String newPwd = enc.encode(pwd);
//		System.out.println("ser - reset 암호화한 newPwd : " + newPwd);

		memberCheck.setPwd(newPwd);
//		System.out.println("ser - reset 암호화한 memberCheck : " + memberCheck);

		// dao 호출
		int result = dao.resetPassword(sst, memberCheck);
//		System.out.println("ser - reset dao 갔다온 memberCheck,result : " + memberCheck + "," + result);

		if (result != 1) {
			throw new Exception();
		}
//		System.out.println("ser - result가 1일 경우, con으로 리턴하는 memberCheck : " + memberCheck );
		return memberCheck;
	}

	// 회원정보 수정
	public MemberVo myInfo(MemberVo vo) throws Exception {

		int result = dao.myInfo(sst, vo);

		if (result != 1) {
			throw new Exception();
		}
		return dao.selectOneByNo(sst, vo);

	}

	// my-feed
	public List<MarketVo> getMyMarketFeed(MarketVo marketVo) {
		return dao.getMyMarketFeed(sst, marketVo);
	}

	public List<Map<String, String>> getLocationList() {
		return dao.getLocationList(sst);
	}

	public int getMyMarketFeedCount(MarketVo marketVo) {
		return dao.getMyMarketFeedCount(sst, marketVo);
	}

	public int getMyFriendFeedCount(FriendVo friendVo) {
		return dao.getMyFriendFeedCount(sst, friendVo);
	}

	public List<FriendVo> getMyFriendFeed(FriendVo friendVo) {
		return dao.getMyFriendFeed(sst, friendVo);
	}

	// my-help
	public List<HelpVo> getMyHelpBoard(HelpVo helpVo, String writeNo) {
		return dao.getMyHelpBoard(sst, helpVo);
	}

}// class