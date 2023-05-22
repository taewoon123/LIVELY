package com.lively.help.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.lively.help.vo.HelpVo;
import com.lively.page.vo.PageVo;

@Repository
public class HelpDao {

	//목록 조회
	public List<HelpVo> getHelpList(SqlSessionTemplate sst, PageVo pv) {
		int limit = pv.getBoardLimit();
		int offset = (pv.getCurrentPage()-1) * limit;
		RowBounds rb = new RowBounds(offset, limit);
		return sst.selectList("help.getHelpList", null, rb);
	}

	//게시글 갯수 조회
	public int getHelpListCnt(SqlSessionTemplate sst) {
		return sst.selectOne("help.getHelpListCnt");
	}

	public int write(SqlSessionTemplate sst, HelpVo vo) {
		return sst.insert("help.write", vo);
	}

	//조회수
	public int increaseViews(SqlSessionTemplate sst, String num) {
		return sst.update("help.increaseViews", num);
	}

	public HelpVo getHelp(SqlSessionTemplate sst, String num) {
		return sst.selectOne("help.getHelp", num);
	}

	public int delete(SqlSessionTemplate sst, String num) {
		return sst.delete("help.delete", num);
	}

}
