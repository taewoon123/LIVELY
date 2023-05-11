package com.lively.job.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lively.job.dao.JobDao;
import com.lively.job.vo.JobVo;

@Service
public class JobService {
    
    private static JobDao jobDao;
    
    @Autowired
    public JobService(JobDao jobDao) {
        this.jobDao = jobDao;
    }
    
    public static List<JobVo> getJobList() {
        return jobDao.getJobList();
    }
}