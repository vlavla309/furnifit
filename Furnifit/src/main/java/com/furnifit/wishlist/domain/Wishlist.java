package com.furnifit.wishlist.domain;

/**
 * @author 한수진
 *
 */
public class Wishlist {
	
	private String email;
	private int productId;
	private String regdate;
	
	public Wishlist() {}
	
	public Wishlist(String email, int productId) {}
	
	public Wishlist(String email, int productId, String regdate) {
		this.email = email;
		this.productId = productId;
		this.regdate = regdate;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	@Override
	public String toString() {
		return "Wishlist [email=" + email + ", productId=" + productId + ", regdate=" + regdate + "]";
	}

}
