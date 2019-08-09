package org.protectedog.service.review;

import java.util.Map;

import org.protectedog.common.Search;
import org.protectedog.service.domain.Review;

public interface ReviewService {

	// ����� ���
	public void addReview(Review review) throws Exception;

	// ����� ��ȸ
	public Review getReview(int postNo) throws Exception;

	// ����� ����Ʈ ��ȸ
	public Map<String, Object> listReview(Search search, String boardCode, String hospitalName) throws Exception;

	 //����� ������Ʈ
	 public void updateReivew(Review Review) throws Exception;
	 //����� ����
	 public void delReivew(int postNo) throws Exception;
	
}