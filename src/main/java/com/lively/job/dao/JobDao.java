package com.lively.job.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.lively.job.vo.JobVo;

@Repository
public class JobDao {
    
    public List<JobVo> getJobList(SqlSessionTemplate sst ) {
        return sst.selectList("getJobList");
    }
    
}