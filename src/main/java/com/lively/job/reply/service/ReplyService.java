package com.lively.job.reply.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lively.job.reply.dao.ReplyDao;
import com.lively.job.reply.vo.ReplyVo;

@Service
@Transactional
public class ReplyService {
	
	private final ReplyDao dao;
	private final SqlSessionTemplate sst;
	
	@Autowired
	public ReplyService(ReplyDao dao, SqlSessionTemplate sst) {
		this.dao = dao;
		this.sst = sst;
	}

	public int write(ReplyVo vo) {
		return dao.write(sst, vo);
	}

	public List<ReplyVo> getReplyList(String jobNo) {
		return dao.getReplyList(sst, jobNo);
	}

	public int delete(ReplyVo rvo) {
		return dao.delete(sst, rvo);
	}

}
