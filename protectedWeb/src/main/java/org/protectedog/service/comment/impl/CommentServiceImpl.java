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
	public Map<String, Object> listComment(int postNo, Search search) throws Exception {
		
		// 전달할 Map 생성 
		Map<String, Object> map = new HashMap<String, Object>();
		
		System.out.println(" listCommentServiceImpl postNo : " + postNo);
		System.out.println(" listCommentServiceImpl search : " + search);
		
		// 데이터 가져오기
		List<Comment> list = commentDAO.listComment(postNo, search);
		int totalCount = commentDAO.getTotalCount(postNo);
		
		// 디버깅
		System.out.println(" listCommentServiceImpl list : " + list);
		System.out.println(" listCommentServiceImpl totalCount : " + totalCount);
		
		// 전달할 데이터 넣기
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
