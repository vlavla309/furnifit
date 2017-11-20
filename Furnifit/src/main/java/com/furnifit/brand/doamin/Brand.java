package com.furnifit.brand.doamin;

/**
 * @author 한수진
 *
 */
public class Brand {

	private String name;
	private String link;
	
	
	public Brand() {}
	
	public Brand(String name, String link) {
		super();
		this.name = name;
		this.link = link;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}

	@Override
	public String toString() {
		return "Brand [name=" + name + ", link=" + link + "]";
	}
	
	
}
