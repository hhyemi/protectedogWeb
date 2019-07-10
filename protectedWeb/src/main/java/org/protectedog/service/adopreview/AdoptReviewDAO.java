package org.protectedog.service.adopreview;

import java.util.List;
import java.util.Map;

import org.protectedog.service.domain.AdoptReview;


//==> 회원관리에서 CRUD 추상화/캡슐화한 DAO Interface Definition
public interface AdoptReviewDAO {
	
	// INSERT
	public void addAdoptReview(AdoptReview adoptReview) throws Exception ;

	// SELECT ONE
	public AdoptReview getAdoptReview(int postNo) throws Exception ;

	// SELECT LIST
//	public Map<String, Object> listAdoptReview(Search search, String boardCode) throws Exception ;

	// UPDATE
	public void updateAdoptReview(AdoptReview adoptReview) throws Exception ;
	
	// DELETE
	public void delAdoptReview(AdoptReview adoptReview) throws Exception ;
	
	// 게시판 Page 처리를 위한 전체Row(totalCount)  return
	public int getTotalCount(String boardCode) throws Exception ;
	
}