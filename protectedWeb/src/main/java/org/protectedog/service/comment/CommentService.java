package org.protectedog.service.comment;

import java.util.List;
import java.util.Map;

import org.protectedog.common.Search;
import org.protectedog.service.domain.Comment;

public interface CommentService {
	
	// ¥Ò±€ µÓ∑œ
	public void addComment(Comment comment) throws Exception;
	
	// ¥Ò±€ ¡∂»∏ ?
	public Comment getComment(int commentNo) throws Exception;
	
	// ¥Ò±€ ºˆ¡§
	public void updateComment(Comment comment) throws Exception;
	
	// ±€ø° ¥Î«— ¥Ò±€ ∏ÆΩ∫∆Æ
	public Map<String, Object> listComment(int postNo, Search search) throws Exception;
	
	// ¥Ò±€ ªË¡¶
	public void delComment(int commentNo) throws Exception;
	
	// ¥Ò±€ Ω≈∞Ì
	public void reportComment(int commentNo) throws Exception;
	
	// ¥Ò±€ ¡¡æ∆ø‰
	public void updateLikeCnt(Map<String, Object> map) throws Exception;
	
	// ≥ª∞° ¿€º∫«— ¥Ò±€ ∏ÆΩ∫∆Æ
//	public Map<String, Object> listMyComment() throws Exception;
	
	// ¥Ò±€ ∆‰¿Ã¬°
	public List<Comment> listCommentMoreView(Map<String, Object> map) throws Exception;
	
	// ¥Ò±€ √— ∞≥ºˆ
	public int getTotalCount(int postNo) throws Exception;
}
