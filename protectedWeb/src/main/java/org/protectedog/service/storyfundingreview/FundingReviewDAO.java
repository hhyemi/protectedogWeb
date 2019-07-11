package org.protectedog.service.storyfundingreview;

import org.protectedog.common.Search;
import org.protectedog.service.domain.FundingReview;


public interface FundingReviewDAO {

	public FundingReview getReview(int postNo) throws Exception; 
	
	//원래 디비가 있어서 add도 update가 됨 
	//public void addReview(StoryFundingReview storyFundingReview) throws Exception;
	
	public void updateReview(FundingReview fundingReview) throws Exception;

	public void delReview(int postNo) throws Exception;
	
	public int getTotalCount(Search search) throws Exception;
}
