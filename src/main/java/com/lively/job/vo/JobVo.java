package com.lively.job.vo;

import java.util.List;

import com.lively.common.FileVo;

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
	private String jobCategoryNo;
	
	public String jobCategoryName;
	
	private String locationNo;
	private String locationName;
	
	private String writerName;
    private List<FileVo> attList;
	
}
