package com.furnifit.common.web;

/**
 * 여러개의 요청파라메터들을 저장위한 클래스
 * {사용자 선택페이지,  한페이지에 출력하는 글 갯수, 페이지 번호}
 *  
 * @author 김형주
 */
public class Params {
	private int page;         /** 사용자 요청 페이지 */
	private int pageSize;     /** 페이지에 출력할 행의 수 */
	private int pagiSize;      /** 페이지에 출력할 페이지 수 */
	
	public Params() {
		this(1,10, 10);
	}
	
	public Params(int page, int pageSize, int pageNum) {
		this.page = page;
		this.pageSize = pageSize;
		this.pagiSize = pageNum;
	}
	
	public int getPage() {
		return page;
	}
	
	public void setPage(int page) {
		this.page = page;
	}
	
	public int getPageSize() {
		return pageSize;
	}
	
	public void setPageSize(int pageSize) {
		if(pageSize < 0 || pageSize > 50){
			this.pageSize = 10;
			return;
		}
		this.pageSize = pageSize;
	}
	

	public int getPagiSize() {
		return pagiSize;
	}

	public void setPagiSize(int pagiSize) {
		if(pagiSize < 0 || pagiSize > 20){
			this.pagiSize = 10;
			return;
		}
		this.pagiSize = pagiSize;
	}

	@Override
	public String toString() {
		return "Params [page=" + page + ", pageSize=" + pageSize + ", pagiSize=" + pagiSize + "]";
	}
}
