package com.furnifit.plan.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.furnifit.plan.domain.Plan;

/**
 * PlanDaoMyBatis 구현 클래스
 * @author 손정화
 *
 */
@Repository
public class MybatisPlanDao implements PlanDao {
	
	private static final String NAMESPACE = "com.furnifit.plan.dao.PlanDao";
		
	@Inject
	private SqlSession sqlSession;

	
	/**
	 * 회원별 배치도 목록 리스트
	 * @param email
	 * @return List<Plan>
	 */
	@Override
	public List<Plan> listAll(String email) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".listAll", email);
	}
	
}
