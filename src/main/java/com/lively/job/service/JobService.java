package com.lively.job.service;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lively.job.dao.JobDao;
import com.lively.job.vo.JobVo;

@Service
@Transactional
public class JobService {
    
    private final JobDao dao;
    private final SqlSessionTemplate sst;
    
    
    @Autowired
    public JobService(JobDao dao, SqlSessionTemplate sst) {
        this.dao = dao;
        this.sst = sst;
    }
    
    public List<JobVo> getJobList() {
        return dao.getJobList(sst);
    }
}