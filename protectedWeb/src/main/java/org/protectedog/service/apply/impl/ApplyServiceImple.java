package org.protectedog.service.apply.impl;


import java.util.Map;

import org.protectedog.common.Search;
import org.protectedog.service.apply.ApplyDAO;
import org.protectedog.service.apply.ApplyService;
import org.protectedog.service.domain.Apply;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;



//==> 분양신청관리 서비스 구현
@Service("applyServiceImpl")
public class ApplyServiceImple implements ApplyService{
	
	///Field
	@Autowired
	@Qualifier("applyDAOImpl")
	private ApplyDAO applyDAO;
	public void setApplyDAO(ApplyDAO applyDAO) {
		this.applyDAO = applyDAO;
	}
	
	///Constructor
	public ApplyServiceImple() {
		System.out.println(this.getClass());
	}

	///Method
	public void addApply(Apply apply) throws Exception {
		System.out.println(apply.getSituation());
		applyDAO.addApply(apply);
	}

	public Apply getApply(int applyNo) throws Exception {
		return applyDAO.getApply(applyNo);
	}

	public Map<String , Object > listApply(Search search, int adoptNo) throws Exception {
		Map<String, Object> map= applyDAO.listApply(search, adoptNo);
		int totalCount = applyDAO.getTotalCount(adoptNo);
		
		map.put("map", map );
		map.put("totalCount", new Integer(totalCount));
		
		return map;
	}
	
	public Map<String , Object > listApply2(String id) throws Exception {
		Map<String, Object> map= applyDAO.listApply2(id);
		
		map.put("map", map );
		
		return map;
	}

	public void delApply(Apply apply) throws Exception {
		applyDAO.delApply(apply);
	}
	
}