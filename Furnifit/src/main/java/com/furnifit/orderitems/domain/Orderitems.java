package com.furnifit.orderitems.domain;

public class Orderitems{
	private int productId;
	private int orderId;
	private int amount;
	
	public Orderitems() {}

	public Orderitems(int productId, int orderId, int amount) {
		super();
		this.productId = productId;
		this.orderId = orderId;
		this.amount = amount;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	@Override
	public String toString() {
		return "Orderitems [productId=" + productId + ", orderId=" + orderId + ", amount=" + amount + "]";
	}
}
