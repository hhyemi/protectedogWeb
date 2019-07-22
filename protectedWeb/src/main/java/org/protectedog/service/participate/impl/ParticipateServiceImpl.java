package org.protectedog.service.participate.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.protectedog.common.Search;
import org.protectedog.service.domain.Funding;
import org.protectedog.service.domain.Participate;
import org.protectedog.service.participate.ParticipateDAO;
import org.protectedog.service.participate.ParticipateService;
import org.protectedog.service.storyfunding.FundingDAO;
import org.protectedog.service.storyfunding.FundingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service("participateServiceImpl")
public class ParticipateServiceImpl implements ParticipateService {

	@Autowired
	@Qualifier("participateDAOImpl")
	private ParticipateDAO participateDAO;

	public void setParticipateDAO(ParticipateDAO participateDAO) {
		this.participateDAO = participateDAO;
	}

	public ParticipateServiceImpl() {
		System.out.println(this.getClass());
	}

	/////////////// FUNDING 참여/////////////////////

	@Override
	public void addParticipate(Participate participate) throws Exception {
		participateDAO.addParticipate(participate);

	}

	@Override
	public Participate getParticipate(Participate participate) throws Exception {
		return participateDAO.getParticipate(participate);

	}

	@Override
	public Map<String, Object> listNoticeComment(Search search, int postNo ,String statusCode) throws Exception {
		List<Participate> list = participateDAO.listNoticeComment(search,postNo, statusCode);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);

		return map;
	}

	/////////////// 회원에서 요구한 Method/////////////////////

	@Override
	public List<Participate> listParticipateUser(int id) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
