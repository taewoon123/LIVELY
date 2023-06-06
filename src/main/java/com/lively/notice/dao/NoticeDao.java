package com.lively.notice.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.lively.page.vo.PageVo;
import com.lively.notice.vo.NoticeVo;

@Repository
public class NoticeDao {

	public int write(SqlSessionTemplate sst, NoticeVo vo) {
		return sst.insert("notice.write", vo);
	}

	public List<NoticeVo> getNoticeList(SqlSessionTemplate sst, PageVo pv, String searchValue) {
		int limit = pv.getBoardLimit(); //쿼리문 수정안해도 페이징 처리가 가능
		int offset = (pv.getCurrentPage()-1) * limit;
		RowBounds rb = new RowBounds(offset, limit);
		return sst.selectList("notice.getNoticeList", searchValue, rb);
	}

	public int getNoticeListCnt(SqlSessionTemplate sst) {
		return sst.selectOne("notice.getNoticeListCnt");
	}

	public int increaseViews(SqlSessionTemplate sst, String num) {
		return sst.update("notice.increaseViews", num);
	}

	public NoticeVo getNotice(SqlSessionTemplate sst, String num) {
		return sst.selectOne("notice.getNotice", num);
	}

	public int edit(SqlSessionTemplate sst, NoticeVo vo) {
		return sst.update("notice.edit", vo);
	}

	public int delete(SqlSessionTemplate sst, String num) {
		return sst.delete("notice.delete", num);
	}

	public List<String> search(SqlSessionTemplate sst, String searchValue) {
		return sst.selectList("notice.search", searchValue);
	}
	
	public List<NoticeVo> getNoticeListMain(SqlSessionTemplate sst) {
	      return sst.selectList("notice.getNoticeList");
	}

}
