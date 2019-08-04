package org.protectedog.service.comment;

import java.util.List;
import java.util.Map;

import org.protectedog.common.Search;
import org.protectedog.service.domain.Comment;

public interface CommentService {
	
	// 댓글 추가
	public void addComment(Comment comment) throws Exception;
	
	// 댓글 조회
	public Comment getComment(int commentNo) throws Exception;
	
	// 댓글 수정
	public void updateComment(Comment comment) throws Exception;
	
	// 댓글 리스트
	public Map<String, Object> listComment(int postNo, Search search, String boardCode) throws Exception;
	
	// 댓글 삭제
	public void delComment(int commentNo) throws Exception;
	
	// 댓글 신고
	public void reportComment(int commentNo) throws Exception;
	
	// 댓글 좋아요 업데이트
	public void updateLikeCnt(Map<String, Object> map) throws Exception;
	
	// 내가 작성한 댓글 리스트
//	public Map<String, Object> listMyComment() throws Exception;
	
	// 리스트 더 보기
	public List<Comment> listCommentMoreView(Map<String, Object> map) throws Exception;
	
	// 전체개수
	public int getTotalCount(int postNo) throws Exception;
}
