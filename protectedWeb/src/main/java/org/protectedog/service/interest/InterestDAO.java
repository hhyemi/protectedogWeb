package org.protectedog.service.interest;

import java.util.List;
import java.util.Map;

import org.protectedog.common.Search;
import org.protectedog.service.domain.Interest;
import org.protectedog.service.domain.User;
import org.w3c.dom.ls.LSInput;

public interface InterestDAO {
	
	// Insert
	public void addInterest(Interest interest) throws Exception;
	
	// Select One
	public Interest getInterest(int interestNo) throws Exception;
	
	// Select List
	public List<Interest> getInterestList(Search search) throws Exception;
	
	// Delete
	public void deleteInterest(Interest interest) throws Exception;
	
	// List Paging
	public int getTotalCount(Search search) throws Exception;
	
	// 중복체크
	public int getInterestCheck(Map<String, Object> map) throws Exception;
	
}
