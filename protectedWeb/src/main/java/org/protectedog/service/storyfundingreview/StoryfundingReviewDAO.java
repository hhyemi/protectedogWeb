package org.protectedog.service.storyfundingreview;

import org.protectedog.common.Search;
import org.protectedog.service.domain.StoryFundingReview;


public interface StoryfundingReviewDAO {

	public StoryFundingReview getReview(int postNo) throws Exception; 
	
	public void addReview(StoryFundingReview storyFundingReview) throws Exception;
	
	public void updateReview(StoryFundingReview storyFundingReview) throws Exception;

	public void delReview(int postNo) throws Exception;
	
	public int getTotalCount(Search search) throws Exception;
}
