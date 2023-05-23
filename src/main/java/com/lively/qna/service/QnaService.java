package com.lively.qna.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lively.common.FileVo;
import com.lively.job.page.vo.PageVo;
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

	public int write(QnaVo vo) {
		return dao.write(sst, vo);
	}

	public int getQnaCnt() {
		return dao.getQnaListCnt(sst);
	}

	//상세조회(조회수)
	public QnaVo getQna(String qnaNo) throws Exception {
		int result = dao.increaseViews(sst, qnaNo);
		if(result != 1) {
			throw new Exception();
		}
		QnaVo qvo = dao.getQna(sst, qnaNo);
		List<FileVo> fileList = dao.getAttachmentList(sst , qnaNo);
		qvo.setAttList(fileList);
		return qvo;
		}


	public int edit(QnaVo vo) {
		return dao.edit(sst, vo);
	}

	public int delete(String num) {
		return dao.delete(sst, num);
	}

	public List<Map<String, String>> CategoryList() {
		return null;
	}

	public int getCnt(Map<String, String> searchMap) {
		return 0;
	}

	public List<QnaVo> getQnaList(PageVo pv, Map<String, String> searchMap) {
		return dao.getQnaList(sst, pv);
	}

}
