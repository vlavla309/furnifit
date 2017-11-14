package com.furnifit.product.service;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.furnifit.product.dao.ProductDao;
import com.furnifit.product.domain.Product;

/**
 * @author 한수진
 *
 */
@Service
public class ProductServiceImpl implements ProductService {

	@Inject
	private ProductDao productdao;

	Logger logger = Logger.getLogger(ProductServiceImpl.class);

	@Override
	public void create(Product product) {
		logger.info(product);
		productdao.create(product);
		String[] files = product.getFiles();

		if (files == null)
			return;
		
		int count =0;
		for (String fullName : files) {
			Map<String, String> map = new HashMap<>();
			File f = new File(fullName);
			String fileName = f.getName();
			String filePath = f.getParent();
			logger.info("----filename : " + fileName + " --> filePath : " + filePath+" ----");
			map.put("name", fileName.replace("s_", ""));
			map.put("path", filePath);
			logger.info(product.getProductId());
			map.put("product_id", Integer.toString(product.getProductId()));
			map.put("order_no", count+"");
			productdao.addAttach(map);
			count++;
		}
	}
	
	

	@Override
	public Product read(int productid) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void addAttach(Map<String, String> map) {
		productdao.addAttach(map);
		
	}



	@Override
	public List<Product> list() {
		return productdao.list();
	}

	
}
