package com.furnifit.plan.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.furnifit.common.web.Params;
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
	 * 배치도 목록 리스트
	 * @param email
	 * @return List<Plan>
	 */
	@Override
	public List<Plan> listAll(String email) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".listAll", email);
	}

	/**
	 * 배치도목록 리스트(+페이징)
	 * @param params
	 * @return List<Plan>
	 */
	@Override
	public List<Plan> listByParams(Params params) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".listByParams", params);
	}

	/**
	 * 출력페이지 계산을 위한 행의 수 반환 
	 * @param 
	 * @return int
	 */
	@Override
	public int pageCount() {
		return sqlSession.selectOne(NAMESPACE + ".pageCount");
	}
}
