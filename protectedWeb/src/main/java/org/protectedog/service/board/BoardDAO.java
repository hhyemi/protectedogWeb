package org.protectedog.service.board;

import java.util.List;
import java.util.Map;

import org.protectedog.common.Search;
import org.protectedog.service.domain.Board;


//==> 게시판관리에서 CRUD 추상화/캡슐화한 DAO Interface Definition
public interface BoardDAO {
	
	// INSERT
	public void addBoard(Board board) throws Exception ;

	// SELECT ONE
	public Board getBoard(int postNo) throws Exception ;

	// SELECT LIST
	public Map<String, Object> listBoard(Search search, String boardCode, int order) throws Exception ;

	// UPDATE
	public void updateBoard(Board board) throws Exception ;
	
	// UPDATE 조회수
	public void updateViewCount(Board board) throws Exception ;
	
	// UPDATE 추천수
	public void updateRecommendCount(Board board) throws Exception ;
	
	// DELETE
	public void delBoard(Board board) throws Exception ;
	
	// 게시판 Page 처리를 위한 전체Row(totalCount)  return	
	public int getTotalCount(String boardCode) throws Exception ;
	
	// SELECT LIST RANKING TOP 5
	public List<Board> listBoardRankingSearch(String boardCode) throws Exception ;
	
	// 글 리스트 + 댓글 개수 조회
	public Map<String, Object> listBoardMoreCommentCount(Search search, String boardCode, int order) throws Exception;
	
}