package com.furnifit.planitem.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.furnifit.planitem.domain.PlanItem;

/**
 * PlanItemDao MyBatis 구현 클래스
 * @author 손정화
 *
 */
@Repository
public class MybatisPlanItemDao implements PlanItemDao {
	
	private static final String NAMESPACE = "com.furnifit.planitem.dao.PlanItemDao";
		
	@Inject
	private SqlSession sqlSession;

	
	@Override
	public List<PlanItem> listAll(String email) throws Exception {
		return sqlSession.selectList(NAMESPACE+".listAll", email);
	}
	
	@Override
	public void delete(int planId, int planitemId) throws Exception {
		Map<String, Integer> map = new HashMap<>();
		
		map.put("planId", planId);
		map.put("planitemId", planitemId);
		
		sqlSession.delete(NAMESPACE+".delete", map);
	}
}
