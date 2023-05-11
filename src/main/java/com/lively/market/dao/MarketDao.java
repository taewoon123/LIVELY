package com.lively.market.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.lively.market.vo.MarketVo;

@Repository
public class MarketDao {
	
	public List<MarketVo> getMarketFeed(SqlSessionTemplate sst){
		return sst.selectList("market.MarketFeed");
				
	}

}


