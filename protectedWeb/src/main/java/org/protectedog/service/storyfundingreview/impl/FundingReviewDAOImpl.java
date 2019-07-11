package org.protectedog.service.storyfundingreview.impl;

import org.protectedog.common.Search;
import org.protectedog.service.domain.FundingReview;
import org.protectedog.service.storyfundingreview.FundingReviewDAO;


public class FundingReviewDAOImpl implements FundingReviewDAO  {

	public FundingReviewDAOImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public FundingReview getReview(int postNo) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateReview(FundingReview fundingReview) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delReview(int postNo) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int getTotalCount(Search search) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}


}
