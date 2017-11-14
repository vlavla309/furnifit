package com.furnifit.member.dao;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.furnifit.member.domain.LoginDTO;
import com.furnifit.member.domain.Member;

/**
 * MemberDao MyBatis 구현 클래스
 * 
 * @author 김형주
 *
 */
@Repository
public class MybatisMemberDao implements MemberDao {

	private static final String NAMESPACE = "com.furnifit.member.dao.MemberDao";

	@Inject
	private SqlSession sqlSession;

	@Override
	public void create(Member member) {
		sqlSession.insert(NAMESPACE + ".create", member);
	}

	@Override
	public Member read(String email) {
		return sqlSession.selectOne(NAMESPACE + ".read", email);
	}

	@Override
	public Member checkUserBySession(String sessionId) {
		return sqlSession.selectOne(NAMESPACE + ".readBySession", sessionId);
	}

	@Override
	public int update(Member member) {
		return sqlSession.update(NAMESPACE + ".update", member);
	}

	@Override
	public void delete(String email) {
		sqlSession.delete(NAMESPACE + ".delete", email);
	}

	@Override
	public boolean checkPw(String email, String passwd) {
		boolean result = false;
		Map<String, String> map = new HashMap<String, String>();
		map.put("email", email);
		map.put("passwd", passwd);
		int count = sqlSession.selectOne("member.checkPw", map);
		if (count == 1) {
			result = true;
		}
		return result;
	}

	@Override
	public Member login(LoginDTO dto) {
		return sqlSession.selectOne(NAMESPACE + ".login", dto);
	}

	@Override
	public void keepLogin(String email, String sessionid, Date sessionlimit) throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("email", email);
		paramMap.put("sessionid", sessionid);
		paramMap.put("sessionlimit", sessionlimit);
		sqlSession.update(NAMESPACE + ".keepLogin", paramMap);
	}

}
