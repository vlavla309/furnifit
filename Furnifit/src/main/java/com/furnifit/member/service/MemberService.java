package com.furnifit.member.service;

import java.util.Date;

import com.furnifit.member.domain.LoginDTO;
import com.furnifit.member.domain.Member;

public interface MemberService {
	
public Member login(LoginDTO dto) throws Exception;
	
	public void keepLogin(String email, String sessionid, Date sessionlimit) throws Exception;
	
	public Member checkLoginBefore(String sessionid) throws Exception;
	
	public void create(Member member);
	
	public int update(Member member);
	
	public void delete(String email);
	
	public boolean checkPw(String email, String passwd) throws Exception;

}
