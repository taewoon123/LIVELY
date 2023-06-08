package com.lively.friend.vo;

import java.util.List;

import com.lively.common.FileVo;

import lombok.Data;

@Data
public class FriendVo {
	
	private String friendNo;
	private String writer;
	private String title;
	private String content;
	private String enrollDate;
	private String deleteYn;
	private String editDate;
	private String locationNo;
	private String statusYn;
	
	private String writerName;
	private String writerId;
	private String locationName;
	private List<FileVo> attachmentList;
	private String originName;
	private String changeName;
	private String deleteYnAttach;
	
	private String friendAttachNo;
	 
	
}
