package org.protectedog.service.storyfunding;

import java.util.List;

import org.protectedog.common.Search;
import org.protectedog.service.domain.Funding;
import org.protectedog.service.domain.Participate;

public interface FundingDAO {

	public void addFunding(Funding funding) throws Exception;

	public Funding getFunding(int postNo) throws Exception;

	public void updateFunding(Funding funding) throws Exception;

	public List<Funding> listFunding(Search search) throws Exception;

	public void updateStatusCode(Funding funding) throws Exception;

	public void delFunding(int postNo) throws Exception;

	public int getTotalCount(Search search) throws Exception;

	public void addParticipate(Participate participate) throws Exception;

	public int getParticipateTotalCount(Search search) throws Exception;

	public List<Participate> listNoticeComment(Search search, int postNo) throws Exception;

	// 회원에서 요구한 Method
	public List<Participate> listParticipate(int id) throws Exception;
}
