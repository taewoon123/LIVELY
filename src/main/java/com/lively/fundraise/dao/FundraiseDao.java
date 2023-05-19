package com.lively.fundraise.dao;


import com.lively.fundraise.vo.FundraiseVo;
import com.lively.notice.page.vo.PageVo;
import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class FundraiseDao {
    public List<FundraiseVo> getFundList(SqlSessionTemplate sqlSessionTemplate, PageVo pageVo) {
        int limit = pageVo.getBoardLimit();
        int offset = (pageVo.getCurrentPage() - 1) * limit;
        RowBounds rb = new RowBounds(offset, limit);
        return sqlSessionTemplate.selectList("fundraise.getFundList", null, rb);
    }
    public int getFundListCount(SqlSessionTemplate sst) {
        return sst.selectOne("fundraise.getFundListCount");
    }

    public FundraiseVo getFundDetail(int no, SqlSessionTemplate sqlSessionTemplate) {
        return sqlSessionTemplate.selectOne("fundraise.getFundDetail", no);
    }

    public int gainViews(SqlSessionTemplate sqlSessionTemplate, int no) {
        return sqlSessionTemplate.update("fundraise.gainViews", no);
    }
}