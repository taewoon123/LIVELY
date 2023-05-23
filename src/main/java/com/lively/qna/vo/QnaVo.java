package com.lively.qna.vo;

import java.util.List;

import org.springframework.stereotype.Component;

import com.lively.job.file.FileVo;

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
	public void setAttList(List<FileVo> fileList) {
	}
}

