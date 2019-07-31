package org.protectedog.service.adopt.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.protectedog.common.Search;
import org.protectedog.service.adopt.AdoptDAO;
import org.protectedog.service.domain.Adopt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;



//==> 분양관리 DAO CRUD 구현
@Repository("adoptDAOImpl")
public class AdoptDAOImpl implements AdoptDAO{
	
	///Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	///Constructor
	public AdoptDAOImpl() {
		System.out.println(this.getClass());
	}

	///Method
	public void addAdopt(Adopt adopt) throws Exception {
		sqlSession.insert("AdoptMapper.addAdopt", adopt);
	}

	public Adopt getAdopt(int postNo) throws Exception {
		return sqlSession.selectOne("AdoptMapper.getAdopt", postNo);
	}
	
	public Map<String, Object> listAdopt(Search search, String boardCode) throws Exception {
		Map<String , Object>  map = new HashMap<String, Object>();
		map.put("boardCode",  boardCode );
		map.put("searchCondition",  search.getSearchCondition()+"" );
		map.put("searchKeyword",  search.getSearchKeyword()+"" );
		map.put("areaCondition",  search.getAreaCondition()+"" );
		map.put("endRowNum",  search.getEndRowNum()+"" );
		map.put("startRowNum",  search.getStartRowNum()+"" );
		
		List<Adopt> list = sqlSession.selectList("AdoptMapper.listAdopt", map); 

		//selectOne: 쿼리 결과가 없으면 return null 
		map.put("totalCount", sqlSession.selectOne("AdoptMapper.getTotalCount", map));
		map.put("list", list);
		
		return map;
	}
	
	public Map<String, Object> listAdopt2(String id) throws Exception {
		Map<String , Object>  map = new HashMap<String, Object>();
		map.put("id",  id );
		
		List<Adopt> list = sqlSession.selectList("AdoptMapper.listAdopt2", map); 
		
		//selectOne: 쿼리 결과가 없으면 return null 
		map.put("list", list);
		
		return map;
	}
	
	public Map<String, Object> listMissing(String boardCode) throws Exception {
		System.out.println("=================디에이오");
		Map<String , Object>  map = new HashMap<String, Object>();
		
		List<Adopt> list = sqlSession.selectList("AdoptMapper.listMissing", boardCode); 
		
		//selectOne: 쿼리 결과가 없으면 return null 
		map.put("list", list);
		
		return map;
	}
	
	public void updateAdopt(Adopt adopt) throws Exception {
		sqlSession.update("AdoptMapper.updateAdopt", adopt);
	}
	
	public void updateStatusCode(Adopt adopt) throws Exception {
		sqlSession.update("AdoptMapper.updateStatusCode", adopt);
	}

	// 게시판 Page 처리를 위한 전체 Row(totalCount)  return
	public int getTotalCount(Search search, String boardCode) throws Exception {
		System.out.println("=================디에이오 겟토탈카운트");
		Map<String , Object>  map = new HashMap<String, Object>();
		map.put("boardCode",  boardCode );
		map.put("searchCondition",  search.getSearchCondition()+"" );
		map.put("searchKeyword",  search.getSearchKeyword()+"" );
		map.put("areaCondition",  search.getAreaCondition()+"" );
		map.put("endRowNum",  search.getEndRowNum()+"" );
		map.put("startRowNum",  search.getStartRowNum()+"" );
		return sqlSession.selectOne("AdoptMapper.getTotalCount", map);
	}
}