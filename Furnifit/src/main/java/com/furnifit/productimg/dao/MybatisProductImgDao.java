package com.furnifit.productimg.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.furnifit.productimg.domain.ProductImg;

/**
 * @author 한수진
 *
 */
@Repository
public class MybatisProductImgDao implements ProductImageDao {

	private static final String namespace = "com.furnifit.productimg.dao.ProductImgDao";
	
	@Inject
	private SqlSession sqlsession;
	
	@Override
	public List<ProductImg> list() {
		return sqlsession.selectList(namespace+".list");
	}

	@Override
	public List<ProductImg> productImg(int productId) {
		// TODO Auto-generated method stub
		return null;
	}

}
