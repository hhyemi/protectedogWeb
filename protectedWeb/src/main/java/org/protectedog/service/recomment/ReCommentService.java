package org.protectedog.service.recomment;

import java.util.Map;

import org.protectedog.service.domain.Comment;
import org.protectedog.service.domain.ReComment;

public interface ReCommentService {
	
	public void addReComment(ReComment reComment) throws Exception;
	
	public ReComment getReComment(int reCommentNo) throws Exception;
	
	public void updateReComment(ReComment reComment) throws Exception;
	
	public Map<String, Object> listReComment(Map<String, Object> map) throws Exception;
	
	public void delReComment(int reCommentNo) throws Exception;
	
}
