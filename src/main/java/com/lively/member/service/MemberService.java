package com.lively.member.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lively.friend.vo.FriendVo;
import com.lively.market.vo.MarketVo;
import com.lively.member.dao.MemberDao;
import com.lively.member.vo.MemberVo;

@Service
@Transactional
public class MemberService {

	private final SqlSessionTemplate sst;
	private final MemberDao dao;

	@Autowired
	public MemberService(SqlSessionTemplate sst, MemberDao dao) {
		this.sst = sst;
		this.dao = dao;
	}

	public int join(MemberVo vo) throws Exception {
		return dao.join(vo, sst);
	}

	public int checkId(String id) {
		// conn : 이미 지역변수 sst 있음.
		// sql : dao에게 보내기.
		return dao.checkId(sst, id);
		// tx || rs : tx는 자동처리 / rs는 mybatis가 처리해줌.
		// close : spring이 처리해줌
	}

	public MemberVo login(MemberVo memberVo) {

		return dao.login(sst, memberVo);
	}

	public MemberVo myInfo(MemberVo vo)throws Exception {

		int result = dao.myInfo(sst, vo);
		if (result != 1) {
			throw new Exception();
		}
		return dao.selectOneByNo(sst, vo);

	}

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

}// class
