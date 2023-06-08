package com.lively.help.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lively.common.FileVo;
import com.lively.common.locaion.dao.LocationDao;
import com.lively.common.locaion.vo.LocationVo;
import com.lively.help.dao.HelpDao;
import com.lively.help.vo.HelpVo;
import com.lively.page.vo.PageVo;

@Service
@Transactional
public class HelpService {
	
	private final HelpDao dao;
	private final SqlSessionTemplate sst;
	
	@Autowired
	public HelpService(HelpDao dao, SqlSessionTemplate sst, LocationDao locationDao) {
		this.dao = dao;
		this.sst = sst;
	}

	public List<HelpVo> getHelpList(PageVo pv, String searchValue) {
		return dao.getHelpList(sst, pv, searchValue);
	}
	
	public List<String> search(String searchValue) {
		return dao.search(sst, searchValue);
	}

	//게시글 갯수 조회
	public int getHelpListCnt() {
		return dao.getHelpListCnt(sst);
	}

	public int write(HelpVo vo, List<FileVo> helpList) {
		int helpResult = dao.write(sst, vo);
		
		int attResult = 1;
		if(helpList.size() > 0) {
			attResult = dao.insertAttachment(sst, helpList);
		}
		return helpResult * attResult;
	}

	//상세조회 (조회수)
	public HelpVo getHelp(int num) throws Exception {
		int result = dao.increaseViews(sst, num);
		if(result != 1) {
			throw new Exception();
		}
		
		HelpVo hvo = dao.getHelp(sst, num);
		List<FileVo> fileList = dao.getAttachmentList(sst, num);
		hvo.setAttList(fileList);
		return hvo;
	}

	//삭제하기
	public int delete(String num) {
		return dao.delete(sst, num);
	}

	public FileVo getAttachment(String ano) {
		return dao.getAttachment(sst, ano);
	}

	public int edit(HelpVo vo) {
		return dao.edit(sst, vo);
	}

	public List<LocationVo> getLocationList(LocationVo locationVo) {
		return dao.getLocationList(sst, locationVo);
	}

}
