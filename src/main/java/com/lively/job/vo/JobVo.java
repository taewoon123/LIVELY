package com.lively.job.vo;

import java.util.List;

import com.lively.job.file.FileVo;

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
	
	public String categoryName;
	private String writerName;
    private List<FileVo> attList;
	
}
