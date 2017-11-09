package com.furnifit.member.service;

import java.util.Date;

import com.furnifit.member.domain.LoginDTO;
import com.furnifit.member.domain.Member;

public interface MemberService {
	
public Member login(LoginDTO dto) throws Exception;
	
	public void setAutoLogin(String email, String sessionid, Date sessionlimit) throws Exception;
	
	public Member checkLoginBefore(String sessionid) throws Exception;

}
