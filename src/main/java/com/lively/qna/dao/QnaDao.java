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

	public int write(SqlSessionTemplate sst, QnaVo vo) {
		return sst.insert("qna.write", vo);
	}

	public List<QnaVo> getQnaList(SqlSessionTemplate sst, PageVo pv) {
		int limit = pv.getBoardLimit(); //쿼리문 수정안해도 페이징 처리가 가능
		int offset = (pv.getCurrentPage()-1) * limit;
		RowBounds rb = new RowBounds(offset, limit);
		return sst.selectList("qna.getQnaList", null, rb);
	}

	public int getQnaListCnt(SqlSessionTemplate sst) {
		return sst.selectOne("qna.getQnaListCnt");
	}



	public QnaVo getQna(SqlSessionTemplate sst, String no) {
		return sst.selectOne("qna.getQna", no);
	}

	public int edit(SqlSessionTemplate sst, QnaVo vo) {
		return sst.update("qna.edit", vo);
	}

	public int delete(SqlSessionTemplate sst, String no) {
		return sst.delete("qna.delete", no);
	}

	public List<FileVo> getAttachmentList(SqlSessionTemplate sst, String no) {
		return null;
	}

	public int increaseHit(SqlSessionTemplate sst, String no) {
		return sst.update("qna.increaseHit", no);
	}

}
