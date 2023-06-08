package com.lively.fundraise.reply.dao;

import com.lively.fundraise.reply.vo.FundraiseReplyVo;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class FundraiseReplyDao {
    public int write(SqlSessionTemplate sqlSessionTemplate, FundraiseReplyVo vo) {
       return sqlSessionTemplate.insert("fundraise-reply.write", vo);
    }

    public List<FundraiseReplyVo> getFundraiseReplyList(SqlSessionTemplate sqlSessionTemplate, String fundNo) {
        return sqlSessionTemplate.selectList("fundraise-reply.getFundraiseReplyList", fundNo);
    }

    public int delete(SqlSessionTemplate sqlSessionTemplate, FundraiseReplyVo replyVo) {
        return sqlSessionTemplate.update("fundraise-reply.delete", replyVo);
    }

    
}
