package com.lively.query.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lively.common.FileVo;
import com.lively.common.locaion.dao.LocationDao;
import com.lively.common.locaion.vo.LocationVo;
import com.lively.page.vo.PageVo;
import com.lively.query.dao.QueryDao;
import com.lively.query.vo.QueryVo;

@Service
@Transactional
public class QueryService {

	private final QueryDao dao;
	private final SqlSessionTemplate sst;
//	private final LocationDao locationDao;

	@Autowired
	public QueryService(QueryDao dao, SqlSessionTemplate sst, LocationDao locationDao) {
		this.dao = dao;
		this.sst = sst;
//		this.locationDao = locationDao;
	}

	// 목록 가져오기
	public List<QueryVo> getQueryList(PageVo pv, String searchValue) {
		return dao.getQueryList(sst, pv, searchValue);
	}

	// 목록에서 제목 검색하기
	public List<String> search(String searchValue) {
		return dao.search(sst, searchValue);
	}

	// 목록 게시글 수 세기
	public int getQueryListCnt() {
		return dao.getQueryListCnt(sst);
	}

	// 지역 선택 가져오기
	public List<LocationVo> getLocationList(LocationVo locationVo) {
		return dao.getLocationList(sst, locationVo);
	}

	// 작성하기
	public int write(QueryVo vo, List<FileVo> queryList) {
		int queryResult = dao.write(sst, vo);
		System.out.println("ser - write 시작하자마자 queryResult : " + queryResult);

		int attResult = 1;
		if (queryList.size() > 0) {
			System.out.println("ser-write-dao.insertAttach 가기전 vo : " + vo + " / queryList : " + queryList);
			attResult = dao.insertAttachment(sst, queryList);
		}
		return queryResult * attResult;
	}

	// 첨부파일 가져오기
	public FileVo getAttachment(String ano) {
		return dao.getAttachment(sst, ano);
	}

	// 상세목록 가져오기
	public QueryVo getQuery(int num) throws Exception {
		int result = dao.increaseViews(sst, num);
		if (result != 1) {
			throw new Exception();
		}

		QueryVo qvo = dao.getQuery(sst, num);
		List<FileVo> fileList = dao.getAttachmentList(sst, num);
		qvo.setAttList(fileList);
		return qvo;
	}

	//수정하기
	public int edit(QueryVo vo) {
//		int selectLocation = dao.getSelectLocation(sst,vo);
//		if(selectLocation == null) {
		return dao.edit(sst, vo);
		}
	

	//삭제하기
	public int delete(String num) {
		return dao.delete(sst, num);
	}

}// class
