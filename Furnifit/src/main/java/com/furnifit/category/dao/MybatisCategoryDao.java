package com.furnifit.category.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.furnifit.category.doamin.Category;

@Repository
public class MybatisCategoryDao implements CategoryDao {

	private static final String NAMESPACE = "com.furnifit.category.dao.CategoryDao";
	
	@Inject
	private SqlSession sqlSession;
	
	
	@Override
	public List<Category> list() {
		return sqlSession.selectList(NAMESPACE+".list");
	}

}
