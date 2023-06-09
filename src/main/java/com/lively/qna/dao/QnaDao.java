package com.lively.qna.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.lively.common.FileVo;
import com.lively.page.vo.PageVo;
import com.lively.qna.vo.QnaVo;

@Repository
public class QnaDao {

	// 작성하기
	public int write(SqlSessionTemplate sst, QnaVo vo) {
		return sst.insert("qna.write", vo);
	}
	
	// 목록 조회
	public List<QnaVo> getQnaList(SqlSessionTemplate sst, PageVo pv, String searchValue) {
		int limit = pv.getBoardLimit(); //쿼리문 수정안해도 페이징 처리가 가능
		int offset = (pv.getCurrentPage()-1) * limit;
		RowBounds rb = new RowBounds(offset, limit);
		return sst.selectList("qna.getQnaList", searchValue, rb);
	}
	
	// 게시물 갯수 조회
	public int getQnaListCnt(SqlSessionTemplate sst) {
		return sst.selectOne("qna.getQnaListCnt");
	}


	//상세 조회
	public QnaVo getQna(SqlSessionTemplate sst, String no) {
		return sst.selectOne("qna.getQna", no);
	}

	//수정하기
	public int edit(SqlSessionTemplate sst, QnaVo vo) {
		return sst.update("qna.edit", vo);
	}
	//삭제하기
	public int delete(SqlSessionTemplate sst, String no) {
		return sst.delete("qna.delete", no);
	}
	//조회수
	public int increaseHit(SqlSessionTemplate sst, String no) {
		return sst.update("qna.increaseHit", no);
	}

	//메인페이지 목록 조회
	public List<QnaVo> getQnaListMain(SqlSessionTemplate sst) {
		return sst.selectList("qna.getQnaList");
	}
	
	//답변하기
	public int reply(SqlSessionTemplate sst, QnaVo vo) {
		return sst.update("qna.reply", vo);
	}

}
