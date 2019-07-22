package org.protectedog.service.participate;

import java.util.List;
import java.util.Map;

import org.protectedog.common.Search;
import org.protectedog.service.domain.Funding;
import org.protectedog.service.domain.Participate;

public interface ParticipateService {

	/////////////// FUNDING 참여/////////////////////

	// 투표와 후원참여
	public void addParticipate(Participate participate) throws Exception;

	// 투표 1글 1번 확인
	public Participate getParticipate(Participate participate) throws Exception;

	// 참여알림댓글
	public Map<String, Object> listNoticeComment(Search search, int postNo , String statusCode) throws Exception;

	/////////////// 회원에서 요구한 Method/////////////////////
	// 참여이력 리스트
	public List<Participate> listParticipateUser(int id) throws Exception;
}
