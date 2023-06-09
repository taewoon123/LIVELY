package com.lively.market.vo;

import java.util.List;

import com.lively.common.FileVo;

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
	private String writerId;
	/* private List<FileVo> attachmentList; */
	private List<FileVo> attachmentList2;
	private String marketAttachNo;
	private String originName;
	private String changeName;
	/* private String deleteYnAttach; */
	/*
	 * private String originNameList; private String changeNameList;
	 */
}
