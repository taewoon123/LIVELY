package com.lively.common.locaion.dao;

import java.util.List;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.lively.common.locaion.vo.LocationVo;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class LocationDao {

    public List<LocationVo> getLocationList(SqlSessionTemplate sqlSessionTemplate, LocationVo locationVo) {
        log.info("sqlSessionTemplate : {}", sqlSessionTemplate);   
        log.info("getLocationList : {}", locationVo);   
        return sqlSessionTemplate.selectList("location.getLocationList", locationVo);
    }
    public int insertLocation(SqlSessionTemplate sqlSessionTemplate, LocationVo locationVo) {
        return sqlSessionTemplate.insert("location.insertLocation", locationVo);
    }
    
}
