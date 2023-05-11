package com.lively.friend.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lively.friend.dao.FriendDao;
import com.lively.friend.vo.FriendVo;

@Service
@Transactional
public class FriendService {
	
	private final FriendDao dao;
	private final SqlSessionTemplate sst;
	
	@Autowired
	public FriendService(FriendDao dao , SqlSessionTemplate sst) {
		this.dao = dao;
		this.sst = sst;
	}
	
	public List<FriendVo> getFriendFeed(){
		return dao.getFriendFeed(sst);
	}
	
}
