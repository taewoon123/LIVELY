package com.lively.qna.vo;

import lombok.Data;

@Data
public class QnaVo {
	
	private String qnaNo;
	private String qnaTitle;
	private String qnaContent;
	private String views;
	private String enrollDate;
	private String editDate;
	private String deleteYn;
	private String writer;
	private String qnaReplyContent;
	private String adminNo;
	
	private String writerName;
}

