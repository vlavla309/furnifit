package com.furnifit.orders.domain;

/**
 *
 * @author 손정화
 *
 */
public class Orders{
	private int orderId;
	private String email;
	private int price;
	private String regdate;
	
	public Orders() {}
	
	public Orders(int orderId, String email, int price, String regdate) {
		super();
		this.orderId = orderId;
		this.email = email;
		this.price = price;
		this.regdate = regdate;
	}

	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	@Override
	public String toString() {
		return "Order [orderId=" + orderId + ", email=" + email + ", price=" + price + ", regdate=" + regdate + "]";
	}
}
