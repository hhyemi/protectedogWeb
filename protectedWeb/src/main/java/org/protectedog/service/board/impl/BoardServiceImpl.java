package org.protectedog.service.board.impl;

import java.util.List;
import java.util.Map;

import org.protectedog.common.Search;
import org.protectedog.service.board.BoardDAO;
import org.protectedog.service.board.BoardService;
import org.protectedog.service.domain.Board;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;




//==> �о���� ���� ����
@Service("boardServiceImpl")
public class BoardServiceImpl implements BoardService{
	
	///Field
	@Autowired
	@Qualifier("boardDAOImpl")
	private BoardDAO boardDAO;
	public void setBoardDAO(BoardDAO boardDAO) {
		this.boardDAO = boardDAO;
	}
	
	///Constructor
	public BoardServiceImpl() {
		System.out.println(this.getClass());
	}

	///Method
	public void addBoard(Board board) throws Exception {
		boardDAO.addBoard(board);
	}

	public Board getBoard(int postNo) throws Exception {
		return boardDAO.getBoard(postNo);
	}

	public Map<String , Object> listBoard(Search search, String boardCode, int order) throws Exception {
		Map<String, Object> map= boardDAO.listBoard(search, boardCode, order);
		
		map.put("boardCode",boardCode);
		map.put("searchKeyword", search.getSearchKeyword());
		
		int totalCount = boardDAO.getTotalCount(map);
		
		map.put("map", map );
		map.put("totalCount", new Integer(totalCount));
		
		return map;
	}
	
	public Map<String , Object> listBoardMoreCommentCount(Search search, String boardCode, int order) throws Exception {
		Map<String, Object> map= boardDAO.listBoardMoreCommentCount(search, boardCode, order);
		
		map.put("boardCode",boardCode);
		map.put("searchKeyword", search.getSearchKeyword());
		
		int totalCount = boardDAO.getTotalCount(map);
		
		map.put("map", map );
		map.put("totalCount", new Integer(totalCount));
		
		return map;
	}


	public void updateBoard(Board board) throws Exception {
		boardDAO.updateBoard(board);
	}
	
	public void updateViewCount(Board board) throws Exception {
		boardDAO.updateViewCount(board);
	}
	
	public void updateRecommendCount(Board board) throws Exception {
		boardDAO.updateRecommendCount(board);
	}

	public void delBoard(Board board) throws Exception {
		boardDAO.delBoard(board);
	}
	
	public List<Board> listBoardRankingSearch(String boardCode) throws Exception {
		return boardDAO.listBoardRankingSearch(boardCode);
	}


}