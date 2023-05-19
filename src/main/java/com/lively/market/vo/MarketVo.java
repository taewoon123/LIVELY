package com.lively.market.vo;

import lombok.Data;

@Data
public class MarketVo {

	private String marketNo;
	private String writer;
	private String title;
	private String content;
	private String price;
	private String enrollDate;
	private String editDate;
	private String deleteYn;
	private String locationNo;
	private String statusYn;
	
	private String locationName;
	private String writerName;
	
}
