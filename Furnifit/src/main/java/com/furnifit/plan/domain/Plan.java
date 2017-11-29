package com.furnifit.plan.domain;

import java.util.Arrays;
import java.util.List;

import com.furnifit.planitem.domain.PlanItem;

/**
 * @author 손정화
 *
 */
public class Plan{
	private int planId;
	private String email;
	private String name;
	private String regdate;
	private List<PlanItem> planitems;
	
	public Plan() {}

	public Plan(int planId, String email, String name, String regdate, List<PlanItem> planitems) {
		super();
		this.planId = planId;
		this.email = email;
		this.name = name;
		this.regdate = regdate;
		this.planitems = planitems;
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

	public List<PlanItem> getPlanitems() {
		return planitems;
	}

	public void setPlanitems(List<PlanItem> planitems) {
		this.planitems = planitems;
	}

	@Override
	public String toString() {
		return "Plan [planId=" + planId + ", email=" + email + ", name=" + name + ", regdate=" + regdate
				+ ", planitems=" + planitems + "]";
	}
	
	
	
}
