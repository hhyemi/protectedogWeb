package org.protectedog.service.board;

import java.util.List;
import java.util.Map;

import org.protectedog.common.Search;
import org.protectedog.service.domain.Board;



//==> 게시판관리에서 서비스할 내용 추상화/캡슐화한 Service  Interface Definition  
public interface BoardService {
	
	// 글 등록
	public void addBoard(Board board) throws Exception;
	
	// 글 상세조회
	public Board getBoard(int postNo) throws Exception;
	
	// 글 리스트 조회
	public Map<String , Object> listBoard(Search search, String boardCode, int order) throws Exception;
	
	// 글 수정
	public void updateBoard(Board board) throws Exception;
	
	// 조회수
	public void updateViewCount(Board board) throws Exception;
	
	// 추천수
	public void updateRecommendCount(Board board) throws Exception;
	
	// 글 삭제
	public void delBoard(Board board) throws Exception;
	
	// 상위 랭킹 5개 리스트
	public List<Board> listBoardRankingSearch(String boardCode) throws Exception ;
	
	// 글 리스트 + 댓글 개수 조회
	public Map<String, Object> listBoardMoreCommentCount(Search search, String boardCode, int order) throws Exception;
	

}