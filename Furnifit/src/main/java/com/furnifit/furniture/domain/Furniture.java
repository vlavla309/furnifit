package com.furnifit.furniture.domain;

public class Furniture {
	
	private int planitemId;
	private int productId;
	
	
	public Furniture() {}


	public Furniture(int planitemId, int productId) {
		this.planitemId = planitemId;
		this.productId = productId;
	}


	public int getPlanitemId() {
		return planitemId;
	}


	public void setPlanitemId(int planitemId) {
		this.planitemId = planitemId;
	}


	public int getProductId() {
		return productId;
	}


	public void setProductId(int productId) {
		this.productId = productId;
	}


	@Override
	public String toString() {
		return "Furniture [planitemId=" + planitemId + ", productId=" + productId + "]";
	}
	
	
	
	

}
