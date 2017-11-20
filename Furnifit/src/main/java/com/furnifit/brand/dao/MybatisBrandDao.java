package com.furnifit.brand.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.furnifit.brand.doamin.Brand;

/**
 * @author 한수진
 *
 */
@Repository
public class MybatisBrandDao implements BrandDao {

	private static final String NAMESPACE = "com.furnifit.brand.dao.BrandDao";
	
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public List<Brand> list() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NAMESPACE+".list");
	}

}
