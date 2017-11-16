package com.furnifit.color.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.furnifit.color.domain.Color;

/**
 * @author 한수진
 *
 */
@Repository
public class MybatisColorDao implements ColorDao {

	private static final String NAMESPACE = "com.furnifit.color.dao.ColorDao";
	
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public List<Color> list() {
		return sqlSession.selectList(NAMESPACE+".list");
	}

}
