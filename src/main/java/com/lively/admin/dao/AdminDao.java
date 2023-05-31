package com.lively.admin.dao;

import com.lively.admin.vo.AdminVo;
import com.lively.member.vo.MemberVo;
import com.lively.page.vo.PageVo;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;
@Slf4j
@Repository
public class AdminDao {


    public AdminVo login(AdminVo adminVo,SqlSessionTemplate sqlSessionTemplate) {
        return sqlSessionTemplate.selectOne("admin.login", adminVo);
    }

    public int signup(AdminVo adminVo,SqlSessionTemplate sqlSessionTemplate) {
      return sqlSessionTemplate.insert("admin.signup", adminVo);
    }

    public List<MemberVo> presentMembers(MemberVo memberVo, SqlSessionTemplate sqlSessionTemplate, PageVo pageVo) {
        int limit = pageVo.getBoardLimit();
        int offset = (pageVo.getCurrentPage() - 1) * limit;
        RowBounds rb = new RowBounds(offset, limit);
        return sqlSessionTemplate.selectList("admin.presentMembers", memberVo, rb);
    }


    public int memberDelete(List<Integer> deleteList, SqlSessionTemplate sqlSessionTemplate) {
        int result = sqlSessionTemplate.update("admin.deleteMembers", deleteList);
        if (result <= 0 ) {
            log.info("회원 삭제 실패 {}", result);
            log.info(deleteList.get(0).toString());
        } else {
            log.info("회원 삭제 성공 {}", result);
            log.info(deleteList.toString());
        }
        return result;
    }
    public int getMemberCount(SqlSessionTemplate sqlSessionTemplate) {
        return sqlSessionTemplate.selectOne("admin.getMemberCount");
    }
    public int getQueryCount(SqlSessionTemplate sqlSessionTemplate) {
        return sqlSessionTemplate.selectOne("admin.getQueryCount");
    }
    public int getHelpCount(SqlSessionTemplate sqlSessionTemplate) {
        return sqlSessionTemplate.selectOne("admin.getHelpCount");
    }
    public int getJobCount(SqlSessionTemplate sqlSessionTemplate) {
        return sqlSessionTemplate.selectOne("admin.getJobCount");
    }
    public int getFundCount(SqlSessionTemplate sqlSessionTemplate) {
        return sqlSessionTemplate.selectOne("admin.getFundCount");
    }

    public int getFriendCount(SqlSessionTemplate sqlSessionTemplate) {
        return sqlSessionTemplate.selectOne("admin.getFriendCount");
    }

    public int getMarketCount(SqlSessionTemplate sqlSessionTemplate) {
        return sqlSessionTemplate.selectOne("admin.getMarketCount");
    }
}
