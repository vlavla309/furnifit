package com.furnifit.member.service;

import java.util.Date;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.furnifit.member.dao.MemberDao;
import com.furnifit.member.domain.LoginDTO;
import com.furnifit.member.domain.Member;


@Service
public class MemberServiceImpl implements MemberService {
	
	@Inject
	private MemberDao dao;

	@Override
	public Member login(LoginDTO dto) throws Exception {
		return dao.login(dto);
	}

	@Override
	public void keepLogin(String email, String sessionid, Date sessionlimit) throws Exception {
		dao.keepLogin(email, sessionid, sessionlimit);
		
	}

	@Override
	public Member checkLoginBefore(String sessionid) throws Exception {
		return dao.checkUserBySession(sessionid);
	}

	@Override
	public void create(Member member) {
		dao.create(member);
	}

	@Override
	public int update(Member member) {
		return update(member);
	}

	@Override
	public void delete(String email) {
		delete(email);
	}

	@Override
	public boolean checkPw(String email, String passwd) {
		return dao.checkPw(email, passwd);
	}
}
