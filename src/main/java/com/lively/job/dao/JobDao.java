package com.lively.job.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.lively.job.vo.JobVo;

@Repository
public class JobDao {
    
    private final SqlSession sqlSession;
    
    @Autowired
    public JobDao(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }
    
    public List<JobVo> getJobList() {
        return sqlSession.selectList("job.getJobList");
    }
}