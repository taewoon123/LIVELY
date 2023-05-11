package com.lively.notice.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lively.notice.dao.NoticeDao;
import com.lively.notice.page.vo.PageVo;
import com.lively.notice.vo.NoticeVo;

@Service
@Transactional
public class NoticeService {
	
	private final NoticeDao dao;
	private final SqlSessionTemplate sst;
	
	@Autowired
	public NoticeService(NoticeDao dao, SqlSessionTemplate sst) {
		this.dao = dao;
		this.sst = sst;
	}

	public List<NoticeVo> getNoticeList() {
		return dao.getNoticeList(sst);
	}

	public int write(NoticeVo vo) {
		return dao.write(sst, vo);
	}


}
