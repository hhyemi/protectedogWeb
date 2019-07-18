package org.protectedog.service.comment;

import java.util.Map;

import org.protectedog.common.Search;
import org.protectedog.service.domain.Comment;

public interface CommentService {
	
	// 댓글 등록
	public void addComment(Comment comment) throws Exception;
	
	// 댓글 조회 ?
	public Comment getComment(int commentNo) throws Exception;
	
	// 댓글 수정
	public void updateComment(Comment comment) throws Exception;
	
	// 글에 대한 댓글 리스트
	public Map<String, Object> listComment(int postNo, Search search) throws Exception;
	
	// 댓글 삭제
	public void delComment(int commentNo) throws Exception;
	
	// 댓글 신고
	public void reportComment(int commentNo) throws Exception;
	
	// 댓글 좋아요
	public void updateLikeCnt(Map<String, Object> map) throws Exception;
	
	// 내가 작성한 댓글 리스트
//	public Map<String, Object> listMyComment() throws Exception;
}
