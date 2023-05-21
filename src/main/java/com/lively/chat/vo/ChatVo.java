package com.lively.chat.vo;

import lombok.Data;

@Data
public class ChatVo {
	
	private String msgNo;
	private String msgContent;
	private String msgTime;
	private String sender;
	private String roomNo;
	private String requestor;
	
}
