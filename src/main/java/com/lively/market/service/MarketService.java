package com.lively.market.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lively.common.FileVo;
import com.lively.market.dao.MarketDao;
import com.lively.market.vo.MarketVo;
import com.lively.page.vo.PageVo;

@Service
@Transactional
public class MarketService {

	private final MarketDao dao;
	private final SqlSessionTemplate sst;
	
	@Autowired
	public MarketService(MarketDao dao, SqlSessionTemplate sst) {
		this.dao = dao;
		this.sst = sst;
	}
	
	//피드 목록 (전체)
	public List<MarketVo> getMarketFeed(PageVo pageVo){
		return dao.getMarketFeed(sst, pageVo);
	}
	
	//피드 목록 (거래중만)
	public List<MarketVo> getMarketFeedING(PageVo pageVo){
		return dao.getMarketFeedING(sst, pageVo);
	}

	//피드 작성
	public int write(MarketVo marketVo, List<FileVo> fileVoList) throws Exception {
		int writeResult = dao.write(sst, marketVo);
		if(writeResult != 1) {
			throw new Exception();
		}
		
		return dao.insertAttachment(sst, fileVoList);
	}

	//지역 목록
	public List<Map<String, String>> getLocationList() {
		return dao.getLocationList(sst);
	}

	//총 갯수
	public int getFeedCount() {
		return dao.getFeedCount(sst);
	}
}

