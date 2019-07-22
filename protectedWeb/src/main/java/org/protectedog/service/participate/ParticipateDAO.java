package org.protectedog.service.participate;

import java.util.List;
import java.util.Map;

import org.protectedog.common.Search;
import org.protectedog.service.domain.Funding;
import org.protectedog.service.domain.Participate;

public interface ParticipateDAO {
	
	/////////////// FUNDING 참여/////////////////////

	// SELECT ONE
	public void addParticipate(Participate participate) throws Exception;
	
	//SELECT ONE
	public Participate getParticipate(Participate participate) throws Exception;

	// SELECT ONE
	public int getParticipateTotalCount(Search search) throws Exception;

	// SELECT LIST
	public List<Participate> listNoticeComment(Search search, int postNo , String statusCode) throws Exception;

	/////////////// 회원에서 요구한 Method/////////////////////
	// SELECT LIST
	public List<Participate> listParticipateUser(int id) throws Exception;
}
