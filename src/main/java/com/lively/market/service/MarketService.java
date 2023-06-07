package com.lively.market.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lively.common.FileVo;
import com.lively.common.locaion.vo.LocationVo;
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
	public List<MarketVo> getMarketFeed(String searchValue){
		return dao.getMarketFeed(sst, searchValue);
	}
	
	//피드 작성
	public int write(MarketVo marketVo, List<FileVo> fileVoList) throws Exception {
		int writeResult = dao.write(sst, marketVo);
		int attachResult = 1;
		System.out.println("write : " + marketVo);
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
	public int delete(String no) {
		return dao.delete(sst, no);
	}
	
	//상세조회
	public MarketVo getFeed(String no) throws Exception {
		
		MarketVo marketVo = dao.getFeed(sst, no);
//		List<FileVo> fileList = dao.getAttachmentList(sst, no);
		
//		marketVo.setAttachmentList(fileList);
		
		return marketVo;
	}
	
	public FileVo getAttachment(String attachmentNo) {
		return dao.getAttachment(sst, attachmentNo);
	}

	public int statusY(String no) {
		return dao.statusY(sst, no);
	}
	
	public int statusN(String no) {
		return dao.statusN(sst, no);
	}
}

