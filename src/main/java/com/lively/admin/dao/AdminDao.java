package com.lively.admin.dao;

import com.lively.admin.vo.AdminVo;
import com.lively.member.vo.MemberVo;
import lombok.extern.slf4j.Slf4j;
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

    public List<MemberVo> presentMembers(MemberVo memberVo, SqlSessionTemplate sqlSessionTemplate) {
        return sqlSessionTemplate.selectList("admin.presentMembers",memberVo);
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
}
