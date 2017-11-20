package com.furnifit.furniture.dao;

import java.util.List;

import com.furnifit.furniture.domain.Furniture;


public interface FurnitureDao {
	
	public List<Furniture> list (int planitemId);

}
