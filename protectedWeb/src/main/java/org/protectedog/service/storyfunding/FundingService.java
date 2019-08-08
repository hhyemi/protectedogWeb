package org.protectedog.service.storyfunding;

import java.util.List;
import java.util.Map;

import org.protectedog.common.Search;
import org.protectedog.service.domain.Funding;

public interface FundingService {

	/////////////// FUNDING �Ŀ���û�Խ��� /////////////////////
	
	// �ݵ� �Ѵ� �� �� �ִ��� Ȯ��
	public Funding getPost(String id) throws Exception;
	
	// �ݵ� �� �ۼ�
	public void addVoting(Funding funding) throws Exception;

	// �ݵ� �� Ȯ��
	public Funding getVoting(int postNo) throws Exception;

	// �ݵ� �� ����
	public void updateVoting(Funding funding) throws Exception;

	// �ݵ� �� ����
	public void delVoting(int postNo) throws Exception;

	// �ݵ� �� ����Ʈ
	public Map<String, Object> listVoting(Search search) throws Exception;

	// �ݵ� �� AutoComplete
	public List<String> getAutoVoting(Map<String, Object> searchMap) throws Exception;
	
	/////////////// FUNDING �Ŀ���û�Խ��� /////////////////////
	
	// �ݵ� �� ����Ʈ
	public Map<String, Object> listFunding(Search search) throws Exception;
	
	/////////////// FUNDING ����/////////////////////

	// �ݵ� �����ڵ� ����
	public void updateStatusCode(Funding funding) throws Exception;

	/////////////// �ı� �Խ��� /////////////////////
	
	public void addReview(Funding funding) throws Exception;

	public void updateReview(Funding funding) throws Exception;

	public void delReview(int postNo) throws Exception;

}
