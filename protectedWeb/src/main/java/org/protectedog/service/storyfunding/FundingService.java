package org.protectedog.service.storyfunding;

import java.util.List;
import java.util.Map;

import org.protectedog.common.Search;
import org.protectedog.service.domain.Participate;
import org.protectedog.service.domain.Funding;

public interface FundingService {

	/////////////// FUNDING 게시판 /////////////////////
	// 펀딩 글 작성
	public void addFunding(Funding funding) throws Exception;

	// 펀딩 글 확인
	public Funding getFunding(int postNo) throws Exception;

	// 펀딩 글 수정
	public void updateFunding(Funding funding) throws Exception;

	// 펀딩 글 삭제
	public void delFunding(int postNo) throws Exception;

	// 펀딩 글 리스트
	public Map<String, Object> listFunding(Search search) throws Exception;

	// 펀딩 글 AutoComplete
	public List<String> getAutoFunding(Map<String, Object> searchMap) throws Exception;

	// 펀딩 상태코드 수정
	public void updateStatusCode(Funding funding) throws Exception;

	/////////////// FUNDING 참여/////////////////////
	// 투표와 후원참여
	public void addParticipate(Participate participate) throws Exception;

	// 참여알림댓글
	public Map<String, Object> listNoticeComment(Search search, int postNo) throws Exception;
	
	/////////////// 회원에서 요구한 Method/////////////////////
	// 참여이력 리스트
	public List<Participate> listParticipate(int id) throws Exception;
}
