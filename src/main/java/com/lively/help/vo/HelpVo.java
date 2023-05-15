package com.lively.help.vo;

import lombok.Data;

@Data
public class HelpVo {
	private String helpNo;
	private String title;
	private String content;
	private String enrollDate;
	private String writer;
	private String editDate;
	private String deleteYn;
	private String views;
}
