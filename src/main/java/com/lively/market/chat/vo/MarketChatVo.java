package com.lively.market.chat.vo;

import org.springframework.web.socket.TextMessage;

import lombok.Data;

@Data
public class MarketChatVo {

	private String msgNo;
	private TextMessage msgContent;
	private String msgTime;
	private String sender;
	private String roomNo;
}
