package com.lively.market.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.lively.common.FileVo;
import com.lively.common.LocationVo;
import com.lively.market.vo.MarketVo;
import com.lively.page.vo.PageVo;

@Repository
public class MarketDao {
	
	//피드 목록 (전체)
	public List<MarketVo> getMarketFeed(SqlSessionTemplate sst, PageVo pageVo, String searchValue){
		int limit = pageVo.getBoardLimit();
		int offset = (pageVo.getCurrentPage()-1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		return sst.selectList("market.MarketFeed", searchValue, rowBounds);
	}
	
	//피드 작성
	public int write(SqlSessionTemplate sst, MarketVo marketVo) {
		return sst.insert("market.write", marketVo);
	}

	
	//피드 작성 (사진 파일)
	public int insertAttachment(SqlSessionTemplate sst, List<FileVo> fileVoList) {
		return sst.insert("market.insertAttachment", fileVoList);
	}

	//지역 리스트
	public List<LocationVo> getLocationList(SqlSessionTemplate sst) {
		return sst.selectList("market.getLocationList");
	}

	//피드 갯수
	public int getFeedCount(SqlSessionTemplate sst) {
		return sst.selectOne("market.getFeedCount");
	}

	//수정 (작성자만)
	public int updateFeed(SqlSessionTemplate sst, MarketVo marketVo) {
		return sst.update("market.updateFeed", marketVo);
	}

	//삭제 (작성자만)
	public int delete(SqlSessionTemplate sst, MarketVo marketVo) {
		return sst.update("market.delete", marketVo);
	}

//	public int getMyFeedCount(SqlSessionTemplate sst) {
//		return sst.selectOne("market.getMyFeedCount");
//	}
//
//	public List<MarketVo> getMyMarketFeed(SqlSessionTemplate sst, PageVo myPageVo) {
//		int limit = myPageVo.getBoardLimit();
//		int offset = (myPageVo.getCurrentPage()-1) * limit;
//		RowBounds rowBounds = new RowBounds(offset, limit);
//		return sst.selectList("market.MyMarketFeed", null, rowBounds);
//	}
	
	//첨부파일
	public int getAttachmentList(SqlSessionTemplate sst, String no) {
		return sst.selectOne("market.getAttachmentList", no);
	}

	public FileVo getAttachment(SqlSessionTemplate sst, String attachmentNo) {
		return sst.selectOne("market.getAttachment", attachmentNo);
	}

	public List<String> search(SqlSessionTemplate sst, String searchValue) {
		return sst.selectList("market.search", searchValue);
	}
	
//	//상세조회
//	public MarketVo getFeed(SqlSessionTemplate sst, String no) {
//		return sst.selectOne("market.getFeed", no);
//	}
}


