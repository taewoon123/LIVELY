package com.lively.admin.dao;

import com.lively.admin.vo.AdminVo;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class AdminDao {


    public AdminVo login(AdminVo adminVo,SqlSessionTemplate sqlSessionTemplate) {
        return sqlSessionTemplate.selectOne("admin.login", adminVo);
    }
}
