package org.protectedog.service.adopt.impl;


import java.util.Map;

import org.protectedog.common.Search;
import org.protectedog.service.adopt.AdoptDAO;
import org.protectedog.service.adopt.AdoptService;
import org.protectedog.service.domain.Adopt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;




//==> 분양관리 서비스 구현
@Service("adoptServiceImpl")
public class AdoptServiceImpl implements AdoptService{
	
	///Field
	@Autowired
	@Qualifier("adoptDAOImpl")
	private AdoptDAO adoptDAO;
	public void setAdoptADO(AdoptDAO adoptDAO) {
		this.adoptDAO = adoptDAO;
	}
	
	///Constructor
	public AdoptServiceImpl() {
		System.out.println(this.getClass());
	}

	///Method
	public void addAdopt(Adopt adopt) throws Exception {
		adoptDAO.addAdopt(adopt);
	}

	public Adopt getAdopt(int postNo) throws Exception {
		return adoptDAO.getAdopt(postNo);
	}

	public Map<String , Object> listAdopt(Search search, String boardCode) throws Exception {
		Map<String, Object> map= adoptDAO.listAdopt(search, boardCode);
		int totalCount = adoptDAO.getTotalCount(boardCode);
		
		map.put("map", map );
		map.put("totalCount", new Integer(totalCount));
		
		return map;
	}

	public void updateAdopt(Adopt adopt) throws Exception {
		adoptDAO.updateAdopt(adopt);
	}
	
	public void updateStatusCode(Adopt adopt) throws Exception {
		adoptDAO.updateStatusCode(adopt);
	}

}