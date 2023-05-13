package com.lively.admin.service;


import com.lively.admin.dao.AdminDao;
import com.lively.admin.vo.AdminVo;
import com.lively.member.vo.MemberVo;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class AdminService {
    private final SqlSessionTemplate sqlSessionTemplate;
    private final AdminDao dao;
    @Autowired
    public AdminService(AdminDao dao, SqlSessionTemplate sqlSessionTemplate) {
        this.sqlSessionTemplate = sqlSessionTemplate;
        this.dao = dao;
    }

    //관리자 로그인
    public AdminVo login(AdminVo adminVo) {
        return dao.login(adminVo, sqlSessionTemplate);
    }

    //admin signup
    public int signup (AdminVo adminVo) {
        return dao.signup(adminVo, sqlSessionTemplate);
    }

    public List<MemberVo> presentMembers(MemberVo memberVo) {
        //retrieve memberList from Database
        return dao.presentMembers(memberVo, sqlSessionTemplate);
    }


}
