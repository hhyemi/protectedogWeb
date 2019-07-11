package org.protectedog.service.storyfundingreview;

import java.util.Map;

import org.protectedog.common.Search;
import org.protectedog.service.domain.Funding;
import org.protectedog.service.domain.FundingReview;

public interface FundingReviewService {

	public FundingReview getReview(int postNo) throws Exception; 
	
	//public void addReview(StoryFundingReview storyFundingReview) throws Exception;
	
	public void updateReview(FundingReview fundingReview) throws Exception;

	public void delReview(int postNo) throws Exception;
}
