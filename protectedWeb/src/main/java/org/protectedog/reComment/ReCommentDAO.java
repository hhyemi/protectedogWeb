package org.protectedog.reComment;

import java.util.Map;

import org.protectedog.service.domain.Comment;

public interface ReCommentDAO {

	public void addReComment(Comment comment) throws Exception;
	
	public Comment getReComment(int commentNo) throws Exception;
	
	public void updateReComment(Comment comment) throws Exception;
	
	public Map<String, Object> listReComment(int postNo) throws Exception;
	
	public void delReComment(int commentNo) throws Exception;
	
}
