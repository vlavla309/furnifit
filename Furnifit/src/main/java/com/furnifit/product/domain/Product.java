package com.furnifit.product.domain;

import java.util.Arrays;

/**
 * @author 한수진
 *
 */
public class Product {
	
	private int productId;  // 테이블 column :  product_id 
	private String category;  // 선반, 쇼파, 식탁, 옷장, 책상, 침대
	private String name;
	private String brand;  //일룸, 까사미아, 이케아
	private int price; 
	private String color;  //black, white, braun , walnut, green
	private int width;
	private int length;
	private int height;
	private String description;
	private String[] files;
	
	/**
	 * 생성자 
	 */
	public Product() {}
	
	
	public Product(String category, String name, String brand, int price, String color, int width, int length,
			int height, String description, String[] files) {
		super();
		this.category = category;
		this.name = name;
		this.brand = brand;
		this.price = price;
		this.color = color;
		this.width = width;
		this.length = length;
		this.height = height;
		this.description = description;
		this.files = files;
	}

	public Product(int productId, String category, String name, String brand, int price, String color, int width,
			int length, int height, String description, String[] files) {
		super();
		this.productId = productId;
		this.category = category;
		this.name = name;
		this.brand = brand;
		this.price = price;
		this.color = color;
		this.width = width;
		this.length = length;
		this.height = height;
		this.description = description;
		this.files = files;
	}

	/**
	 * setter getter
	 */
	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public int getWidth() {
		return width;
	}

	public void setWidth(int width) {
		this.width = width;
	}

	public int getLength() {
		return length;
	}

	public void setLength(int length) {
		this.length = length;
	}

	public int getHeight() {
		return height;
	}

	public void setHeight(int height) {
		this.height = height;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	
	public String[] getFiles() {
		return files;
	}


	public void setFiles(String[] files) {
		this.files = files;
	}

	/* 
	 * @see Product#toString()
	 */
	@Override
	public String toString() {
		return "Product [productId=" + productId + ", category=" + category + ", name=" + name + ", brand=" + brand
				+ ", price=" + price + ", color=" + color + ", width=" + width + ", length=" + length + ", height="
				+ height + ", description=" + description + ", files=" + Arrays.toString(files) + "]";
	}
	
}
