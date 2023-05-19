package com.lively.help.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lively.help.dao.HelpDao;
import com.lively.help.vo.HelpVo;
import com.lively.page.vo.PageVo;

@Service
@Transactional
public class HelpService {
	
	private final HelpDao dao;
	private final SqlSessionTemplate sst;
	
	@Autowired
	public HelpService(HelpDao dao, SqlSessionTemplate sst) {
		this.dao = dao;
		this.sst = sst;
	}

	public List<HelpVo> getHelpList(PageVo pv) {
		return dao.getHelpList(sst, pv);
	}

	public int getHelpListCnt() {
		return dao.getHelpListCnt(sst);
	}

	public int write(HelpVo vo) {
		return dao.write(sst, vo);
	}

	public HelpVo getHelp(String num) throws Exception {
		int result = dao.increaseViews(sst, num);
		if(result != 1) {
			throw new Exception();
		}
		
		return dao.getHelp(sst, num);
	}

	public int delete(String num) {
		return dao.delete(sst, num);
	}

}
