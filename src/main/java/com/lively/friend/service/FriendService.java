package com.lively.friend.service;

import java.util.ArrayList;
import java.util.HashMap;
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

import lombok.extern.slf4j.Slf4j;
@Slf4j
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
	public List<FriendVo> getFriendFeed(String searchValue){
		return dao.getFriendFeed(sst , searchValue);
	}
	


	//검색
	public List<String> search(String searchValue) {
		return dao.search(sst, searchValue);
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
	
	//지역
	public List<Map<String, String>> getLocationNoList() {
		return dao.getLocationNoList(sst);
	}

	//총갯수
	public int getFeedCount() {
		return dao.getFeedCount(sst);
	}

	public FileVo getAttachment(String friendAttachNo) {
		return dao.getAttachment(sst , friendAttachNo);
	}



	//합치기
	 public Map<String, FriendVo> getFriendFeed() {
		 List<FriendVo> fvoList = dao.getFriendFeed(sst);
		 
		 Map<String, FriendVo> fvoMap = new HashMap<String, FriendVo>();
		 for(FriendVo fvo : fvoList) {
			 fvoMap.put(fvo.getFriendNo(), fvo);
			 fvo.setAttachmentList(new ArrayList<FileVo>()); 
		 }
		 
		 
		 
		 List<FileVo> fileList = dao.getAttachmentList(sst);
		 for(FileVo file : fileList) {
			 String friendNo = file.getNo();
			 fvoMap.get(friendNo).getAttachmentList().add(file);
		 }
		 
		 
		 return fvoMap;
	 }

	//수정하기(작성자만)
	public int updateFeed(FriendVo friendVo) {
		return dao.updateFeed(sst, friendVo);
	}

	//삭제하기 (작성자만)
	public int delete(String no) {
		return dao.delete(sst, no);
	}

	//상세조회
	public List<FriendVo> getFeed(String no) throws Exception {
		
		List<FriendVo> friendVo = dao.getFeed(sst, no);
		
		return friendVo;
	}


	public int statusY(String no) {
		return dao.statusY(sst, no);
	}


	public int statusN(String no) {
		return dao.statusN(sst, no);
	}
	 



}
