package com.spring.manage.util;

public class PageNavigator2 {
	
	//member: srow, erow 계산하지 않고, mybatis의 기능을 사용할 예정
	
	private int countPerPage = 10;		  //한페이지당 글 개수
	public int pagePerGroup = 5; 		  //페이지 그룹당 개수
	private int totalRecordCount;		  //전체 글 개수
	private int totalPageCount; 		  //전체 페이지 개수
	private int currentPage;			  //현재 페이지
	private int currentGroup;			  //현재 페이지 그룹
	private int startPageGroup; 		  //현재 페이지 그룹의 첫 페이지 번호
	private int endPageGroup;		      //현재 페이지 그룹의 마지막 페이지 번호
	private int startRecord;			  //현재 페이지의 첫 글 번호
	
	
	//constructor
	public PageNavigator2(int countPerPage, int currentPage, int totalRecordCount) {
		
		//한페이지당 글 개수
		this.countPerPage=countPerPage;
		
		//전체 글 개수
		this.totalRecordCount = totalRecordCount;
		
		//전체 페이지 개수
		totalPageCount = (totalRecordCount + countPerPage -1 ) / countPerPage;
		
		//현재 페이지 요청시 계산
		if(currentPage<1) currentPage=1;
		if(currentPage>totalPageCount) currentPage=totalPageCount;
		this.currentPage=currentPage;
		
		//현재 페이지 그룹
		currentGroup = (currentPage-1)/pagePerGroup;
		
		//현재 그룹의 첫 페이지
		startPageGroup = currentGroup * pagePerGroup + 1;
//		if(startPageGroup<1) startPageGroup=1;
		
		//현재 그룹에 마지막 페이지
		endPageGroup = startPageGroup + pagePerGroup - 1;
		if(endPageGroup>totalPageCount) endPageGroup=totalPageCount;
		
		//전체 레코드 중에서 현재 페이지의 첫 글 위치
		startRecord = countPerPage * (currentPage-1);
		
	}


	//setter & getter
	
	
	public int getTotalRecordCount() {
		return totalRecordCount;
	}


	public void setTotalRecordCount(int totalRecordCount) {
		this.totalRecordCount = totalRecordCount;
	}


	public int getTotalPageCount() {
		return totalPageCount;
	}


	public void setTotalPageCount(int totalPageCount) {
		this.totalPageCount = totalPageCount;
	}


	public int getCurrentPage() {
		return currentPage;
	}


	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}


	public int getCurrentGroup() {
		return currentGroup;
	}


	public void setCurrentGroup(int currentGroup) {
		this.currentGroup = currentGroup;
	}


	public int getStartPageGroup() {
		return startPageGroup;
	}


	public void setStartPageGroup(int startPageGroup) {
		this.startPageGroup = startPageGroup;
	}


	public int getEndPageGroup() {
		return endPageGroup;
	}


	public void setEndPageGroup(int endPageGroup) {
		this.endPageGroup = endPageGroup;
	}


	public int getStartRecord() {
		return startRecord;
	}


	public void setStartRecord(int startRecord) {
		this.startRecord = startRecord;
	}
	

	public int getCountPerPage() {
		return countPerPage;
	}


	public void setCountPerPage(int countPerPage) {
		this.countPerPage = countPerPage;
	}


	public int getPagePerGroup() {
		return pagePerGroup;
	}


	public void setPagePerGroup(int pagePerGroup) {
		this.pagePerGroup = pagePerGroup;
	}

	//toString()

	@Override
	public String toString() {
		return "PageNavigator [COUNT_PER_PAGE=" + countPerPage + ", PAGE_PER_GROUP=" + pagePerGroup
				+ ", totalRecordCount=" + totalRecordCount + ", totalPageCount=" + totalPageCount + ", currentPage="
				+ currentPage + ", currentGroup=" + currentGroup + ", startPageGroup=" + startPageGroup
				+ ", endPageGroup=" + endPageGroup + ", startRecord=" + startRecord + "]";
	}

	
	
}
