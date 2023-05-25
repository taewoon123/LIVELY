package com.lively.job.service;
import java.util.List;
import java.util.Map;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lively.common.FileVo;
import com.lively.job.dao.JobDao;

import com.lively.job.page.vo.PageVo;
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
    
    //목록조회
    public List<JobVo> getJobList(PageVo pv,Map<String, String> searchMap ) {
        return dao.getJobList(sst, pv , searchMap);
    }
    
    //작성하기
    public int write(JobVo vo) throws Exception {
		return dao.write(sst,vo);
	}

    //상세조회(조회수)
    public JobVo getJob(String no) throws Exception {
    	int result = dao.increaseHit(sst, no);
		if(result != 1) {
			
			throw new Exception();
		}
		
		JobVo jvo = dao.getJob(sst, no);
		return jvo;
	
    }
	//수정하기(작성자 본인만)
	public int updateJob(JobVo vo) {
		return dao.updateJob(sst, vo);
	}
	// 삭제하기 (작성자 본인만)
	public int delete(JobVo vo) {
		return dao.delete(sst, vo);
	}
	// 게시글 갯수 조회
	public int getCnt(Object searchMap) {
		return dao.getCnt(sst , searchMap);
	}

//	public List<Map<String, String>> getCategoryList() {
//		return dao.getCategoryList(sst);
//	}



	public FileVo getAttachment(String ano) {
		return dao.getAttachment(sst, ano);
	}

	

}

