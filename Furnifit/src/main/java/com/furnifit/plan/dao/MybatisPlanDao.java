package com.furnifit.plan.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.furnifit.orderitems.domain.Orderitems;
import com.furnifit.plan.domain.Plan;

/**
 * OrderitemsDao MyBatis 구현 클래스
 * @author 손정화
 *
 */
@Repository
public class MybatisPlanDao implements PlanDao {
	
	private static final String NAMESPACE = "com.furnifit.plan.dao.PlanDao";
		
	@Inject
	private SqlSession sqlSession;

	// 주문별 배치도 정보 상세보기
	@Override
	public Plan read(int planitemId) throws Exception {
		return sqlSession.selectOne(NAMESPACE+".read", planitemId);
	}

	// 회원별 배치도목록 리스트
	@Override
	public List<Plan> listAll(String email) throws Exception {
		return sqlSession.selectList(NAMESPACE+".listAll", email);
	}
	
}
