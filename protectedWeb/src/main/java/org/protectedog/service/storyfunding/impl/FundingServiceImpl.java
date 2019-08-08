package org.protectedog.service.storyfunding.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.protectedog.common.Search;
import org.protectedog.service.domain.Funding;
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

	/////////////// FUNDING �Ŀ���û�Խ��� /////////////////////

	@Override
	public Funding getPost(String id) throws Exception {
		return fundingDAO.getPost(id);
	}

	@Override
	public void addVoting(Funding funding) throws Exception {
		fundingDAO.addVoting(funding);

	}

	@Override
	public Funding getVoting(int postNo) throws Exception {
		return fundingDAO.getVoting(postNo);
	}

	@Override
	public void updateVoting(Funding funding) throws Exception {
		fundingDAO.updateVoting(funding);

	}

	@Override
	public void delVoting(int postNo) throws Exception {
		fundingDAO.delVoting(postNo);

	}

	@Override
	public Map<String, Object> listVoting(Search search) throws Exception {
		List<Funding> list = fundingDAO.listVoting(search);
		int totalCount = fundingDAO.getVotingTotalCount(search);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", new Integer(totalCount));

		return map;
	}

	@Override
	public List<String> getAutoVoting(Map<String, Object> searchMap) throws Exception {
		return fundingDAO.getAutoVoting(searchMap);
	}

	/////////////// FUNDING �Ŀ���û�Խ��� /////////////////////

	@Override
	public Map<String, Object> listFunding(Search search) throws Exception {
		List<Funding> list = fundingDAO.listFunding(search);
		int totalCount = fundingDAO.getFundingTotalCount(search);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", new Integer(totalCount));

		return map;
	}

	/////////////// FUNDING ����/////////////////////

	@Override
	public void updateStatusCode(Funding funding) throws Exception {
		fundingDAO.updateStatusCode(funding);

	}

	/////////////// �ı� �Խ��� /////////////////////

	@Override
	public void addReview(Funding funding) throws Exception {
		fundingDAO.addReview(funding);

	}

	@Override
	public void updateReview(Funding funding) throws Exception {
		fundingDAO.updateReview(funding);

	}

	@Override
	public void delReview(int postNo) throws Exception {
		fundingDAO.delReview(postNo);

	}

}
