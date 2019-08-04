package org.protectedog.service.comment.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.protectedog.common.Search;
import org.protectedog.service.comment.CommentDAO;
import org.protectedog.service.comment.CommentService;
import org.protectedog.service.domain.Comment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service("commentServiceImpl")
public class CommentServiceImpl implements CommentService{

	@Autowired
	@Qualifier("commentDAOImpl")
	private CommentDAO commentDAO;
	
	@Override
	public void addComment(Comment comment) throws Exception {
		commentDAO.addComment(comment);
	}

	@Override
	public Comment getComment(int commentNo) throws Exception {
		return commentDAO.getComment(commentNo);
	}

	@Override
	public void updateComment(Comment comment) throws Exception {
		commentDAO.updateComment(comment);
	}

	@Override
	public Map<String, Object> listComment(int postNo, Search search, String boardCode) throws Exception {
		
		// ������ Map ���� 
		Map<String, Object> map = new HashMap<String, Object>();
		
		System.out.println(" listCommentServiceImpl postNo : " + postNo);
		System.out.println(" listCommentServiceImpl search : " + search);
		
		// ������ ��������
		List<Comment> list = commentDAO.listComment(postNo, search, boardCode);
		int totalCount = commentDAO.getTotalCount(postNo);
		
		// �����
		System.out.println(" listCommentServiceImpl list : " + list);
		System.out.println(" listCommentServiceImpl totalCount : " + totalCount);
		
		// ������ ������ �ֱ�
		map.put("list", list);
		map.put("totalCount", totalCount);
		
		return map;
	}

	@Override
	public void delComment(int commentNo) throws Exception {
		commentDAO.delComment(commentNo);
	}

	@Override
	public void reportComment(int commentNo) throws Exception {
		commentDAO.reportComment(commentNo);
	}

	@Override
	public void updateLikeCnt(Map<String, Object> map) throws Exception {
		commentDAO.updateLikeCnt(map);
	}

	@Override
	public List<Comment> listCommentMoreView(Map<String, Object> map) throws Exception {
		return commentDAO.listCommentMoreView(map);
	}

	@Override
	public int getTotalCount(int postNo) throws Exception {
		return commentDAO.getTotalCount(postNo);
	}
	
}
