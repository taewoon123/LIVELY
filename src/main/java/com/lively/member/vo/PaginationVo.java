package com.lively.member.vo;

public class PaginationVo {
	private int totalArticle; // 게시글 총 갯수
	private int currentPage; // 현재 페이지
	private int pageLimit; // 페이지 영역에 보여줄 페이지 최대갯수
	private int boardLimit; // 한 페이지에 보여줄 게시글 최대갯수

	// ================================================================
	private int maxPage; // 마지막 페이지 ==총페이지 수
	private int startPage; // 페이지 영역 시작 값

	@Override
	public String toString() {
		return "PaginationVo{" + "totalArticle=" + totalArticle + ", currentPage=" + currentPage + ", pageLimit="
				+ pageLimit + ", boardLimit=" + boardLimit + ", maxPage=" + maxPage + ", startPage=" + startPage
				+ ", endPage=" + endPage + '}';
	}

	private int endPage; // 페이지 영역 마지막 값

	public PaginationVo(int totalArticle, int currentPage, int pageLimit, int boardLimit) {
		this.totalArticle = totalArticle;
		this.currentPage = currentPage;
		this.pageLimit = pageLimit;
		this.boardLimit = boardLimit;

		this.maxPage = (int) Math.ceil((double) totalArticle / (double) pageLimit); // if board limit is 10 and total
																					// article is 100 then max page is
																					// 10
		this.startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		this.endPage = this.startPage + pageLimit - 1;
		if (endPage > maxPage) {
			endPage = maxPage;
		}
	}

	public int getTotalArticle() {
		return totalArticle;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public int getPageLimit() {
		return pageLimit;
	}

	public int getBoardLimit() {
		return boardLimit;
	}

	public int getMaxPage() {
		return maxPage;
	}

	public int getStartPage() {
		return startPage;
	}

	public int getEndPage() {
		return endPage;
	}
}
