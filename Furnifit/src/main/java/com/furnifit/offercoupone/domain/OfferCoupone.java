package com.furnifit.offercoupone.domain;

/**
 * @author 한수진
 *
 */
public class OfferCoupone {
	private int serial;
	private int coupone_id;
	private String email;
	private String status;
	private String expirationDate;
	private String offerDate;
	private String usedDate;
	
	
	
	/**
	 *  생성자
	 */
	public OfferCoupone() {}
	
	public OfferCoupone(int coupone_id, String email, String status) {
		this.coupone_id = coupone_id;
		this.email = email;
		this.status = status;
	}
	
	public OfferCoupone(int serial, int coupone_id, String email, String status, String expirationDate,
			String offerDate, String usedDate) {
		super();
		this.serial = serial;
		this.coupone_id = coupone_id;
		this.email = email;
		this.status = status;
		this.expirationDate = expirationDate;
		this.offerDate = offerDate;
		this.usedDate = usedDate;
	}

	@Override
	public String toString() {
		return "OfferCoupone [serial=" + serial + ", coupone_id=" + coupone_id + ", email=" + email + ", status="
				+ status + ", expirationDate=" + expirationDate + ", offerDate=" + offerDate + ", usedDate=" + usedDate
				+ "]";
	}
	
}
