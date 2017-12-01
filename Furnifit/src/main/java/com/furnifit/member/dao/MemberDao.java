package com.furnifit.member.dao;

import java.util.Date;

import com.furnifit.coupon.domain.Coupon;
import com.furnifit.member.domain.LoginDTO;
import com.furnifit.member.domain.Member;


/**
 * Member Dao 인터페이스 
 * @author 김형주
 *
 */
public interface MemberDao {
	
	/**
	 * 회원가입
	 * @param Member member
	 */
	public void create(Member member);
	
	/**
	 * 이메일로 회원 조회
	 * @param String email
	 * @return Member
	 */
	public Member read(String email) throws Exception;
	
	/**
	 * 세션 아이디에 해당하는 회원 정보 반환
	 * @param String sessionid
	 * @return Member
	 */
	public Member checkUserBySession(String sessionid) throws Exception;
	
	/**
	 * 회원정보 수정
	 * @param Member member
	 * @return int
	 */
	public int update(Member member);
	
	/**
	 * 회원 탈퇴
	 * @param String email
	 */
	public void delete(String email);
	
	/**
	 * 회원 여부 확인
	 * @param LoginDTO dto
	 * @return Member
	 */
	public Member login(LoginDTO dto);
	
	/**
	 * 자동 로그인 처리를 위한 세션아이디와 유효기간 저장
	 * @param String email, String sessionid, Date sessionlimit
	 */
	public void keepLogin(String email, String sessionid, Date sessionlimit) throws Exception;
	
	public int checkSignup(Member member);
	
	/**
	 * 비밀번호 체크
	 * @param String email, String passwd
	 * boolean
	 */
	public boolean checkPw(String email, String passwd);
}
