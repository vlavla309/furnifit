package com.furnifit.category.doamin;

/**
 * @author 한수진
 *
 */
public class Category {
	private String name;

	public Category() {}
	
	public Category(String name) {
		this.name = name;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "Category [name=" + name + "]";
	}
	
	
	
}
