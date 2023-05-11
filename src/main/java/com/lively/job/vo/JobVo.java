package com.lively.job.vo;

import lombok.Data;

@Data
public class JobVo {

	private String jobNo;
	private String title;
	private String content;
	private String enrollDate;
	private String writer;
	private String editDate;
	private String deleteYn;
	private String views;
	private String jobChoiceCode;
}
