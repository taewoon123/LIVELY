package com.lively.job.service;
import java.util.List;
import java.util.Map;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lively.common.FileVo;
import com.lively.job.dao.JobDao;

import com.lively.job.vo.JobVo;
import com.lively.page.vo.PageVo;


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
    public List<JobVo> getJobList(PageVo pv, String searchValue) {
        return dao.getJobList(sst, pv, searchValue);
    }
    
    //작성하기
    public int write(JobVo vo, List<FileVo> jobList) {
		int jobResult = dao.write(sst,vo);
		int attResult = 1;
		if(jobList.size() > 0) {
			jobResult = dao.insertAttachment(sst, jobList);			
		}
		return jobResult * attResult;
	}

    //상세조회(조회수)
    public JobVo getJob(String no) throws Exception {
    	int result = dao.increaseHit(sst, no);
		if(result != 1) {
			
			throw new Exception();
		}
		
		JobVo jvo = dao.getJob(sst, no);
		List<FileVo> fileList = dao.getAttachmentList(sst, no);
		jvo.setAttList(fileList);
		return jvo;
	
    }
	//수정하기(작성자 본인만)
	public int edit(JobVo vo) {
		return dao.edit(sst, vo);
	}
	
	// 삭제하기 (작성자 본인만)
	public int delete(String no) {
		System.out.println(no);
		return dao.delete(sst, no);
	}
	
//	public List<Map<String, String>> getCategoryList() {
//		return dao.getCategoryList(sst);
//	}



	public FileVo getAttachment(String ano) {
		return dao.getAttachment(sst, ano);
	}

	// 게시글 갯수 조회
	public int getJobListCnt() {
		return dao.getJobListCnt(sst);
	}

	

}

