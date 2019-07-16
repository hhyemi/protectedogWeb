package org.protectedog.service.board.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.protectedog.common.Search;
import org.protectedog.service.board.BoardDAO;
import org.protectedog.service.domain.Board;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;



//==> 게시판관리 DAO CRUD 구현
@Repository("boardDAOImpl")
public class BoardDAOImpl implements BoardDAO{
	
	///Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	///Constructor
	public BoardDAOImpl() {
		System.out.println(this.getClass());
	}

	///Method
	public void addBoard(Board board) throws Exception {
		sqlSession.insert("BoardMapper.addBoard", board);
	}

	public Board getBoard(int postNo) throws Exception {
		return sqlSession.selectOne("BoardMapper.getBoard", postNo);
	}
	
	public Map<String, Object> listBoard(Search search, String boardCode) throws Exception {
		Map<String , Object>  map = new HashMap<String, Object>();
		map.put("boardCode",  boardCode );
		map.put("endRowNum",  search.getEndRowNum()+"" );
		map.put("startRowNum",  search.getStartRowNum()+"" );
		
		List<Board> list = sqlSession.selectList("BoardMapper.listBoard", map); 

		//selectOne: 쿼리 결과가 없으면 return null 
		map.put("totalCount", sqlSession.selectOne("BoardMapper.getTotalCount", map))
		;
		map.put("list", list);

		return map;
	}
	
	public void updateBoard(Board board) throws Exception {
		sqlSession.update("BoardMapper.updateBoard", board);
	}
	
	public void updateViewCount(Board board) throws Exception {
		sqlSession.update("BoardMapper.updateViewCount", board);
	}
	
	public void updateRecommendCount(Board board) throws Exception {
		sqlSession.update("BoardMapper.updateRecommendCount", board);
	}

	public void delBoard(Board board) throws Exception {
		sqlSession.update("BoardMapper.delBoard", board);
	}

	// 게시판 Page 처리를 위한 전체 Row(totalCount)  return
	public int getTotalCount(String boardCode) throws Exception {
		return sqlSession.selectOne("BoardMapper.getTotalCount", boardCode);
	}


}