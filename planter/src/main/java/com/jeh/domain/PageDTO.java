package com.jeh.domain;

public class PageDTO {
	// 페이지 시작 번호
	private int startPage;
	// 페이지 끝 번호
	private int endPage;
	// 이전 페이지 유무
	private boolean prev;
	// 다음 페이지 유무
	private boolean next;
	// notice 테이블의 총 데이터 건수
	private int total;
	// endPage 계산을 위한 pageNum을 불러오기 위해 클래스 포함 - ADMIN LIST 페이징/NOTICE LIST 페이징
	private Search sc;
	// endPage 계산을 위한 pageNum을 불러오기 위해 클래스 포함 - SHOP LIST 페이징
	private ShopSearch ssc;
	
	// 생성자
	public PageDTO(Search sc, int total) {
		this.sc = sc;
		this.total = total;
		
		// endPage
		// (int)(Math.ceil(현재페이지번호/10.0)) * 10; => ceil(올림함수)
		// 첫 페이지 ~ 마지막 전 페이지 계산
		this.endPage = (int)(Math.ceil(sc.getPageNum()/10.0)) * 10;
		
		// startPage
		// 10-1=9, 20-9=11...
		this.startPage = endPage - 9;
		
		// 전체 글 건수를 고려한 endPage -> realEnd(실제 마지막 페이지 번호)
		// (int)(Math.ceil((전체 건수*1.0)/sc.getAmount())); -> 소수점까지 계산되게 하기 위해서 1.0 지정
		int realEnd = (int)(Math.ceil((total*1.0)/sc.getAmount()));
		
		// realEnd < endPage일 경우, realEnd 값을 endPage에 저장
		if(realEnd < endPage) {
			this.endPage = realEnd;
		}
		
		this.prev = this.startPage > 1;
		this.next = this.endPage < realEnd;
	}
	
	public PageDTO(ShopSearch ssc, int total) {
		this.ssc = ssc;
		this.total = total;
		
		// endPage
		// (int)(Math.ceil(현재페이지번호/10.0)) * 10; => ceil(올림함수)
		// 첫 페이지 ~ 마지막 전 페이지 계산
		this.endPage = (int)(Math.ceil(ssc.getPageNum()/10.0)) * 10;
		
		// startPage
		// 10-1=9, 20-9=11...
		this.startPage = endPage - 9;
		
		// 전체 글 건수를 고려한 endPage -> realEnd(실제 마지막 페이지 번호)
		// (int)(Math.ceil((전체 건수*1.0)/sc.getAmount())); -> 소수점까지 계산되게 하기 위해서 1.0 지정
		int realEnd = (int)(Math.ceil((total*1.0)/ssc.getAmount()));
		
		// realEnd < endPage일 경우, realEnd 값을 endPage에 저장
		if(realEnd < endPage) {
			this.endPage = realEnd;
		}
		
		this.prev = this.startPage > 1;
		this.next = this.endPage < realEnd;
	}

	// getter/setter
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

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public Search getSc() {
		return sc;
	}

	public void setSc(Search sc) {
		this.sc = sc;
	}

	public ShopSearch getSsc() {
		return ssc;
	}

	public void setSsc(ShopSearch ssc) {
		this.ssc = ssc;
	}

	@Override
	public String toString() {
		return "PageDTO [startPage=" + startPage + ", endPage=" + endPage + ", prev=" + prev + ", next=" + next
				+ ", total=" + total + ", sc=" + sc + ", ssc=" + ssc + "]";
	}
	
	
	
	
	
	
	
	
	
	
}
