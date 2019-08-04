package org.protectedog.service.comment;

import java.util.List;
import java.util.Map;

import org.protectedog.common.Search;
import org.protectedog.service.domain.Comment;

public interface CommentDAO {

	// ��� ���
	public void addComment(Comment comment) throws Exception;

	// ��� ��ȸ ?
	public Comment getComment(int commentNo) throws Exception;

	// ��� ����
	public void updateComment(Comment comment) throws Exception;

	// ��� ����Ʈ
	public List<Comment> listComment(int postNo, Search search,String boardCode) throws Exception;

	// ��� ����
	public void delComment(int commentNo) throws Exception;

	// ��� �Ű�
	public void reportComment(int commentNo) throws Exception;
	
	// ��� ���ƿ�
	public void updateLikeCnt(Map<String, Object> map) throws Exception;
	
	// ��� ����
	public int getTotalCount(int postNo) throws Exception;
	
	// ��� ����¡
	public List<Comment> listCommentMoreView(Map<String, Object> map) throws Exception;

}
