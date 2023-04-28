package com.lively.member.vo;

public class MyPostVo {

	private String no;
	private String title;
	private String content;
	private String writer;
	private String enroll_date;
	private String delete_yn;
	private String hit;
	private String category1;
	private String changeName;

	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getEnroll_date() {
		return enroll_date;
	}

	public void setEnroll_date(String enroll_date) {
		this.enroll_date = enroll_date;
	}

	public String getDelete_yn() {
		return delete_yn;
	}

	public void setDelete_yn(String delete_yn) {
		this.delete_yn = delete_yn;
	}

	public String getHit() {
		return hit;
	}

	public void setHit(String hit) {
		this.hit = hit;
	}

	public String getCategory1() {
		return category1;
	}

	public void setCategory1(String category1) {
		this.category1 = category1;
	}

	public String getChangeName() {
		return changeName;
	}

	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}

	@Override
	public String toString() {
		return "BoardVo [no=" + no + ", title=" + title + ", content=" + content + ", writer=" + writer
				+ ", enroll_date=" + enroll_date + ", delete_yn=" + delete_yn + ", hit=" + hit + ", category1="
				+ category1 + ", changeName=" + changeName + "]";
	}

	public MyPostVo(String no, String title, String content, String writer, String enroll_date, String delete_yn,
			String hit, String category1, String changeName) {
		super();
		this.no = no;
		this.title = title;
		this.content = content;
		this.writer = writer;
		this.enroll_date = enroll_date;
		this.delete_yn = delete_yn;
		this.hit = hit;
		this.category1 = category1;
		this.changeName = changeName;
	}

	public MyPostVo() {
		super();
	}
}
