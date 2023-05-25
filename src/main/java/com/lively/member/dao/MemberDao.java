package com.lively.member.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.lively.member.vo.MemberVo;

@Repository
public class MemberDao {

	public int join(MemberVo vo, SqlSessionTemplate sst) throws Exception {
		return sst.insert("member.join", vo);
	}

	public int checkId(SqlSessionTemplate sst, String id) {
		// return conn.mybatis메소드("쿼리문위치", 전달할 객체);
		return sst.selectOne("member.checkId", id);
	}

	public MemberVo login(SqlSessionTemplate sst, MemberVo memberVo) {

		return sst.selectOne("member.login", memberVo);
	}

	public int myInfo(SqlSessionTemplate sst, MemberVo vo) {
		return sst.update("member.myInfo", vo);
	}

	public MemberVo selectOneByNo(SqlSessionTemplate sst, MemberVo vo) {
		return sst.selectOne("member.getMember", vo);
	}

}// class
