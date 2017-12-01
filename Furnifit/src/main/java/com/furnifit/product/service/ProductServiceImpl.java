package com.furnifit.product.service;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.furnifit.common.web.ProductParams;
import com.furnifit.product.dao.ProductDao;
import com.furnifit.product.domain.Product;
import com.furnifit.productimg.dao.ProductImageDao;
import com.furnifit.productimg.domain.ProductImg;

/**
 * @author 한수진
 *
 */
@Service
public class ProductServiceImpl implements ProductService {

	@Inject
	private ProductDao productdao;

	@Inject
	private ProductImageDao imgDao;
	
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
			map.put("product_id", product.getProductId()+"");
			map.put("order_no", count+"");
			productdao.addAttach(map);
			count++;
		}
	}
	

	@Override
	public Product read(int productid) {
		Product product=productdao.read(productid);
		if(product!=null) {
			product.setImgs(imgDao.productImg(productid));
			for (ProductImg img : product.getImgs()) {
				logger.debug(img);
			}
		}
		return product;
	}

	@Override
	public void addAttach(Map<String, String> map) {
		productdao.addAttach(map);
		
	}

	@Override
	public List<Product> list() {
		List<Product> products=productdao.list();
		for (Product product : products) {
			product.setImgs(imgDao.productImg(product.getProductId()));
		}
		return products;
	}

	@Override
	public List<Product> searchlist(ProductParams params) {
		List<Product> products=productdao.searchlist(params);
		for (Product product : products) {
			product.setImgs(imgDao.productImg(product.getProductId()));
		}
		return products;
	}


	@Override
	public List<Product> productReadList(String category) {
		List<Product> products=productdao.productReadList(category);
		for (Product product : products) {
			product.setImgs(imgDao.productImg(product.getProductId()));
		}
		return products;
	}
	
	@Override
	public List<Product> productwish(String email,  int page, int pageSize){
		Map<String, String> map = new HashMap<>();
		map.put("pageSize", pageSize+"");
		map.put("page", page+"");
		map.put("email", email);
		List<Product> list = productdao.productwish(map);
		
		for (Product product : list) {
			product.setImgs(imgDao.productImg(product.getProductId()));
		}
		return list;
	}


	@Override
	public int totlasize() {
		return productdao.totlasize();
	}


	@Override
	public List<Product> total() {
		return productdao.total();
	}

	
}
