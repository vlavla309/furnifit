package com.furnifit.orders.service;

import java.util.List;

import com.furnifit.common.web.Params;
import com.furnifit.orders.domain.Orders;

/**
 * OrdersService 클래스
 * @author 손정화
 *
 */
public interface OrdersService {

	// 주문 생성
	public void create(Orders order) throws Exception;

	// 회원별 주문 리스트
	public List<Orders> listAll(String email) throws Exception;
	
//	public void delete(int orderId) throws Exception;
//	public void update(Orders order) throws Exception;
	
	/** 게시글 리스트(+페이징) */
//	public List<Orders> listPage(int page)throws Exception;
//	public List<Orders> listParams(Params params)throws Exception;
	
	
	/**
	 * 주문목록 리스트(+페이징)
	 * @param params
	 * @return
	 */
	public List<Orders> listByParams(Params params) throws Exception;
	
	/**
	 * 출력페이지 계산을 위한 {검색유형, 검색값}에 대한 행의 수 반환 
	 * @param 
	 * @return int
	 */
	public int pageCount();
	
	public List<Orders> price(int orderId) throws Exception;
}
