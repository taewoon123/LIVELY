package com.lively.job.page.vo;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class PageVo {
	
	public PageVo(int listCount, int currentPage, int pageLimit, int jobLimit) {
	      this.listCount = listCount;
	      this.currentPage = currentPage;
	      this.pageLimit = pageLimit;
	      this.jobLimit = jobLimit;
	      
	      this.maxPage = (int)Math.ceil((double)listCount / jobLimit);
	      this.startPage = (currentPage-1) / pageLimit * pageLimit + 1;
	      this.endPage = startPage + pageLimit -1;
	      if(endPage > maxPage) {
	    	  endPage = maxPage;
	      }
	    
	      this.beginRow = jobLimit * (currentPage-1) + 1;
	      this.lastRow = beginRow + jobLimit -1;
	   
	   }

	   private int listCount;
	   private int currentPage;
	   private int pageLimit;
	   private int jobLimit;
	   
	   private int startPage;
	   private int endPage;
	   private int maxPage;
	   
	   private int beginRow;
	   private int lastRow;
}
