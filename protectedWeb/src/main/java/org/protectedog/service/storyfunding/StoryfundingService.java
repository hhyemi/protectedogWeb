package org.protectedog.service.storyfunding;

import java.util.Map;

import org.protectedog.common.Search;
import org.protectedog.service.domain.StoryFunding;

public interface StoryfundingService {

	public StoryFunding getFunding(int postNo) throws Exception;

	public void addFunding(StoryFunding storyFunding) throws Exception;

	public Map<String, Object> listFunding(Search search) throws Exception;

	public void updateFunding(StoryFunding storyFunding) throws Exception;

	public void updateStatusCode(StoryFunding storyFunding) throws Exception;

	public void delFunding(int postNo) throws Exception;

	public void addParticipate(int postNo) throws Exception;

	public void getParticipate(int id, int postNo) throws Exception;

	public Map<String, Object> listNoticeComment(Search search, int postNo) throws Exception;

}
