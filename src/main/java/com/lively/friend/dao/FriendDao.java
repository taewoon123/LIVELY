package com.lively.friend.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.lively.friend.vo.FriendVo;

@Repository
public class FriendDao {
	
	public List<FriendVo> getFriendFeed(SqlSessionTemplate sst){
		return sst.selectList("friend.FriendFeed");
	}


}
