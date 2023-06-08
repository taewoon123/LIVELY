package com.lively.notice.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lively.notice.dao.NoticeDao;
import com.lively.page.vo.PageVo;
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

	public List<NoticeVo> getNoticeList(PageVo pv, String searchValue) {
		return dao.getNoticeList(sst, pv, searchValue);
	}
	
	public List<String> search(String searchValue) {
		return dao.search(sst, searchValue);
	}

	public int write(NoticeVo vo) {
		return dao.write(sst, vo);
	}

	public int getNoticeListCnt() {
		return dao.getNoticeListCnt(sst);
	}

	public NoticeVo getNotice(String num) throws Exception {
		int result = dao.increaseViews(sst, num);
		if(result != 1) {
			throw new Exception();
		}
		
		return dao.getNotice(sst, num);
	}

	public int edit(NoticeVo vo) {
		return dao.edit(sst, vo);
	}

	public int delete(String num) {
		return dao.delete(sst, num);
	}
	
	public List<NoticeVo> getNoticeListMain() {
	      return dao.getNoticeListMain(sst);
	}


}
