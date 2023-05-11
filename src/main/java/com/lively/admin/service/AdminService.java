package com.lively.admin.service;


import com.lively.admin.dao.AdminDao;
import com.lively.admin.vo.AdminVo;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
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
}
