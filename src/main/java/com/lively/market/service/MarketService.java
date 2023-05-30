package com.lively.market.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lively.common.FileVo;
import com.lively.common.LocationVo;
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
	public List<MarketVo> getMarketFeed(PageVo pageVo, String searchValue){
		return dao.getMarketFeed(sst, pageVo, searchValue);
	}
	
	//검색
	public List<String> search(String searchValue) {
		return dao.search(sst, searchValue);
	}
	
	//피드 작성
	public int write(MarketVo marketVo, List<FileVo> fileVoList) throws Exception {
		int writeResult = dao.write(sst, marketVo);
		int attachResult = 1;
		if(fileVoList.size() > 0) {
			attachResult = dao.insertAttachment(sst, fileVoList);
		}
		
		return writeResult * attachResult;
	}

	//지역 목록
	public List<LocationVo> getLocationList() {
		return dao.getLocationList(sst);
	}

	//총 갯수
	public int getFeedCount() {
		return dao.getFeedCount(sst);
	}

	//수정하기 (작성자만)
	public int updateFeed(MarketVo marketVo) {
		return dao.updateFeed(sst, marketVo);
	}

	//삭제하기 (작성자만)
	public int delete(MarketVo marketVo) {
		return dao.delete(sst, marketVo);
	}
	
//	//상세조회
//	public MarketVo getFeed(String no) throws Exception {
//		
//		MarketVo marketVo = dao.getFeed(sst, no);
//		List<FileVo> fileList = dao.getAttachmentList(sst, no);
//		
//		marketVo.setAttachmentList(fileList);
//		
//		return marketVo;
//	}
	
	public FileVo getAttachment(String attachmentNo) {
		return dao.getAttachment(sst, attachmentNo);
	}
}

