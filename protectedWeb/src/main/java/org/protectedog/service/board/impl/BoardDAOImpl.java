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



//==> �Խ��ǰ��� DAO CRUD ����
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
	
	public Map<String, Object> listBoard(Search search, String boardCode, int order) throws Exception {
		Map<String , Object>  map = new HashMap<String, Object>();
		map.put("boardCode",  boardCode );
		map.put("searchCondition",  search.getSearchCondition());
		map.put("searchKeyword",  search.getSearchKeyword());
		map.put("endRowNum",  search.getEndRowNum()+"" );
		map.put("startRowNum",  search.getStartRowNum()+"" );
		map.put("order", order);
		
		List<Board> list = sqlSession.selectList("BoardMapper.listBoard", map); 

		//selectOne: ���� ����� ������ return null 
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

	// �Խ��� Page ó���� ���� ��ü Row(totalCount)  return
	public int getTotalCount(Map<String, Object> map) throws Exception {
		return sqlSession.selectOne("BoardMapper.getTotalCount", map);
	}
	
	// �Խ��� ���� 5���� �Խñ��� ��ȸ�� ������������ ����ϴ� �޼ҵ�
	public List<Board> listBoardRankingSearch(String boardCode) throws Exception {
		
		return sqlSession.selectList("BoardMapper.listBoardRankingSearch", boardCode);
	}
	
	public Map<String, Object> listBoardMoreCommentCount(Search search, String boardCode, int order) throws Exception {
		
		// CREATE MAP OBJECT
		Map<String , Object>  map = new HashMap<String, Object>();
		
		System.out.println("===================================== BOARD DAP IMPL =====================================");
		
		// DEBUG
		System.out.println(" boardCode : " + boardCode);
		System.out.println(" searchCondition : " + search.getSearchCondition());
		System.out.println(" searchKeyword : " +  search.getSearchKeyword());
		System.out.println(" endRowNum : " +  search.getEndRowNum());
		System.out.println(" startRowNum : " + search.getStartRowNum());
		System.out.println(" order : " + order);
		
		// PUT MAP
		map.put("boardCode",  boardCode );
		map.put("searchCondition",  search.getSearchCondition());
		map.put("searchKeyword",  search.getSearchKeyword());
		map.put("endRowNum",  search.getEndRowNum()+"" );
		map.put("startRowNum",  search.getStartRowNum()+"" );
		map.put("order", order);
		
		// SQL EXECUTE
		List<Board> list = sqlSession.selectList("BoardMapper.listBoardMoreCommentCount", map); 

		// RETURN PUT MAP 
		map.put("totalCount", sqlSession.selectOne("BoardMapper.getTotalCount", map));
		map.put("list", list);

		return map;
	}


}