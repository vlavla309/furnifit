package com.furnifit.member.dao;

import java.util.Date;

import com.furnifit.member.domain.LoginDTO;
import com.furnifit.member.domain.Member;


/**
 * Member Dao 인터페이스 
 * @author 김형주
 *
 */
public interface MemberDao {
	
	/**
	 * member 추가
	 * @param member
	 */
	
	// 회원가입
	public void create(Member member);
	
	// 이메일로 회원 조회
	public Member read(String email) throws Exception;
	
	// 세션아이디에 해당하는 사용자 정보 반환
	public Member checkUserBySession(String sessionid) throws Exception;
	
	// 회원정보 수정
	public int update(Member member);
	
	// 회원 탈퇴
	public void delete(String email);
	
	/** 회원 여부 확인 */
	public Member login(LoginDTO dto);
	
	// 자동 로그인 처리를 위한 세션아이디와 유효기간 저장
	public void keepLogin(String email, String sessionid, Date sessionlimit) throws Exception;
	
	// 비밀번호 체크
	public boolean checkPw(String email, String passwd);
}
