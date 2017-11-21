package com.furnifit.product.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.log4j.Logger;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.furnifit.brand.dao.BrandDao;
import com.furnifit.brand.doamin.Brand;
import com.furnifit.category.dao.CategoryDao;
import com.furnifit.category.doamin.Category;
import com.furnifit.color.dao.ColorDao;
import com.furnifit.color.domain.Color;
import com.furnifit.common.web.ProductParams;
import com.furnifit.product.domain.Product;
import com.furnifit.product.service.ProductService;
import com.furnifit.productimg.dao.ProductImageDao;
import com.furnifit.wishlist.domain.Wishlist;
import com.furnifit.wishlist.service.WishlistService;


/**
 * @author 한수진
 *
 */
@Controller
@RequestMapping("/product")
public class ProductController {
	
	Logger logger = Logger.getLogger(ProductController.class);
	
	@Resource(name = "productImgPath")
	private String uploadPath;
	
	@Inject
	ProductService productsrv;
	
	@Inject
	private ProductImageDao imgdao;
	
	@Inject
	private WishlistService wishsrv;
	
	@Inject
	private ColorDao colordao;
	
	@Inject
	private BrandDao branddao;
	
	@Inject
	private CategoryDao categorys;
	
	@RequestMapping(value="", method= RequestMethod.GET)
	public String list(Model model) {
		List<Product> list = productsrv.list();
		List<Wishlist> wishlist = wishsrv.read();
		List<Color> colorlist = colordao.list();
		List<Brand> brandlist = branddao.list();
		List<Category> categorylist = categorys.list();
		
		model.addAttribute("list",list);
		model.addAttribute("wishlist",wishlist);
		model.addAttribute("colorlist", colorlist);
		model.addAttribute("brandlist", brandlist);
		model.addAttribute("categorylist", categorylist);
		return "product/list";
	}
	
	@RequestMapping(value="", method= RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> list(Model model, ProductParams params) {
		
		ResponseEntity<String> entity = null;
		Map<String, Object> map = new HashMap<String, Object>();
		
		logger.info("파람스 " +params);
		try{
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}catch (Exception e) {
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		map.put("result", "SUCCESS");
		map.put("list", params);
		
		return map;
	}
	
	
	@RequestMapping(value="/{productid}", method= RequestMethod.GET)
	public String read(Model model, @PathVariable("productid") int productid) {
		model.addAttribute("product", productsrv.read(productid));
		return "product/read";
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void form() {}
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String regist(Product product) {
		productsrv.create(product);
		logger.info("[ ProductController --> regist ] : "+ product);
		return "redirect:/product/register";
	}
	
}
