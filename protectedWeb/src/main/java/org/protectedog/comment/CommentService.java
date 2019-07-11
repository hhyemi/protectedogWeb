package org.protectedog.comment;

import java.util.Map;

import org.protectedog.service.domain.Comment;

public interface CommentService {
	
	public void addComment(Comment comment) throws Exception;
	
	public Comment getComment(int commentNo) throws Exception;
	
	public void updateComment(Comment comment) throws Exception;
	
	public Map<String, Object> listComment(int postNo) throws Exception;
	
	public void delComment(int commentNo) throws Exception;
	
	public int getTotalCount(int commentNo) throws Exception;
}
