package org.protectedog.service.interest;

import java.util.Map;

import org.protectedog.common.Search;
import org.protectedog.service.domain.Interest;
import org.protectedog.service.domain.User;

public interface InterestService {

	// 관심정보 등록
	public void addInterest(Interest interest) throws Exception;
	
	// 관심정보 상세보기
	public Interest getInterest(int interestNo) throws Exception;
	
	// 관심정보 목록보기
	public Map<String, Object> getInterestList(Search search) throws Exception;
	
	// 관심등록 삭제
	public void deleteInterest(Interest interest) throws Exception;
	
}
