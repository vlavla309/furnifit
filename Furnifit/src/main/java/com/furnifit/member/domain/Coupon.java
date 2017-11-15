package com.furnifit.member.domain;

public class Coupon {
	private int serial;
	private int discount_rate;
	private String expiration_date;
	private String status;
	
	public int getSerial() {
		return serial;
	}
	public void setSerial(int serial) {
		this.serial = serial;
	}
	public int getDiscount_rate() {
		return discount_rate;
	}
	public void setDiscount_rate(int discount_rate) {
		this.discount_rate = discount_rate;
	}
	public String getExpiration_date() {
		return expiration_date;
	}
	public void setExpiration_date(String expiration_date) {
		this.expiration_date = expiration_date;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	@Override
	public String toString() {
		return "Coupon [serial=" + serial + ", discount_rate=" + discount_rate + ", expiration_date=" + expiration_date
				+ ", status=" + status + "]";
	}
	
}
