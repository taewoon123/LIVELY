package com.lively.query.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.lively.common.FileVo;
import com.lively.common.locaion.vo.LocationVo;
import com.lively.page.vo.PageVo;
import com.lively.query.vo.QueryVo;

@Repository
public class QueryDao {

	// 목록가져오기
	public List<QueryVo> getQueryList(SqlSessionTemplate sst, PageVo pv, String searchValue) {
		int limit = pv.getBoardLimit();
		int offset = (pv.getCurrentPage() - 1) * limit;
		RowBounds rb = new RowBounds(offset, limit);
		return sst.selectList("query.getQueryList", searchValue, rb);
	}

	// 목록에서 제목 검색하기
	public List<String> search(SqlSessionTemplate sst, String searchValue) {
		return sst.selectList("query.search", searchValue);
	}

	// 목록 게시글 수 세기
	public int getQueryListCnt(SqlSessionTemplate sst) {
		return sst.selectOne("query.getQueryListCnt");
	}

	// 작성하기
	public int write(SqlSessionTemplate sst, QueryVo vo) {
		return sst.insert("query.write", vo);
	}

	// 지역 선택 가져오기
	public List<LocationVo> getLocationList(SqlSessionTemplate sst, LocationVo locationVo) {
		return sst.selectList("query.getLocationList", locationVo);
	}

	// 첨부파일 삽입
	public int insertAttachment(SqlSessionTemplate sst, List<FileVo> queryList) {
		return sst.insert("query.insertAttachment", queryList);
	}

	// 첨부파일 가져오기
	public FileVo getAttachment(SqlSessionTemplate sst, String ano) {
		return sst.selectOne("query.getAttachment", ano);
	}

	// 첨부파일 리스트 가져오기
	public List<FileVo> getAttachmentList(SqlSessionTemplate sst, int num) {
		return sst.selectList("query.getAttachmentList", num);
	}

	// 조회수 증가
	public int increaseViews(SqlSessionTemplate sst, int num) {
		return sst.update("query.increaseViews", num);
	}

	// 게시글 가져오기
	public QueryVo getQuery(SqlSessionTemplate sst, int num) {
		return sst.selectOne("query.getQuery", num);
	}

	// 게시글 수정하기
	public int edit(SqlSessionTemplate sst, QueryVo vo) {
		return sst.update("query.edit", vo);
	}

	public int delete(SqlSessionTemplate sst, String num) {
		return sst.delete("query.delete", num);
	}
	
	public QueryVo getSelectLocation(SqlSessionTemplate sst, QueryVo vo) {
		return sst.selectOne("query.getSelectLocation",vo);
	}

}
