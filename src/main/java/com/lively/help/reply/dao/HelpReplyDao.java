package com.lively.help.reply.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.lively.help.reply.vo.HelpReplyVo;

@Repository
public class HelpReplyDao {

	public int write(SqlSessionTemplate sst, HelpReplyVo vo) {
		return sst.insert("help-reply.write", vo);
	}

	public List<HelpReplyVo> getHelpReplyList(SqlSessionTemplate sst, String helpNo) {
		return sst.selectList("help-reply.getHelpReplyList", helpNo);
	}

}
