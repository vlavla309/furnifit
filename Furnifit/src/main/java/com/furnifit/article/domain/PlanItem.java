package com.furnifit.article.domain;

public class PlanItem {
	
	private int planitemId;
	private int planId;
	private int width;
	private int height;
	private int length;
	private int acreage;
	private String name;
	
	
	public PlanItem() {}


	public PlanItem(int planitemId, int planId, int width, int height, int length, int acreage, String name) {
		this.planitemId = planitemId;
		this.planId = planId;
		this.width = width;
		this.height = height;
		this.length = length;
		this.acreage = acreage;
		this.name = name;
	}


	public int getPlanitemId() {
		return planitemId;
	}


	public void setPlanitemId(int planitemId) {
		this.planitemId = planitemId;
	}


	public int getPlanId() {
		return planId;
	}


	public void setPlanId(int planId) {
		this.planId = planId;
	}


	public int getWidth() {
		return width;
	}


	public void setWidth(int width) {
		this.width = width;
	}


	public int getHeight() {
		return height;
	}


	public void setHeight(int height) {
		this.height = height;
	}


	public int getLength() {
		return length;
	}


	public void setLength(int length) {
		this.length = length;
	}


	public int getAcreage() {
		return acreage;
	}


	public void setAcreage(int acreage) {
		this.acreage = acreage;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	@Override
	public String toString() {
		return "PlanItem [planitemId=" + planitemId + ", planId=" + planId + ", width=" + width + ", height=" + height
				+ ", length=" + length + ", acreage=" + acreage + ", name=" + name + "]";
	}
	
	
	
	

}
