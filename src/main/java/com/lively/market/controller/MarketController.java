package com.lively.market.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lively.market.service.MarketService;
import com.lively.market.vo.MarketVo;

@Controller
@RequestMapping("market")
public class MarketController {
	
	private final MarketService ms;
	
	@Autowired
	public MarketController(MarketService ms) {
		this.ms = ms;
	}

	//피드 목록
	@GetMapping("list")
	public String list(Model model) {
		
		List<MarketVo> marketList = ms.getMarketFeed();
		
		model.addAttribute("marketList", marketList);
		return "board/market/market-list";
	}
	
	//피드 작성
	@GetMapping("write")
	public String form() {
		return "board/market/market-write";
	}
}
