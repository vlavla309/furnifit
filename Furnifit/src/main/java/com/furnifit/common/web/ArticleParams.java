package com.furnifit.common.web;

/**
 * 공유 배치도 조회시 사용 클래스
 * @author 김형주
 */
public class ArticleParams extends Params {
	String sort; //정렬 방식
	String acreage; //평수 (xs, s, m, l, xl);
	
	public ArticleParams() {
		super(1, 10, 10);
	}
	
	public ArticleParams(int page, int pageSize, int pageNum) {
		super(page, pageSize, pageNum);
	}

	public ArticleParams(int page, int pageSize, int pageNum, String sort, String acreage) {
		super(page, pageSize, pageNum);
		this.sort=sort;
		this.acreage=acreage;
	}
	
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}
	public String getAcreage() {
		return acreage;
	}
	public void setAcreage(String acreage) {
		this.acreage = acreage;
	}

	@Override
	public String toString() {
		return "ArticleParams [sort=" + sort + ", acreage=" + acreage + "]";
	}
}
