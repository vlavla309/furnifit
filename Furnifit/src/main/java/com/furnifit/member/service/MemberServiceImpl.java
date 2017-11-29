package com.furnifit.member.service;

import java.util.Date;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.furnifit.member.dao.MemberDao;
import com.furnifit.member.domain.LoginDTO;
import com.furnifit.member.domain.Member;

/**
 * MemberServiceImpl MemberService의 구현 클래스
 * 
 * @author 김호준
 */
@Service  // Service를 스프링에 인식, 비즈니스 로직 처리를 위해서 @Service 클래스 사용
public class MemberServiceImpl implements MemberService {
	
	@Inject                 // 해당 타입의 객체를 찾아서 변수에 자동으로 할당시킴
	private MemberDao dao;  // XML Mapper 파일에 등록된 SQL을 실행하기 위한 다양한 기능을 제공하기 때문에 사용했음
	
	/**
	 * 로그인을 위해서 Service단에서 최종단인 dao를 호출
	 * @param LoginDTO dto
	 * @return Member
	 */
	@Override
	public Member login(LoginDTO dto) throws Exception {
		return dao.login(dto);
	}
	
	/**
	 * 로그인 유지를 위해서 Service단에서 최종단인 dao를 호출
	 * @param String email, String sessionid, Date sessionlimit
	 */
	@Override
	public void keepLogin(String email, String sessionid, Date sessionlimit) throws Exception {
		dao.keepLogin(email, sessionid, sessionlimit);
		
	}
	
	/**
	 * 로그인 체크를 위해서 Service단에서 최종단인 dao를 호출
	 * @param String sessionid
	 * @return Member
	 */
	@Override
	public Member checkLoginBefore(String sessionid) throws Exception {
		return dao.checkUserBySession(sessionid);
	}
	
	/**
	 * 회원가입을 위해서 Service단에서 최종단인 dao를 호출
	 * @param Member member
	 */
	@Override
	public void create(Member member) {
		dao.create(member);
	}
	
	/**
	 * 회원정보 수정을 위해서 Service단에서 최종단인 dao를 호출
	 * @param Member member
	 * @return int
	 */
	@Override
	public int update(Member member) {
		return dao.update(member);
	}
	
	/**
	 * 탈퇴를 위해서 Service단에서 최종단인 dao를 호출
	 * @param String email
	 */
	@Override
	public void delete(String email) {
		dao.delete(email);
	}
	
	/**
	 * 비밀번호 체크를 위해서 Service단에서 최종단인 dao를 호출
	 * @param String email, String passwd
	 * @return boolean
	 */
	@Override
	public boolean checkPw(String email, String passwd) {
		return dao.checkPw(email, passwd);
	}
}
