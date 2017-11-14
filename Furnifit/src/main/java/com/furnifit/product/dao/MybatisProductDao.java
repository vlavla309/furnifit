package com.furnifit.product.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.furnifit.product.domain.Product;

/**
 * @author 한수진
 *
 */
@Repository
public class MybatisProductDao implements ProductDao {

	private static final String namespace = "com.furnifit.product.dao.ProductDao";
	
	@Inject
	private SqlSession sqlsession;
	
	@Override
	public void create(Product product) {
		sqlsession.insert(namespace+".create", product);
	}

	@Override
	public Product read(int productid) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void addAttach(Map<String, String> map) {
		sqlsession.insert(namespace+".addAttach", map);
	}

	@Override
	public List<Product> list() {
		return sqlsession.selectList(namespace+".list");
	}

}
