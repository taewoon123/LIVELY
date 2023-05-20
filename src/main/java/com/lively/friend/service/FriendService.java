package com.lively.friend.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lively.common.FileVo;
import com.lively.friend.dao.FriendDao;
import com.lively.friend.vo.FriendVo;
import com.lively.page.vo.PageVo;

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
	public List<FriendVo> getFriendFeed(Map<String , String> searchMap , PageVo pageVo){
		return dao.getFriendFeed(sst , searchMap , pageVo);
	}
	
	//작성하기
	public int write(FriendVo vo, List<FileVo> friendList) throws Exception {
		int friendResult = dao.write(sst, vo);
		int attResult = 1;
		if(friendList.size() > 0) {
			attResult = dao.insertAttachment(sst, friendList);
		}
		return friendResult * attResult;
	}
	
	// 수정하기(작성자만)
    
    // 삭제하기(작성자만)
	
	
	//지역
	public List<Map<String, String>> getLocationNoList() {
		return dao.getLocationNoList(sst);
	}

	//총갯수
	public int getFeedCount() {
		return dao.getFeedCount(sst);
	}





}
