
package org.protectedog.service.review.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.protectedog.common.Search;
import org.protectedog.service.domain.Review;
import org.protectedog.service.review.ReviewDAO;
import org.protectedog.service.review.ReviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service("reviewServiceImpl")
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	@Qualifier("reviewDAOImpl")
	private ReviewDAO reviewDAO;

	public void setReviewDao(ReviewDAO reviewDAO) {
		this.reviewDAO = reviewDAO;
	}

	public ReviewServiceImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public void addReview(Review review) throws Exception {
		reviewDAO.addReview(review);

	}

	@Override
	public Review getReview(int postNo) throws Exception {
		return reviewDAO.getReview(postNo);
	}

	@Override
	public Map<String, Object> listReview(Search search, String boardCode,String hospitalName) throws Exception {

		List<Review> list = reviewDAO.listReview(search, boardCode,hospitalName);
		int totalCount = reviewDAO.getTotalCount(search,boardCode,hospitalName);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", new Integer(totalCount));

		return map;
	}

//	@Override
//	public void updateReivew(Review Review) throws Exception {
//		// TODO Auto-generated method stub
//		reviewDAO.updateReivew(Review);
//
//	}

	@Override
	public void delReivew(int postNo) throws Exception {
		// TODO Auto-generated method stub
		reviewDAO.delReivew(postNo);

	}


}
