package org.protectedog.service.storyfunding;

import java.util.List;
import java.util.Map;

import org.protectedog.common.Search;
import org.protectedog.service.domain.Funding;
import org.protectedog.service.domain.Participate;

public interface FundingDAO {

	/////////////// FUNDING 후원신청 게시판 /////////////////////

	// INSERT
	public void addVoting(Funding funding) throws Exception;

	// SELECT ONE
	public Funding getVoting(int postNo) throws Exception;

	// UPDATE
	public void updateVoting(Funding funding) throws Exception;

	// DELETE
	public void delVoting(int postNo) throws Exception;

	// SELECT LIST
	public List<Funding> listVoting(Search search) throws Exception;

	// SELECT LIST
	public List<String> getAutoVoting(Map<String, Object> searchMap) throws Exception;

	// SELECT ONE
	public int getVotingTotalCount(Search search) throws Exception;

	/////////////// FUNDING 후원게시 게시판 /////////////////////
	
	// SELECT LIST
	public List<Funding> listFunding(Search search) throws Exception;

	// SELECT ONE
	public int getFundingTotalCount(Search search) throws Exception;
	
	/////////////// FUNDING 참여/////////////////////

	// SELECT ONE
	public void addParticipate(Participate participate) throws Exception;

	// UPDATE
	public void updateStatusCode(Funding funding) throws Exception;

	// SELECT ONE
	public int getParticipateTotalCount(Search search) throws Exception;

	// SELECT LIST
	public List<Participate> listNoticeComment(Search search, int postNo) throws Exception;

	/////////////// 회원에서 요구한 Method/////////////////////
	// SELECT LIST
	public List<Participate> listParticipate(int id) throws Exception;
}
