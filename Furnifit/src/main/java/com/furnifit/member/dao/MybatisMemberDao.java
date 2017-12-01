package com.furnifit.member.dao;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.furnifit.coupon.domain.Coupon;
import com.furnifit.member.domain.LoginDTO;
import com.furnifit.member.domain.Member;

/**
 * MemberDao MyBatis 구현 클래스
 * 
 * @author 김형주
 *
 */
@Repository  // Dao를 스프링에 인식, 데이터베이스 연동을 위해서 @Repository 사용
public class MybatisMemberDao implements MemberDao {

	private static final String NAMESPACE = "com.furnifit.member.dao.MemberDao";

	@Inject                         // 해당 타입의 객체를 찾아서 변수에 자동으로 할당시킴
	private SqlSession sqlSession;  // XML Mapper 파일에 등록된 SQL을 실행하기 위한 다양한 기능을 제공하기 때문에 사용했음
	
	/**
	 * 회원가입을 위해서 Mapper 파일에 등록된 SQL문 실행
	 * @param Member member
	 */
	@Override
	public void create(Member member) {
		sqlSession.insert(NAMESPACE + ".create", member);
	}
	
	/**
	 * 회원정보를 읽기 위해서 Mapper 파일에 등록된 SQL문 실행
	 * @param String email
	 * @return Member
	 */
	@Override
	public Member read(String email) {
		return sqlSession.selectOne(NAMESPACE + ".read", email);
	}
	
	/**
	 * 회원정보를 읽기 위해서 Mapper 파일에 등록된 SQL문 실행
	 * @param String sessionId
	 * @return Member
	 */
	@Override
	public Member checkUserBySession(String sessionId) {
		return sqlSession.selectOne(NAMESPACE + ".readBySession", sessionId);
	}
	
	/**
	 * 회원정보를 수정하기 위해서 Mapper 파일에 등록된 SQL문 실행
	 * @param Member member
	 * @return int
	 */
	@Override
	public int update(Member member) {
		return sqlSession.update(NAMESPACE + ".update", member);
	}
	
	/**
	 * 회원정보를 삭제하기 위해서 Mapper 파일에 등록된 SQL문 실행
	 * @param String email
	 */
	@Override
	public void delete(String email) {
		sqlSession.delete(NAMESPACE + ".delete", email);
	}
	
	/**
	 * 회원 비밀번호 체크를 위해서 Mapper 파일에 등록된 SQL문 실행
	 * @param String email, String passwd
	 * @return boolean result
	 */
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
	
	/**
	 * 로그인을 위해서 Mapper 파일에 등록된 SQL문 실행
	 * @param LoginDTO dto
	 * @return Member
	 */
	@Override
	public Member login(LoginDTO dto) {
		return sqlSession.selectOne(NAMESPACE + ".login", dto);
	}
	
	/**
	 * 로그인 유지를 위해서 파일에 등록된 SQL문 실행
	 * @param String email, String sessionid, Date sessionlimit
	 */
	@Override
	public void keepLogin(String email, String sessionid, Date sessionlimit) throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("email", email);
		paramMap.put("sessionid", sessionid);
		paramMap.put("sessionlimit", sessionlimit);
		sqlSession.update(NAMESPACE + ".keepLogin", paramMap);
	}

	@Override
	public int checkSignup(Member member) {
		return sqlSession.selectOne(NAMESPACE + ".checkSignup", member);
	}
	
}
