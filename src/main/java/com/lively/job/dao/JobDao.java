package com.lively.job.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.lively.common.FileVo;
import com.lively.job.vo.JobVo;
import com.lively.page.vo.PageVo;


@Repository
public class JobDao {
    
	//목록조회
    public List<JobVo> getJobList(SqlSessionTemplate sst, PageVo pv, String searchValue) {
    	int limit = pv.getBoardLimit();
		int offset = (pv.getCurrentPage()-1) * limit;
		RowBounds rb = new RowBounds(offset , limit);
		return sst.selectList("job.getJobList" , searchValue, rb);
    }

    
    //작성하기
	public int write(SqlSessionTemplate sst, JobVo vo) {
		return sst.insert("job.write", vo);
	}

	//상세조회(조횟)
	public JobVo getJob(SqlSessionTemplate sst, String no) {
		return sst.selectOne("job.getJob", no);
	}

	//조회수
	public int increaseHit(SqlSessionTemplate sst, String no) {
		return sst.update("job.increaseHit", no);
	}
	
	//수정하기(작성자만)
	public int edit(SqlSessionTemplate sst, JobVo vo) {
		System.out.println(vo);
		return sst.update("job.edit" , vo);
	}
	//삭제하기(작성자만)
	public int delete(SqlSessionTemplate sst, String no) {
		return sst.update("job.delete" , no);
	}
	
	
	public List<Map<String, String>> getCategoryList(SqlSessionTemplate sst) {
		return sst.selectList("job.getCategoryList");
	}
	public int insertAttachment(SqlSessionTemplate sst, List<FileVo> fvoList) {
		return sst.insert("job.insertAttachment", fvoList);
	}


	public List<FileVo> getAttachmentList(SqlSessionTemplate sst, String no) {
		return sst.selectList("job.getAttachmentList",no);
	}

	public FileVo getAttachment(SqlSessionTemplate sst, String ano) {
		return sst.selectOne("job.getAttachment",ano);
	}

	public int getJobListCnt(SqlSessionTemplate sst) {
		return sst.selectOne("job.getJobListCnt");
	}

    
}