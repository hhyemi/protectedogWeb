package org.protectedog.service.review;

import java.util.Map;

import org.protectedog.common.Search;
import org.protectedog.service.domain.Review;

public interface ReviewService {
	
		//리뷰글 등록
		public void addReview(Review review)throws Exception;
		//리뷰글 조회
		public Review getReview(int postNo)throws Exception;
		//리뷰글 리스트 조회
//		public Map<String, Object>listReview(Search search)throws Exception;
		//리뷰글 업데이트
		public void updateReivew(Review Review)throws Exception;
		//리뷰글 삭제
		public void delReivew(Review review)throws Exception;
	
		
	}