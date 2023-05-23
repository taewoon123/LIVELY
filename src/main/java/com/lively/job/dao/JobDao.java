package com.lively.job.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.lively.job.file.FileVo;
import com.lively.job.page.vo.PageVo;
import com.lively.job.vo.JobVo;


@Repository
public class JobDao {
    
	//목록조회
    public List<JobVo> getJobList(SqlSessionTemplate sst, PageVo pv, Map<String, String> searchMap) {
    	int limit = pv.getJobLimit();
		int offset = (pv.getCurrentPage()-1) * limit;
		RowBounds rb = new RowBounds(offset , limit);
		return sst.selectList("job.getJobList" , searchMap , rb);
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
	public int updateJob(SqlSessionTemplate sst, JobVo vo) {
		return sst.update("job.updateJob" , vo);
	}
	//삭제하기(작성자만)
	public int delete(SqlSessionTemplate sst, JobVo vo) {
		return sst.update("job.delete" , vo);
	}
	//게시글 갯수 조회
	public int getCnt(SqlSessionTemplate sst, Object searchMap) {
		return sst.selectOne("job.getCnt", searchMap);
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

    
}