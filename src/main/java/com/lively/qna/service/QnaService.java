package com.lively.qna.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lively.common.FileVo;
import com.lively.page.vo.PageVo;
import com.lively.qna.dao.QnaDao;
import com.lively.qna.vo.QnaVo;

@Service
@Transactional
public class QnaService {

	private final QnaDao dao;
	private final SqlSessionTemplate sst;

	@Autowired
	public QnaService(QnaDao dao, SqlSessionTemplate sst) {
		this.dao = dao;
		this.sst = sst;
	}

	//작성하기
	public int write(QnaVo vo) {
		return dao.write(sst, vo);
	}
	
	//게시물 갯수 조회
	public int getQnaCnt() {
		return dao.getQnaListCnt(sst);
	}

	// 상세조회(조회수)
	public QnaVo getQna(String no) throws Exception {
		
		int result = dao.increaseHit(sst, no);

		if (result != 1) {
			throw new Exception();
		}
		QnaVo qvo = dao.getQna(sst, no);
		return qvo;
	}

	//수정하기
	public int edit(QnaVo vo) {
		return dao.edit(sst, vo);
	}

	// 삭제하기
	public int delete(String no) {
		return dao.delete(sst, no);
	}

	//검색
	public List<QnaVo> getQnaList(PageVo pv, String searchValue) {
		return dao.getQnaList(sst, pv, searchValue);
	}

	//메인 목록 조회
	public List<QnaVo> getQnaListMain() {
		return dao.getQnaListMain(sst);
	}

	//답변하기
	public int reply(QnaVo vo) {
		return dao.reply(sst, vo);
	}

	//조회수
	public int getQnaListCnt() {
		return dao.getQnaListCnt(sst);
	}

}
