package org.protectedog.service.interest.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.protectedog.common.Search;
import org.protectedog.service.domain.Interest;
import org.protectedog.service.interest.InterestDAO;
import org.protectedog.service.interest.InterestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service("interestServiceImpl")
public class InterestServiceImpl implements InterestService{

	///Field
	@Autowired
	@Qualifier("interestDAOImpl")
	private InterestDAO interestDAO;
	public void setInterestDAO(InterestDAO interestDAO) {
		this.interestDAO = interestDAO;
	}
	
	///Constructor
	public InterestServiceImpl() {
		// TODO Auto-generated constructor stub
		System.out.println(this.getClass());
	}
	
	///Method
	@Override
	public void addInterest(Interest interest) throws Exception {
		// TODO Auto-generated method stub
		interestDAO.addInterest(interest);
	}

	@Override
	public Interest getInterest(int interestNo) throws Exception {
		// TODO Auto-generated method stub
		return interestDAO.getInterest(interestNo);
	}

	@Override
	public Map<String, Object> getInterestList(Search search) throws Exception {
		// TODO Auto-generated method stub
		List<Interest> list=interestDAO.getInterestList(search);
		int totalCount=interestDAO.getTotalCount(search);
		
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", totalCount);
		return map;
	}

	@Override
	public void delInterest(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		interestDAO.delInterest(map);
	}

	@Override
	public int getInterestCheck(Map<String, Object> map) throws Exception {
		return interestDAO.getInterestCheck(map);
	}

}
