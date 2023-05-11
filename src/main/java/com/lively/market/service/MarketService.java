package com.lively.market.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lively.market.dao.MarketDao;
import com.lively.market.vo.MarketVo;

@Service
@Transactional
public class MarketService {

	private final MarketDao dao;
	private final SqlSessionTemplate sst;
	
	@Autowired
	public MarketService(MarketDao dao, SqlSessionTemplate sst) {
		this.dao = dao;
		this.sst = sst;
	}
	
	public List<MarketVo> getMarketFeed(){
		return dao.getMarketFeed(sst);
	}
}

