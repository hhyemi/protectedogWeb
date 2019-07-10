package org.protectedog.service.adoptreview;

import java.util.List;

import org.protectedog.common.Search;
import org.protectedog.service.domain.AdoptReview;


//==> 회원관리에서 CRUD 추상화/캡슐화한 DAO Interface Definition
public interface AdoptReviewDAO {
	
	// INSERT
	public void addAdoptReview(AdoptReview adoptReview) throws Exception ;

	// SELECT ONE
	public AdoptReview getAdoptReview(int postNo) throws Exception ;

	// SELECT LIST
	public List<AdoptReview> listAdoptReview(Search search) throws Exception ;

	// UPDATE
	public void updateAdoptReview(AdoptReview adoptReview) throws Exception ;
	
	// UPDATE : DELETE
	public void delAdoptReview(AdoptReview adoptReview) throws Exception ;
	
	// 게시판 Page 처리를 위한 전체Row(totalCount)  return
	public int getTotalCount(Search search) throws Exception ;
	
}