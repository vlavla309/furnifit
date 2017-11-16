package com.furnifit.common.web;

public class Params {
	private int page;         /** 현재 페이지 */
	private String type;      /** ����� �˻� ���� */
	private String value;     /**  */
	private int pageSize;     /** �������� ����� ���� �� */
	private int pageNum;      /** �������� ����� ������ �� */
	
	public Params() {
		this(1, null, null, 10, 10);
	}
	
	public Params(int page, String type, String value, int pageSize, int pageNum) {
		this.page = page;
		this.type = type;
		this.value = value;
		this.pageSize = pageSize;
		this.pageNum = pageNum;
	}
	
	public int getPage() {
		return page;
	}
	
	public void setPage(int page) {
		this.page = page;
	}
	
	public String getType() {
		return type;
	}
	
	public void setType(String type) {
		this.type = type;
	}
	
	public String getValue() {
		return value;
	}
	
	public void setValue(String value) {
		this.value = value;
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
	

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		if(pageNum < 0 || pageNum > 20){
			this.pageNum = 10;
			return;
		}
		this.pageNum = pageNum;
	}

	@Override
	public String toString() {
		return "Params [page=" + page + ", type=" + type + ", value=" + value + ", pageSize=" + pageSize + ", pageNum="
				+ pageNum + "]";
	}
	
}
