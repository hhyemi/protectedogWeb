package org.protectedog.service.participate;

import java.util.List;

import org.protectedog.common.Search;
import org.protectedog.service.domain.Participate;

public interface ParticipateDAO {
	
	/////////////// FUNDING ����/////////////////////

	// SELECT ONE
	public void addParticipate(Participate participate) throws Exception;
	
	//SELECT ONE
	public Participate getParticipate(int participateNo) throws Exception;

	// SELECT ONE
	public int getParticipateTotalCount(int postNo) throws Exception;
	
	//SELECT ONE
	public Participate getPostParticipate(Participate participate) throws Exception;

	// SELECT LIST
	public List<Participate> listNoticeComment(Search search, int postNo , String statusCode) throws Exception;

	/////////////// ȸ������ �䱸�� Method/////////////////////
	// SELECT LIST
	public List<Participate> listParticipateUser(int id) throws Exception;
}
