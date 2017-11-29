package com.furnifit.furniture.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.furnifit.furniture.domain.Furniture;

@Repository
public class MybatisFurnitureDao implements FurnitureDao {

	private static final String NAMESPACE = "com.furnifit.furniture.dao.FurnitureDao";
	
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public void create(int planitemId, int productId) {
		Map<String, Integer> map =new HashMap<>();
		map.put("planitemId", planitemId);
		map.put("productId", productId);
		
		sqlSession.insert(NAMESPACE+".create", map);
	}

	@Override
	public List<Furniture> list(int planitemId) {
		return sqlSession.selectList(NAMESPACE+".list", planitemId);
	}

}
