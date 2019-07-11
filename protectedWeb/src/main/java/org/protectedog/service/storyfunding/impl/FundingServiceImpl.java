package org.protectedog.service.storyfunding.impl;

import java.util.List;
import java.util.Map;

import org.protectedog.common.Search;
import org.protectedog.service.domain.Funding;
import org.protectedog.service.domain.Participate;
import org.protectedog.service.storyfunding.FundingDAO;
import org.protectedog.service.storyfunding.FundingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service("fundingServiceImpl")
public class FundingServiceImpl implements FundingService {
	
	@Autowired
	@Qualifier("fundingDAOImpl")
	private FundingDAO fundingDAO;
	
	public void setFundingDAO(FundingDAO fundingDAO) {
		this.fundingDAO = fundingDAO;
	}
	

	public FundingServiceImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public void addFunding(Funding funding) throws Exception {
		fundingDAO.addFunding(funding);
		
	}
	@Override
	public Funding getFunding(int postNo) throws Exception {
		return fundingDAO.getFunding(postNo);
	}

	@Override
	public void updateFunding(Funding funding) throws Exception {
		fundingDAO.updateFunding(funding);
		
	}

	@Override
	public Map<String, Object> listFunding(Search search) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public void updateStatusCode(Funding funding) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delFunding(int postNo) throws Exception {
		// TODO Auto-generated method stub
		
	}


	@Override
	public Map<String, Object> listNoticeComment(Search search, int postNo) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Participate> listParticipate(int id) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void addParticipate(Participate participate) throws Exception {
		// TODO Auto-generated method stub
		
	}


}
