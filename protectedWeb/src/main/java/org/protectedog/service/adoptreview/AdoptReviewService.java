package org.protectedog.service.adoptreview;

import java.util.Map;

import org.protectedog.common.Search;
import org.protectedog.service.domain.AdoptReview;



//==> 분양관리에서 서비스할 내용 추상화/캡슐화한 Service  Interface Definition  
public interface AdoptReviewService {
	
	// 글 등록
	public void addAdoptReview(AdoptReview adoptReview) throws Exception;
	
	// 글 상세조회
	public AdoptReview getAdoptReview(int postNo) throws Exception;
	
	// 글 리스트 조회
	public Map<String , Object> listAdoptReview(Search search) throws Exception;
	
	// 글 수정
	public void updateAdoptReview(AdoptReview adoptReview) throws Exception;
	
	// 글 삭제
	public void delAdoptReview(AdoptReview adoptReview) throws Exception;
	

}