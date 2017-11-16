package com.furnifit.plan.domain;

public class Plan{
	private int planId;
	private String email;
	private String name;
	private String regdate;
	
	public Plan() {}

	public Plan(int planId, String email, String name, String regdate) {
		super();
		this.planId = planId;
		this.email = email;
		this.name = name;
		this.regdate = regdate;
	}

	public int getPlanId() {
		return planId;
	}

	public void setPlanId(int planId) {
		this.planId = planId;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	@Override
	public String toString() {
		return "Plan [planId=" + planId + ", email=" + email + ", name=" + name + ", regdate=" + regdate + "]";
	}
}
