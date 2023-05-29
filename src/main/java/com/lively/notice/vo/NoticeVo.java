package com.lively.notice.vo;

import lombok.Data;

@Data
public class NoticeVo {
	private String noticeNo;
	private String noticeTitle;
	private String noticeContent;
	private String views;
	private String enrollDate;
	private String editDate;
	private String deleteYn;
	private String adminNo;

}
