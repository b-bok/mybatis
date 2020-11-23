package com.kh.mybatis.common.model.vo;

public class PageInfo {

	private int listCount;
	private int currentPage;
	private int startPage;
	private int endPage;
	private int maxPage;
	private int pageLimit;
	private int boardLimt;
	
	
	public PageInfo() {}


	public PageInfo(int listCount, int currentPage, int startPage, int endPage, int maxPage, int pageLimit,
			int boardLimt) {
		super();
		this.listCount = listCount;
		this.currentPage = currentPage;
		this.startPage = startPage;
		this.endPage = endPage;
		this.maxPage = maxPage;
		this.pageLimit = pageLimit;
		this.boardLimt = boardLimt;
	}


	public int getListCount() {
		return listCount;
	}


	public void setListCount(int listCount) {
		this.listCount = listCount;
	}


	public int getCurrentPage() {
		return currentPage;
	}


	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}


	public int getStartPage() {
		return startPage;
	}


	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}


	public int getEndPage() {
		return endPage;
	}


	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}


	public int getMaxPage() {
		return maxPage;
	}


	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
	}


	public int getPageLimit() {
		return pageLimit;
	}


	public void setPageLimit(int pageLimit) {
		this.pageLimit = pageLimit;
	}


	public int getBoardLimt() {
		return boardLimt;
	}


	public void setBoardLimti(int boardLimt) {
		this.boardLimt = boardLimt;
	}


	@Override
	public String toString() {
		return "PageInfo [listCount=" + listCount + ", currentPage=" + currentPage + ", startPage=" + startPage
				+ ", endPage=" + endPage + ", maxPage=" + maxPage + ", pageLimit=" + pageLimit + ", boardLimt="
				+ boardLimt + "]";
	}
	
	
	
	
	
	
}
