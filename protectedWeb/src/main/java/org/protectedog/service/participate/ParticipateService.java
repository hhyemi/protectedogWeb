package org.protectedog.service.participate;

import java.util.List;
import java.util.Map;

import org.protectedog.common.Search;
import org.protectedog.service.domain.Participate;

public interface ParticipateService {

	/////////////// FUNDING ����/////////////////////

	// ��ǥ�� �Ŀ�����
	public void addParticipate(Participate participate) throws Exception;

	// ��ǥ 1�� 1�� Ȯ��
	public Participate getParticipate(int participateNo) throws Exception;

	public Participate getPostParticipate(Participate participate) throws Exception;
	
	// �����˸����
	public Map<String, Object> listNoticeComment(Search search, int postNo , String statusCode) throws Exception;

	/////////////// ȸ������ �䱸�� Method/////////////////////
	// �����̷� ����Ʈ
	public List<Participate> listParticipateUser(int id) throws Exception;
}
