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
	private int useCoupones;
	
	public Orders() {}
	
	public Orders(String email, int price) {
		this.email = email;
		this.price = price;
	}
	
	public Orders(int orderId, String email, int price, String regdate, int useCoupones) {
		super();
		this.orderId = orderId;
		this.email = email;
		this.price = price;
		this.regdate = regdate;
		this.useCoupones = useCoupones;
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

	public int getUseCoupones() {
		return useCoupones;
	}

	public void setUseCoupones(int useCoupones) {
		this.useCoupones = useCoupones;
	}

	@Override
	public String toString() {
		return "Orders [orderId=" + orderId + ", email=" + email + ", price=" + price + ", regdate=" + regdate
				+ ", useCoupones=" + useCoupones + "]";
	}
}
