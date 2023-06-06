package com.lively.help.vo;

import java.util.List;

import com.lively.common.FileVo;

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
	
	private List<FileVo> attList;
	
//	private String locationName;
//	private String writerName;
//	private String writerId;
//	private String originName;
//	private String changeName;
//	private String deleteYnAttach;
	
}
