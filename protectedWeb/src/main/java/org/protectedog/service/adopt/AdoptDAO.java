package org.protectedog.service.adopt;


import java.util.Map;

import org.protectedog.common.Search;
import org.protectedog.service.domain.Adopt;


//==> 분양관리에서 CRUD 추상화/캡슐화한 DAO Interface Definition
public interface AdoptDAO {
	
	// INSERT
	public void addAdopt(Adopt adopt) throws Exception ;

	// SELECT ONE
	public Adopt getAdopt(int postNo) throws Exception ;

	// SELECT LIST
	public Map<String, Object> listAdopt(Search search, String boardCode) throws Exception ;
	public Map<String, Object> listAdopt2(String id) throws Exception ;
	public Map<String, Object> listMissing(String boardCode) throws Exception ;

	// UPDATE
	public void updateAdopt(Adopt adopt) throws Exception ;
	
	// Status UPDATE | DELETE
	public void updateStatusCode(Adopt adopt) throws Exception ;
	
	// 게시판 Page 처리를 위한 전체Row(totalCount)  return
	public int getTotalCount(Search search, String boardCode) throws Exception ;
	
}