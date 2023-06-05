package com.lively.help.reply.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lively.help.reply.dao.HelpReplyDao;
import com.lively.help.reply.vo.HelpReplyVo;

@Service
@Transactional
public class HelpReplyService {
	
	private final HelpReplyDao dao;
	private final SqlSessionTemplate sst;
	
	@Autowired
	public HelpReplyService(HelpReplyDao dao, SqlSessionTemplate sst) {
		this.dao = dao;
		this.sst = sst;
	}

	public int write(HelpReplyVo vo) {
		return dao.write(sst, vo);
	}

	public List<HelpReplyVo> getHelpReplyList(String helpNo) {
		return dao.getHelpReplyList(sst, helpNo);
	}

	public int delete(HelpReplyVo rvo) {
		return dao.delete(sst, rvo);
	}

}
