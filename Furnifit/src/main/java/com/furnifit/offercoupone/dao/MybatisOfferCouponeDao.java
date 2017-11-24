package com.furnifit.offercoupone.dao;

import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

/**
 * @author 한수진
 *
 */
@Repository
public class MybatisOfferCouponeDao implements OfferCouponeDao {

	private static final String NAMESPACE = "com.furnifit.offercoupone.dao.OfferCouponeDao";
	
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public void create(Map<String, String> map) {
		sqlSession.insert(NAMESPACE+".createCoupone",map);
	}

	@Override
	public void update() {
		sqlSession.update(NAMESPACE+".updateCoupone");
	}

}
