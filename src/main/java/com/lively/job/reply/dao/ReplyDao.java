package com.lively.job.reply.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.lively.job.reply.vo.ReplyVo;

@Repository
public class ReplyDao {

	public int write(SqlSessionTemplate sst, ReplyVo vo) {
		return sst.insert("job-reply.write" , vo);
	}

	public List<ReplyVo> getReplyList(SqlSessionTemplate sst, String no) {
		return sst.selectList("job-reply.getReplyList", no);
	}

	public int delete(SqlSessionTemplate sst, ReplyVo rvo) {
		return sst.update("job-reply.delete", rvo);
	}

}
