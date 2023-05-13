package com.lively.admin.dao;

import com.lively.admin.vo.AdminVo;
import com.lively.member.vo.MemberVo;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class AdminDao {


    public AdminVo login(AdminVo adminVo,SqlSessionTemplate sqlSessionTemplate) {
        return sqlSessionTemplate.selectOne("admin.login", adminVo);
    }

    public int signup(AdminVo adminVo,SqlSessionTemplate sqlSessionTemplate) {
      return sqlSessionTemplate.insert("admin.signup", adminVo);
    }

    public List<MemberVo> presentMembers(MemberVo memberVo, SqlSessionTemplate sqlSessionTemplate) {
        return sqlSessionTemplate.selectList("admin.presentMembers",memberVo);
    }


}
