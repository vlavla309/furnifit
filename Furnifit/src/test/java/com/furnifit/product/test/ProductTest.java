package com.furnifit.product.test;
import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.furnifit.product.domain.Product;
import com.furnifit.product.service.ProductService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/*.xml" })
public class ProductTest {

	Logger logger = Logger.getLogger(ProductTest.class);

	@Inject
	private ProductService productsrv;

	//@Test
	public void productTest() {
		String s[] = { "C:/upload/file/2017/11/13/40a666cf-1ba6-43bc-964a-0159eec17e54_Desert44.jpg",
				"C:/upload/file/2017/11/13/a7215641-2cc5-48d0-be10-f46cf01e7664_chrome44.png" };
		Product product = new Product("침대", "hihi", "이케아", 1000, "black", 100, 100, 100, "ssss", s);
		productsrv.create(product);
	}
	
	@Test
	public void productList() {
		List <Product> list = productsrv.list();
		for (Product product : list) {
			logger.info(product);
		}
	}
	
}
