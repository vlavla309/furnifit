package com.furnifit.orderitems.domain;

import java.util.Arrays;

/**
 *
 * @author 손정화
 *
 */
public class Orderitems{
	private int productId;
	private int orderId;
	private int amount;
	private int amounts [];
	private int productIds [];
	
	public Orderitems() {}

	public Orderitems(int productId, int orderId, int amount) {
		super();
		this.productId = productId;
		this.orderId = orderId;
		this.amount = amount;
	}
	
	

	public Orderitems(int productId, int orderId, int amount, int[] amounts, int[] productIds) {
		this.productId = productId;
		this.orderId = orderId;
		this.amount = amount;
		this.amounts = amounts;
		this.productIds = productIds;
	}
	
	
	public int[] getAmounts() {
		return amounts;
	}

	public void setAmounts(int[] amounts) {
		this.amounts = amounts;
	}

	public int[] getProductIds() {
		return productIds;
	}

	public void setProductIds(int[] productIds) {
		this.productIds = productIds;
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
		return "Orderitems [productId=" + productId + ", orderId=" + orderId + ", amount=" + amount + ", amounts="
				+ Arrays.toString(amounts) + ", productIds=" + Arrays.toString(productIds) + "]";
	}
}
