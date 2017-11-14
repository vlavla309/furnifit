package com.furnifit.productimg.domain;

/**
 * 상품 이미지 doamin
 * @author 한수진
 *
 */
public class ProductImg {
	private String name; //이미지 파일이름
	private int productId;
	private String path; //이미지 경로
	private int orderNo; // 이미지의 순서! 0번은 title 이미지
	private String regdate;

	/**
	 * 생성자
	 */
	public ProductImg() {}
	
	
	public ProductImg(String name, String path, int productId, int orderNo) {
		this.name = name;
		this.path = path;
		this.productId = productId;
		this.orderNo = orderNo;
	}
	
	public ProductImg(String name, int productId, String path, int orderNo, String regdate) {
		this.name = name;
		this.productId = productId;
		this.path = path;
		this.orderNo = orderNo;
		this.regdate = regdate;
	}

	/**
	 * setter getter
	 * @return
	 */
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public int getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	/* 
	 * @see ProductImg#toString()
	 */
	@Override
	public String toString() {
		return "ProductImg [name=" + name + ", productId=" + productId + ", path=" + path + ", orderNo=" + orderNo
				+ ", regdate=" + regdate + "]";
	}
	
}
