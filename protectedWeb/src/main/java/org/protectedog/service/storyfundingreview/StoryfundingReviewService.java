package org.protectedog.service.storyfundingreview;

import java.util.Map;

import org.protectedog.common.Search;
import org.protectedog.service.domain.StoryFunding;
import org.protectedog.service.domain.StoryFundingReview;

public interface StoryfundingReviewService {

	public StoryFundingReview getReview(int postNo) throws Exception; 
	
	public void addReview(StoryFundingReview storyFundingReview) throws Exception;
	
	public void updateReview(StoryFundingReview storyFundingReview) throws Exception;

	public void delReview(int postNo) throws Exception;
}
