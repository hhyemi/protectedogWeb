package org.protectedog.service.storyfunding;

import java.util.List;
import java.util.Map;

import org.protectedog.common.Search;
import org.protectedog.service.domain.Participate;
import org.protectedog.service.domain.Funding;

public interface FundingService {

	/////////////// FUNDING 후원신청게시판 /////////////////////
	// 펀딩 글 작성
	public void addVoting(Funding funding) throws Exception;

	// 펀딩 글 확인
	public Funding getVoting(int postNo) throws Exception;

	// 펀딩 글 수정
	public void updateVoting(Funding funding) throws Exception;

	// 펀딩 글 삭제
	public void delVoting(int postNo) throws Exception;

	// 펀딩 글 리스트
	public Map<String, Object> listVoting(Search search) throws Exception;

	// 펀딩 글 AutoComplete
	public List<String> getAutoVoting(Map<String, Object> searchMap) throws Exception;
	
	/////////////// FUNDING 후원신청게시판 /////////////////////
	
	// 펀딩 글 리스트
	public Map<String, Object> listFunding(Search search) throws Exception;
	
	/////////////// FUNDING 참여/////////////////////

	// 투표와 후원참여
	public void addParticipate(Participate participate) throws Exception;

	// 펀딩 상태코드 수정
	public void updateStatusCode(Funding funding) throws Exception;

	// 참여알림댓글
	public Map<String, Object> listNoticeComment(Search search, int postNo) throws Exception;

	/////////////// 회원에서 요구한 Method/////////////////////
	// 참여이력 리스트
	public List<Participate> listParticipate(int id) throws Exception;
}
