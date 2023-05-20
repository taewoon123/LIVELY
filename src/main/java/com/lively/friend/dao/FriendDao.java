package com.lively.friend.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.lively.common.FileVo;
import com.lively.friend.vo.FriendVo;
import com.lively.page.vo.PageVo;

@Repository
public class FriendDao {
	
	//피드(전체)
	public List<FriendVo> getFriendFeed(SqlSessionTemplate sst, Map<String, String> searchMap, PageVo pageVo) {
		int limit = pageVo.getBoardLimit();
		int offset = (pageVo.getCurrentPage()-1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		return sst.selectList("friend.FriendFeed", null, rowBounds);
	}


	//피드작성
	public int write(SqlSessionTemplate sst , FriendVo vo) {
		return sst.insert("friend.write" , vo);
	}

	public int insertAttachment(SqlSessionTemplate sst, List<FileVo> friendList) {
		return sst.insert("friend.insertAttachment" , friendList);
	}

	public List<Map<String, String>> getLocationNoList(SqlSessionTemplate sst) {
		return sst.selectList("friend.getLocationNoList");
	}

	public int getFeedCount(SqlSessionTemplate sst) {
		return sst.selectOne("market.getFeedCount");
	}


	
}
