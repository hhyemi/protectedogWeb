package org.protectedog.service.storyfunding;

import java.util.List;
import java.util.Map;

import org.protectedog.common.Search;
import org.protectedog.service.domain.Funding;

public interface FundingDAO {

	/////////////// FUNDING �Ŀ���û �Խ��� /////////////////////

	// SELECT ONE
	public Funding getPost(String id) throws Exception;

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

	/////////////// FUNDING �Ŀ��Խ� �Խ��� /////////////////////

	// SELECT LIST
	public List<Funding> listFunding(Search search) throws Exception;

	// SELECT ONE
	public int getFundingTotalCount(Search search) throws Exception;

	/////////////// FUNDING ����/////////////////////

	// UPDATE
	public void updateStatusCode(Funding funding) throws Exception;

	/////////////// �ı� �Խ��� /////////////////////

	public void addReview(Funding funding) throws Exception;

	public void updateReview(Funding funding) throws Exception;

	public void delReview(int postNo) throws Exception;

}
