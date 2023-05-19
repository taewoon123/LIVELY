package com.lively.market.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.lively.common.FileVo;
import com.lively.market.vo.MarketVo;
import com.lively.page.vo.PageVo;

@Repository
public class MarketDao {
	
	//피드 목록 (전체)
	public List<MarketVo> getMarketFeed(SqlSessionTemplate sst, PageVo pageVo){
		int limit = pageVo.getBoardLimit();
		int offset = (pageVo.getCurrentPage()-1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		return sst.selectList("market.MarketFeed", null, rowBounds);
	}
	
	//피드 목록 (거래중만)
	public List<MarketVo> getMarketFeedING(SqlSessionTemplate sst, PageVo pageVo){
		int limit = pageVo.getBoardLimit();
		int offset = (pageVo.getCurrentPage()-1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		return sst.selectList("market.MarketFeedING", null, rowBounds);
	}

	//피드 작성
	public int write(SqlSessionTemplate sst, MarketVo marketVo) {
		return sst.insert("market.write", marketVo);
	}

	
	//피드 작성 (사진 파일)
	public int insertAttachment(SqlSessionTemplate sst, List<FileVo> fileVoList) {
		return sst.insert("market.insertAttachment", fileVoList);
	}

	public List<Map<String, String>> getLocationList(SqlSessionTemplate sst) {
		return sst.selectList("market.getLocationList");
	}

	public int getFeedCount(SqlSessionTemplate sst) {
		return sst.selectOne("market.getFeedCount");
	}

}


