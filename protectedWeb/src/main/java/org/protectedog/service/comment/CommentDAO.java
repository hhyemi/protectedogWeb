package org.protectedog.service.comment;

import java.util.List;
import java.util.Map;

import org.protectedog.common.Search;
import org.protectedog.service.domain.Comment;

public interface CommentDAO {

	// ´ñ±Û µî·Ï
	public void addComment(Comment comment) throws Exception;

	// ´ñ±Û Á¶È¸ ?
	public Comment getComment(int commentNo) throws Exception;

	// ´ñ±Û ¼öÁ¤
	public void updateComment(Comment comment) throws Exception;

	// ´ñ±Û ¸®½ºÆ®
	public List<Comment> listComment(int postNo, Search search) throws Exception;

	// ´ñ±Û »èÁ¦
	public void delComment(int commentNo) throws Exception;

	// ´ñ±Û ½Å°í
	public void reportComment(int commentNo) throws Exception;
	
	// ´ñ±Û °³¼ö
	public int getTotalCount(int postNo) throws Exception;

}
