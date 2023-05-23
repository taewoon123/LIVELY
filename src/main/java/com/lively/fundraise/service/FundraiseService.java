package com.lively.fundraise.service;

import com.lively.common.FileVo;
import com.lively.fundraise.dao.FundraiseDao;
import com.lively.fundraise.vo.FundraiseVo;
import com.lively.page.vo.PageVo;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Service
@Transactional
public class FundraiseService {
    private final FundraiseDao dao;
    private final SqlSessionTemplate sqlSessionTemplate;
    @Autowired
    public FundraiseService(FundraiseDao dao, SqlSessionTemplate sqlSessionTemplate) {
        this.dao = dao;
        this.sqlSessionTemplate = sqlSessionTemplate;
    }

    public List<FundraiseVo> getFundList(PageVo pageVo,String searchValue) {
        return dao.getFundList(sqlSessionTemplate, pageVo,searchValue);
    }

    public FundraiseVo getFundDetail(int no) {
        int result = dao.gainViews(sqlSessionTemplate, no);
        if (result != 1) {
            throw new RuntimeException();
        }
        return dao.getFundDetail(no, sqlSessionTemplate);
    }

    public int getNoticeListCount() {
       return dao.getFundListCount(sqlSessionTemplate);
    }

    public List<String> search(String searchValue) {
        return dao.search(sqlSessionTemplate, searchValue);
    }
    public int delete(String no) {
      return dao.delete(sqlSessionTemplate, no);
    }

    public int write(FundraiseVo vo, List<FileVo> fileVoList)throws Exception {
        int writeResult = dao.write(sqlSessionTemplate, vo);
        if(writeResult != 1) {
            throw new Exception();
        }
        return dao.insertAttachment(sqlSessionTemplate, fileVoList);
    }

}
