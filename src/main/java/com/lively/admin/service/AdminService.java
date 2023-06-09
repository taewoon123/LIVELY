package com.lively.admin.service;


import com.lively.admin.dao.AdminDao;
import com.lively.admin.vo.AdminVo;
import com.lively.member.vo.MemberVo;
import com.lively.page.vo.PageVo;
import lombok.extern.slf4j.Slf4j;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Slf4j
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

    public List<MemberVo> presentMembers(MemberVo memberVo, PageVo pageVo) {
        //retrieve memberList from Database
        return dao.presentMembers(memberVo, sqlSessionTemplate, pageVo);
    }

    //delete members in Admin dashboard set QUIT_YN='Y'
    public int memberDelete(List<Integer> deleteList) {
        return dao.memberDelete(deleteList, sqlSessionTemplate);
    }

    public int getMemberCount() {
        return dao.getMemberCount(sqlSessionTemplate);
    }
    public int getQueryCount() {
        return dao.getQueryCount(sqlSessionTemplate);
    }
    public int getHelpCount() {
        return dao.getHelpCount(sqlSessionTemplate);
    }
    public int getJobCount() {
        return dao.getJobCount(sqlSessionTemplate);
    }
    public int getFundCount() {
       return dao.getFundCount(sqlSessionTemplate);
   }
   public int getFriendCount() {
       return dao.getFriendCount(sqlSessionTemplate);
   }
   public int getMarketCount() {
       return dao.getMarketCount(sqlSessionTemplate);
   }
}
