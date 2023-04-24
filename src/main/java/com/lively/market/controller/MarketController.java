package com.lively.market.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("market")
public class MarketController {

	@GetMapping("list")
	public String market() {
		return "board/market/market-list";
	}
}
