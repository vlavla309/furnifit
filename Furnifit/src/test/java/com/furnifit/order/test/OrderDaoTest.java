package com.furnifit.order.test;

import javax.inject.Inject;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.furnifit.article.test.ArticleDaoTest;
import com.furnifit.orders.dao.OrdersDao;
import com.furnifit.orders.domain.Orders;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/*.xml" })
public class OrderDaoTest {
	@Inject
	private OrdersDao orderdao;
	
	private static Logger logger = Logger.getLogger(OrderDaoTest.class);
	
	@Test
	public void createtest() throws Exception {
		Orders order = new Orders("dd@naver.com", 5000);
		orderdao.create(order);
	}

}
