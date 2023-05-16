package com.lively.friend.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lively.common.FileVo;
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
	
	//피드
	public List<FriendVo> getFriendFeed(){
		return dao.getFriendFeed(sst);
	}
	
	//작성하기
	public int write(FriendVo vo, List<FileVo> fvoList) throws Exception {
		int friendResult = dao.write(sst, vo);
		if(friendResult != 1) {
			throw new Exception();
		}
		return dao.insertAttachment(sst , fvoList);
	}
	
}
