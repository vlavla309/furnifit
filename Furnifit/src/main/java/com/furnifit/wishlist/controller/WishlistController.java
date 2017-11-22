package com.furnifit.wishlist.controller;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.furnifit.brand.dao.BrandDao;
import com.furnifit.brand.doamin.Brand;
import com.furnifit.member.domain.Member;
import com.furnifit.product.domain.Product;
import com.furnifit.product.service.ProductService;
import com.furnifit.wishlist.domain.Wishlist;
import com.furnifit.wishlist.service.WishlistService;

/**
 * @author 한수진
 *
 */
@Controller
@RequestMapping("/wishlist")
public class WishlistController {

	Logger logger = Logger.getLogger(WishlistController.class);

	@Inject
	WishlistService wishlistservice;
	@Inject
	ProductService productsrv;
	@Inject
	BrandDao branddao;

	@RequestMapping(value = "/{productid}", method = RequestMethod.POST)
	public ResponseEntity<String> create(@PathVariable("productid") int productid, HttpSession session) {
		ResponseEntity<String> entity = null;
		Map<String, String> map = new HashMap<>();
		Member member = (Member) session.getAttribute("login");
		map.put("email", member.getEmail());
		map.put("productId", productid + "");
		try {
			wishlistservice.create(map);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	@RequestMapping(value = "/{productid}", method = RequestMethod.DELETE)
	public ResponseEntity<String> delete(@PathVariable("productid") int productid, HttpSession session) {
		ResponseEntity<String> entity = null;
		Map<String, String> map = new HashMap<>();
		Member member = (Member) session.getAttribute("login");
		map.put("email", member.getEmail());
		map.put("productId", productid + "");
		try {
			wishlistservice.delete(map);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	@RequestMapping(value="", method=RequestMethod.GET)
	public String mypagewishlist(Model model, HttpSession session) {
		
		Member member = (Member) session.getAttribute("login");
		List<Wishlist> wishlist = wishlistservice.userwishlist(member.getEmail());
		List<Product> product = productsrv.list();
		List<Brand> brandlist = branddao.list();
		
		
		model.addAttribute("wishlist",wishlist);
		model.addAttribute("list", product);
		model.addAttribute("brandlist", brandlist);
		
		return "mypage/wishlist";
		
	}

}
