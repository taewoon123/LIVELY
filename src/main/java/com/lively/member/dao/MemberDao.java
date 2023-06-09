package com.lively.member.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.lively.common.FileVo;
import com.lively.friend.vo.FriendVo;
import com.lively.help.vo.HelpVo;
import com.lively.market.vo.MarketVo;
import com.lively.member.vo.MemberVo;

@Repository
public class MemberDao {

	// 회원가입
	public int join(MemberVo vo, SqlSessionTemplate sst) throws Exception {
		return sst.insert("member.join", vo);
	}

	// 아이디 중복확인
	public int checkId(SqlSessionTemplate sst, String id) {
		// return conn.mybatis메소드("쿼리문위치", 전달할 객체);
		return sst.selectOne("member.checkId", id);
	}

	// 로그인
	public MemberVo login(SqlSessionTemplate sst, MemberVo vo) {
		return sst.selectOne("member.login", vo);
	}

	// 비밀번호 까묵 - 회원조회
	public MemberVo forgotPassword(SqlSessionTemplate sst, MemberVo vo) {
		return sst.selectOne("member.forgotPassword", vo);
	}

	// 비밀번호 재설정
	public int resetPassword(SqlSessionTemplate sst, MemberVo vo) {
		return sst.update("member.resetPassword", vo);
	}

	// my-info
	public int myInfo(SqlSessionTemplate sst, MemberVo vo) {
		return sst.update("member.myInfo", vo);
	}

	public MemberVo selectOneByNo(SqlSessionTemplate sst, MemberVo vo) {
		return sst.selectOne("member.getMember", vo);
	}

	// my-feed
	public List<MarketVo> getMyMarketFeed(SqlSessionTemplate sst, MarketVo marketVo) {
		return sst.selectList("member.marketFeed", marketVo);
	}

	public List<Map<String, String>> getLocationList(SqlSessionTemplate sst) {
		return sst.selectList("member.getLocationList");
	}

	public int getMyMarketFeedCount(SqlSessionTemplate sst, MarketVo marketVo) {
		return sst.selectOne("member.myMarketFeedCount", marketVo);
	}

	public int getMyFriendFeedCount(SqlSessionTemplate sst, FriendVo friendVo) {
		return sst.selectOne("member.myFriendFeedCount", friendVo);
	}

	public List<FriendVo> getMyFriendFeed(SqlSessionTemplate sst, FriendVo friendVo) {
		return sst.selectList("member.friendFeed", friendVo);
	}

	// my-help
	public List<HelpVo> getMyHelpBoard(SqlSessionTemplate sst, HelpVo helpVo) {
		return sst.selectList("member.helpBoard", helpVo);
	}

	public List<FriendVo> getFriendFeed(SqlSessionTemplate sst, String searchValue) {
		return sst.selectList("member.friendFeed" , searchValue);
	}

	/*
	 * public List<FriendVo> getFriendFeed(SqlSessionTemplate sst) { return
	 * sst.selectList("member.getFriendFeed"); }
	 */

	public List<FileVo> getAttachmentList(SqlSessionTemplate sst) {
		return sst.selectList("friend.getAttachmentList");
	}

	/*
	 * public List<MarketVo> getMarketFeed(SqlSessionTemplate sst, String
	 * searchValue) { return sst.selectList("member.getMarketFeed" , searchValue); }
	 */

	public List<MarketVo> getMarketFeed(SqlSessionTemplate sst, String searchValue) {
		return sst.selectList("member.marketFeed", searchValue);
	}

	public List<FileVo> getAttachmentList2(SqlSessionTemplate sst) {
		return sst.selectList("market.getAttachmentList2");
	}

}// class
