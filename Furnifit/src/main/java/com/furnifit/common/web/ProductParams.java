package com.furnifit.common.web;

import java.util.Arrays;

/**
 * 상품 조회시 사용 클래스
 * @author 김형주
 */
public class ProductParams extends Params {
	String sort; //정렬 방식
	String keyword; //검색어 검색
	String category; //카테고리(상품품목)
	String[] brands; //브랜드 검색
	int minPrice; //최소가격
	int maxPrice; //최대 가격
	int maxWidth; //최대 가로 길이
	int maxHeight; //최대 세로 길이
	int maxLength; //최대 높이
	String[] colors; //색상 검색
	
	
	public ProductParams() {
		super(1, 10, 10);
	}

	public ProductParams(int page, int pageSize, int pageNum) {
		super(page, pageSize, pageNum);
	}

	public ProductParams(int page, int pageSize, int pageNum, String sort, String keyword, String category, String[] brands, int minPrice, int maxPrice,
		int maxWidth, int maxHeight, int maxLength, String[] colors) {
		super(page, pageSize, pageNum);
		this.sort = sort;
		this.keyword = keyword;
		this.category = category;
		this.brands = brands;
		this.minPrice = minPrice;
		this.maxPrice = maxPrice;
		this.maxWidth = maxWidth;
		this.maxHeight = maxHeight;
		this.maxLength = maxLength;
		this.colors = colors;
	}

	@Override
	public String toString() {
		return "ProductParams [sort=" + sort + ", keyword=" + keyword + ", category=" + category + ", brands="
				+ Arrays.toString(brands) + ", minPrice=" + minPrice + ", maxPrice=" + maxPrice + ", maxWidth="
				+ maxWidth + ", maxHeight=" + maxHeight + ", maxLength=" + maxLength + ", colors="
				+ Arrays.toString(colors) + "]";
	}
}
