package com.furnifit.wishlist.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.furnifit.member.domain.Member;
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
	
	@RequestMapping(value="/{productid}", method= RequestMethod.POST)
	public ResponseEntity<String> create(@PathVariable("productid") int productid, HttpSession session) {
		ResponseEntity<String> entity = null;
		Map<String, String> map = new HashMap<>();
		Member member = (Member) session.getAttribute("login");
		map.put("email", member.getEmail());
		map.put("productId", productid+"");
		try{
			wishlistservice.create(map);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}catch (Exception e) {
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value="/{productid}", method= RequestMethod.DELETE)
	public ResponseEntity<String> delete(@PathVariable("productid") int productid, HttpSession session) {
		ResponseEntity<String> entity = null;
		Map<String, String> map = new HashMap<>();
		Member member = (Member) session.getAttribute("login");
		map.put("email", member.getEmail());
		map.put("productId", productid+"");
		try{
			wishlistservice.delete(map);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}catch (Exception e) {
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

}
