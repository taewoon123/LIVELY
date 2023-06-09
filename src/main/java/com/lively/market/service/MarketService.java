package com.lively.market.service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lively.common.FileVo;
import com.lively.common.locaion.dao.LocationDao;
import com.lively.common.locaion.vo.LocationVo;
import com.lively.friend.vo.FriendVo;
import com.lively.market.dao.MarketDao;
import com.lively.market.vo.MarketVo;

@Service
@Transactional
public class MarketService {

	private final MarketDao dao;
	private final SqlSessionTemplate sst;
    private final LocationDao locationDao;
	
	@Autowired
	public MarketService(MarketDao dao, SqlSessionTemplate sst, LocationDao locationDao) {
		this.dao = dao;
		this.sst = sst;
		this.locationDao = locationDao;
	}
	
	//피드 작성
	public int write(MarketVo marketVo, List<FileVo> marketList) throws Exception {
		int writeResult = dao.write(sst, marketVo);
		int attachResult = 1;
		System.out.println("write : " + marketVo);
		if(marketList.size() > 0) {
			attachResult = dao.insertAttachment(sst, marketList);
		}
		
		return writeResult * attachResult;
	}

	//지역 목록
	/*
	 * public List<Map<String, String>> getLocationList() { return
	 * dao.getLocationList(sst); }
	 */

	//총 갯수
	public int getFeedCount() {
		return dao.getFeedCount(sst);
	}

	//수정하기 (작성자만)
	public int updateFeed(MarketVo marketVo) {
		return dao.updateFeed(sst, marketVo);
	}

	//삭제하기 (작성자만)
	public int delete(String no) {
		return dao.delete(sst, no);
	}
	
	//상세조회
	public List<MarketVo> getFeed(String no) throws Exception {
		
		List<MarketVo> marketVo = dao.getFeed(sst, no);
		
		return marketVo;
	}
	
	public FileVo getAttachment(String marketAttachNo) {
		return dao.getAttachment(sst, marketAttachNo);
	}

	public int statusY(String no) {
		return dao.statusY(sst, no);
	}
	
	public int statusN(String no) {
		return dao.statusN(sst, no);
	}
	
	
	//합치기
	 public ArrayList<MarketVo> getMarketFeed(String searchValue) {
		 List<MarketVo> fileVoList = dao.getMarketFeed(sst, searchValue);
		 
		 Map<String, MarketVo> fileVoMap = new HashMap<String, MarketVo>();
		 for(MarketVo fileVo : fileVoList) {
			 fileVoMap.put(fileVo.getMarketNo(), fileVo);
			 fileVo.setAttachmentList2(new ArrayList<FileVo>()); 
		 }
		 
		 
		 List<FileVo> fileList = dao.getAttachmentList2(sst);
		 for(FileVo file : fileList) {
			 String marketNo = file.getNo();
			 MarketVo getMarketNo = fileVoMap.get(marketNo);
			 if(getMarketNo == null) {
				 continue;
			 }
			 getMarketNo.getAttachmentList2().add(file);
		 }
		 
		 return mapToList(fileVoMap);
	 }

	private ArrayList<MarketVo> mapToList(Map<String, MarketVo> fvoMap) {
			
		ArrayList<MarketVo> voList = new ArrayList<MarketVo>();

		int i = 0;
		while(fvoMap.size() != voList.size()) {
			MarketVo vo = fvoMap.get("" + i++);
			if(vo != null) {
				voList.add(vo);
			}
		}
		Collections.reverse(voList);
		return voList;
	}

	public List<LocationVo> getLocationList(LocationVo locationVo) {
		return locationDao.getLocationList(sst,locationVo);
	}
}

