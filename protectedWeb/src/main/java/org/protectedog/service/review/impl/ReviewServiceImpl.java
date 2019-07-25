//package org.protectedog.service.review.impl;
//
//import java.util.HashMap;
//import java.util.List;
//import java.util.Map;
//
//import org.protectedog.common.Search;
//import org.protectedog.service.domain.Order;
//import org.protectedog.service.domain.Review;
//import org.protectedog.service.order.OrderDAO;
//import org.protectedog.service.review.ReviewDAO;
//import org.protectedog.service.review.ReviewService;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.beans.factory.annotation.Qualifier;
//import org.springframework.stereotype.Service;
//@Service("reviewServiceImpl")
//public class ReviewServiceImpl implements ReviewService {
//	
//	
//	@Autowired
//	@Qualifier("reviewDAOImpl")
//	private ReviewDAO reviewDAO;
//	
//	public void setReviewDao(ReviewDAO reviewDAO) {
//		this.reviewDAO = reviewDAO;
//	}
//	
//	public ReviewServiceImpl() {
//		// TODO Auto-generated constructor stub
//		System.out.println(this.getClass());
//	}
//	
//	@Override
//	public void addReview(Review review) throws Exception {
//		// TODO Auto-generated method stub
//		reviewDAO.addReview(review);
//
//	}
//	
//	
//
//	@Override
//	public Review getReview(int postNo) throws Exception {
//		// TODO Auto-generated method stub
//		return reviewDAO.getReview(postNo);
//	}
//
//	@Override
//	public Map<String, Object> listReview(Search search, String boardCode) throws Exception {
//		
//		List<Review> list = reviewDAO.listReview(search,boardCode);
//		int totalCount = reviewDAO.getTotalCount(boardCode);
//		
//		Map<String, Object> map = new HashMap<String, Object>();
//		System.out.println(search.getCurrentPage());
//		System.out.println(search.getPageSize());
//		System.out.println("service "+list.size());  
//		map.put("list", list);
//		map.put("totalCount", new Integer(totalCount));
//		
//		
//		return map;
//	}
//
//	@Override
//	public void updateReivew(Review Review) throws Exception {
//		// TODO Auto-generated method stub
//		reviewDAO.updateReivew(Review);
//
//	}
//
//	@Override
//	public void delReivew(Review review) throws Exception {
//		// TODO Auto-generated method stub
//		reviewDAO.delReivew(review);
//
//	}
//
//}
