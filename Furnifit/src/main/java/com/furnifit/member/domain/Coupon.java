package com.furnifit.member.domain;

public class Coupon {
	private int serial;
	private int discountRate;
	private String expirationDate;
	private String status;
	
	public int getSerial() {
		return serial;
	}
	public void setSerial(int serial) {
		this.serial = serial;
	}
	public int getDiscount_rate() {
		return discountRate;
	}
	public void setDiscount_rate(int discountRate) {
		this.discountRate = discountRate;
	}
	public String getExpirationDate() {
		return expirationDate;
	}
	public void setExpiration_date(String expirationDate) {
		this.expirationDate = expirationDate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	@Override
	public String toString() {
		return "Coupon [serial=" + serial + ", discountRate=" + discountRate + ", expirationDate=" + expirationDate
				+ ", status=" + status + "]";
	}
	
}
