package com.lively.notice.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.lively.notice.vo.NoticeVo;

@Repository
public class NoticeDao {

	public int write(SqlSessionTemplate sst, NoticeVo vo) {
		return sst.insert("notice.write", vo);
	}

	public List<NoticeVo> getNoticeList(SqlSessionTemplate sst) {
		return sst.selectList("getNoticeList");
	}

}
