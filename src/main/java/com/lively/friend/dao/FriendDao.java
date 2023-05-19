package com.lively.friend.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.lively.common.FileVo;
import com.lively.friend.vo.FriendVo;

@Repository
public class FriendDao {
	
	//피드
	public List<FriendVo> getFriendFeed(SqlSessionTemplate sst ,  Map<String , String> searchMap ){
		return sst.selectList("friend.FriendFeed" , searchMap );
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

	
}
