package com.lively.query.vo;

import java.util.List;

import com.lively.common.FileVo;

import lombok.Data;

@Data
public class QueryVo {

	private String queryNo;
	private String title;
	private String content;
	private String enrollDate;
	private String writer;
	private String editDate;
	private String deleteYn;
	private String views;
	private List<FileVo> attList;

	private String locationNo;
	private String locationName;
//	private String writerName;
//	private String writerId;
//	private String originName;
//	private String changeName;
//	private String deleteYnAttach;

}
