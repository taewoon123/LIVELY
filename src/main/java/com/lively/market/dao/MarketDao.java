package com.lively.market.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.lively.common.FileVo;
import com.lively.common.locaion.vo.LocationVo;
import com.lively.friend.vo.FriendVo;
import com.lively.market.vo.MarketVo;
import com.lively.page.vo.PageVo;

@Repository
public class MarketDao {
	
	//피드 목록 (전체)
	public List<MarketVo> getMarketFeed(SqlSessionTemplate sst, String searchValue){
		/*
		 * int limit = pageVo.getBoardLimit(); int offset = (pageVo.getCurrentPage()-1)
		 * * limit; RowBounds rowBounds = new RowBounds(offset, limit);
		 */
		return sst.selectList("market.MarketFeed", searchValue);
	}
	
	//피드 작성
	public int write(SqlSessionTemplate sst, MarketVo marketVo) {
		return sst.insert("market.write", marketVo);
	}

	
	//피드 작성 (사진 파일)
	public int insertAttachment(SqlSessionTemplate sst, List<FileVo> marketList) {
		return sst.insert("market.insertAttachment", marketList);
	}

	//지역 리스트
	public List<Map<String, String>> getLocationList(SqlSessionTemplate sst) {
		return sst.selectList("market.getLocationList");
	}

	//피드 갯수
	public int getFeedCount(SqlSessionTemplate sst) {
		return sst.selectOne("market.getFeedCount");
	}

	//수정 (작성자만)
	public int updateFeed(SqlSessionTemplate sst, MarketVo marketVo) {
		int a = sst.update("market.updateFeed", marketVo);
		System.out.println(a);
		return a;
	}

	//삭제 (작성자만)
	public int delete(SqlSessionTemplate sst, String no) {
		return sst.update("market.delete", no);
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
	public List<FileVo> getAttachmentList(SqlSessionTemplate sst) {
		return sst.selectList("market.getAttachmentList");
	}

	public FileVo getAttachment(SqlSessionTemplate sst, String marketAttachNo) {
		return sst.selectOne("market.getAttachment", marketAttachNo);
	}

	public List<String> search(SqlSessionTemplate sst, String searchValue) {
		return sst.selectList("market.search", searchValue);
	}

	public int statusY(SqlSessionTemplate sst, String no) {
		return sst.update("market.statusY", no);
	}
	
	public List<MarketVo> getMarketFeed(SqlSessionTemplate sst) {
		return sst.selectList("market.getMarketFeed");
	}


	
	public int statusN(SqlSessionTemplate sst, String no) {
		return sst.update("market.statusN", no);
	}
	
	//상세조회
	public MarketVo getFeed(SqlSessionTemplate sst, String no) {
		return sst.selectOne("market.getFeed", no);
	}
}


