package com.furnifit.member.test;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.furnifit.member.dao.CouponDao;
import com.furnifit.member.dao.MemberDao;
import com.furnifit.member.domain.Coupon;
import com.furnifit.member.domain.Member;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/*.xml" }) 
public class MemberDaoTest {
	
	@Inject
	private MemberDao dao;
	
	private static Logger logger = LoggerFactory.getLogger(MemberDaoTest.class);

	//@Test
	public void testCreate() throws Exception {
		Member member = new Member();
		member.setEmail("aatest7@gmail.com");
		member.setPasswd("1111");
		member.setName("방그리");
		member.setPhone("01011111111");
		dao.create(member);
	}

	@Test
	public void testUpdate() throws Exception {
		Member member = new Member();
		member.setEmail("aatest123@gmail.com");
		member.setPasswd("3333");
		member.setName("방그리test2");
		member.setPhone("01022222222");
		dao.update(member);
	}
	
//	@Test
	public void testDelete() throws Exception {
		//dao.delete();
	}

}
