package com.lively.member.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lively.member.dao.MemberDao;
import com.lively.member.vo.MemberVo;

@Service
@Transactional
public class MemberService {

	private final SqlSessionTemplate sst;
	private final MemberDao dao;
	
	@Autowired
	public MemberService(SqlSessionTemplate sst, MemberDao dao) {
		this.sst = sst;
		this.dao = dao;
	}

	public int join(MemberVo vo) throws Exception {
		return dao.join(vo, sst);
	}

	public int checkId(String id) {
		// conn : 이미 지역변수 sst 있음.
		// sql : dao에게 보내기.
		return dao.checkId(sst, id);
		// tx || rs : tx는 자동처리 / rs는 mybaris가 처리해줌.
		// close : spring이 처리해줌
	}

}// class
