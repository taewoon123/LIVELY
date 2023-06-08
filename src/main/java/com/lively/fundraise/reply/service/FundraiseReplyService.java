package com.lively.fundraise.reply.service;

import com.lively.fundraise.reply.dao.FundraiseReplyDao;
import com.lively.fundraise.reply.vo.FundraiseReplyVo;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class FundraiseReplyService {
    private final FundraiseReplyDao dao;
    private final SqlSessionTemplate sqlSessionTemplate;

    @Autowired
    public FundraiseReplyService(FundraiseReplyDao dao, SqlSessionTemplate sqlSessionTemplate) {
        this.dao = dao;
        this.sqlSessionTemplate = sqlSessionTemplate;
    }

    public int write(FundraiseReplyVo vo) {
        return dao.write(sqlSessionTemplate, vo);
    }

    public List<FundraiseReplyVo> getFundraiseReplyList(String fundNo) {
        return dao.getFundraiseReplyList(sqlSessionTemplate, fundNo);
    }

    public int delete(FundraiseReplyVo replyVo) {
        return dao.delete(sqlSessionTemplate, replyVo);
    }

    
}
