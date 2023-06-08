package com.lively.fundraise.dao;


import com.lively.common.FileVo;
import com.lively.fundraise.vo.FundraiseVo;
import com.lively.page.vo.PageVo;
import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class FundraiseDao {
    public List<FundraiseVo> getFundList(SqlSessionTemplate sqlSessionTemplate, PageVo pageVo,String searchValue) {
        int limit = pageVo.getBoardLimit();
        int offset = (pageVo.getCurrentPage() - 1) * limit;
        RowBounds rb = new RowBounds(offset, limit);
        return sqlSessionTemplate.selectList("fundraise.getFundList", searchValue, rb);
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
    public List<String> search(SqlSessionTemplate sqlSessionTemplate,String searchValue) {
        return sqlSessionTemplate.selectList("fundraise.search", searchValue);
    }    
    public int delete(SqlSessionTemplate sqlSessionTemplate, String no) {
        return sqlSessionTemplate.delete("fundraise.delete", no);
    }
    public int write(SqlSessionTemplate sqlSessionTemplate, FundraiseVo vo) {
        System.out.println("dao write " + vo);
        return sqlSessionTemplate.insert("fundraise.write", vo);
    }
    public int insertAttachment(SqlSessionTemplate sst, List<FileVo> fileVoList) {
        System.out.println("dao's fileVo LIst " + fileVoList);
        return sst.insert("fundraise.insertAttachment", fileVoList);
    }
    public List<FileVo> getAttachmentList(SqlSessionTemplate sst, int no) {
        return sst.selectList("fundraise.getAttachmentList", no);
    }
    public int getMoney(SqlSessionTemplate sqlSessionTemplate, int no) {
        return sqlSessionTemplate.selectOne("fundraise.getMoney", no);
    }

    public int edit(SqlSessionTemplate sqlSessionTemplate, FundraiseVo vo) {
        return sqlSessionTemplate.update("fundraise.edit", vo);
    }

    //    public int fundDonate(SqlSessionTemplate sqlSessionTemplate, FundraiseVo vo) {
//        return sqlSessionTemplate.update("fundraise.gainCurrentMoney",vo);
//    }
    public int fundDonate(SqlSessionTemplate sqlSessionTemplate, Map<String, String> donateMap) {
        return sqlSessionTemplate.update("fundraise.donate", donateMap);


    }
    
    
}
