package com.furnifit.offercoupone.service;

import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.furnifit.offercoupone.dao.OfferCouponeDao;

/**
 * @author 한수진
 *
 */
@Service
public class OfferCouponeServiceImpl implements OfferCouponeService {

	@Inject
	OfferCouponeDao offerdao;
	
	@Override
	public void create(Map<String, String> map) {
		offerdao.create(map);
	}

	@Override
	public void update() {
		offerdao.update();
	}

}
