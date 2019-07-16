package org.protectedog.service.storyfunding;

import java.util.List;
import java.util.Map;

import org.protectedog.common.Search;
import org.protectedog.service.domain.Funding;
import org.protectedog.service.domain.Participate;

public interface FundingDAO {

	/////////////// FUNDING 게시판 /////////////////////

	// INSERT
	public void addFunding(Funding funding) throws Exception;

	// SELECT ONE
	public Funding getFunding(int postNo) throws Exception;

	// UPDATE
	public void updateFunding(Funding funding) throws Exception;

	// DELETE
	public void delFunding(int postNo) throws Exception;

	// SELECT LIST
	public List<Funding> listFunding(Search search) throws Exception;

	// SELECT LIST
	public List<String> getAutoFunding(Map<String, Object> searchMap) throws Exception;

	// UPDATE
	public void updateStatusCode(Funding funding) throws Exception;

	// SELECT ONE
	public int getTotalCount(Search search) throws Exception;

	/////////////// FUNDING 참여/////////////////////

	// SELECT ONE
	public void addParticipate(Participate participate) throws Exception;

	// SELECT ONE
	public int getParticipateTotalCount(Search search) throws Exception;

	// SELECT LIST
	public List<Participate> listNoticeComment(Search search, int postNo) throws Exception;

	/////////////// 회원에서 요구한 Method/////////////////////
	// SELECT LIST
	public List<Participate> listParticipate(int id) throws Exception;
}
