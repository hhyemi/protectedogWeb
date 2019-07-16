package org.protectedog.service.board.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.protectedog.common.Search;
import org.protectedog.service.board.BoardDAO;
import org.protectedog.service.board.BoardService;
import org.protectedog.service.domain.Board;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;




//==> 분양관리 서비스 구현
@Service("boardServiceImpl")
public class BoardServiceImpl implements BoardService{
	
	///Field
	@Autowired
	@Qualifier("boardDAOImpl")
	private BoardDAO boardDAO;
	public void setBoardADO(BoardDAO boardDAO) {
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

	public Map<String , Object> listBoard(Search search, String boardCode) throws Exception {
		Map<String, Object> map= boardDAO.listBoard(search, boardCode);
		int totalCount = boardDAO.getTotalCount(boardCode);
		
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


}