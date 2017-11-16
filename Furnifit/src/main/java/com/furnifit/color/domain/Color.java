package com.furnifit.color.domain;

/**
 * @author 한수진
 *
 */
public class Color {

	private String name;
	private String rgb;
	
	public Color() {}
	
	public Color(String name, String rgb) {
		this.name = name;
		this.rgb = rgb;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getRgb() {
		return rgb;
	}

	public void setRgb(String rgb) {
		this.rgb = rgb;
	}

	@Override
	public String toString() {
		return "Color [name=" + name + ", rgb=" + rgb + "]";
	}
	
	
}
