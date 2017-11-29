package com.furnifit.member.service;

import java.util.Date;

import com.furnifit.member.domain.LoginDTO;
import com.furnifit.member.domain.Member;

/**
 * MemberSerive 인터페이스 클래스
 * 
 * @author 김호준
 */
public interface MemberService {
	
	/**
	 * 로그인
	 * @param LoginDTO dto
	 * @return Member
	 */
	public Member login(LoginDTO dto) throws Exception;

	/**
	 * 로그인 keep
	 * @param String email, String sessionid, Date sessionlimit
	 */
	public void keepLogin(String email, String sessionid, Date sessionlimit) throws Exception;
	
	/**
	 * 로그인 체크
	 * @param String sessionid
	 * @return Member
	 */
	public Member checkLoginBefore(String sessionid) throws Exception;
	
	/**
	 * 회원가입
	 * @param Member member
	 */
	public void create(Member member);
	
	/**
	 * 회원수정
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
	 * 비밀번호 체크
	 * @param String email, String passwd
	 * @return boolean
	 */
	public boolean checkPw(String email, String passwd) throws Exception;

}
