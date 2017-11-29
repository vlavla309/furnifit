package com.furnifit.plan.service;

import java.util.Base64;
import java.util.Base64.Decoder;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.furnifit.common.web.Params;
import com.furnifit.common.web.UploadFileUtils;
import com.furnifit.plan.dao.PlanDao;
import com.furnifit.plan.domain.Plan;
import com.furnifit.planitem.dao.PlanItemDao;
import com.furnifit.planitem.domain.PlanItem;

/**
 * PlanServiceImpl 클래스
 * @author 손정화
 *
 */
@Service
public class PlanServiceImpl implements PlanService {

	@Inject
	private PlanDao planDao;

	@Inject
	private PlanItemDao planitemDao;


	@Resource(name = "svgImgPath")
	private String svgImgPath;

	/**
	 * 배치도 목록 리스트
	 * @param email
	 * @return List<Plan>
	 */
	@Override
	public List<Plan> listAll(String email) throws Exception {
		return planDao.listAll(email);
	}

	/**
	 * 배치도목록 리스트(+페이징)
	 * @param params
	 * @return List<Plan>
	 */
	@Override
	public List<Plan> listByParams(Params params) throws Exception {
		return planDao.listByParams(params);
	}

	/**
	 * 출력페이지 계산을 위한 행의 수 반환 
	 * @param 
	 * @return int
	 */
	@Override
	public int pageCount() {
		return planDao.pageCount();
	}


	/**
	 * 새 배치도 작성 등록
	 * @param plan
	 * @return
	 */
	@Override
	public void writePlan(Plan plan) {
		//create Plans & Get planId
		planDao.create(plan);
		int planId=plan.getPlanId();
		Decoder dec=Base64.getDecoder();
		List<PlanItem> list=plan.getPlanitems();
		try {
			for (PlanItem planItem : list) {
				planItem.setPlanId(planId);
				
				//이미지 업로드 및 경로 설정
				String encImage=planItem.getImage();
				byte[] decByte = dec.decode(encImage.split(",")[1].getBytes());
				String decImage=new String(decByte, "UTF-8");
				String imgPath=UploadFileUtils.uploadFile(svgImgPath, planItem.getName()+".svg", decImage.getBytes());
				
				planItem.setImage(imgPath);
				
				planitemDao.create(planItem);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
