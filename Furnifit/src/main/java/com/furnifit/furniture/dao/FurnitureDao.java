package com.furnifit.furniture.dao;

import java.util.List;

import com.furnifit.furniture.domain.Furniture;


public interface FurnitureDao {
	
	public void create(int planitemId, int productId);
	
	public List<Furniture> list (int planitemId);

}
