package org.protectedog.service.apply;

import java.util.Map;

import org.protectedog.common.Search;
import org.protectedog.service.domain.Apply;



//==> 분양신청관리에서 CRUD 추상화/캡슐화한 DAO Interface Definition
public interface ApplyDAO {
	
	// INSERT
	public void addApply(Apply apply) throws Exception ;

	// SELECT ONE
	public Apply getApply(int applyNo) throws Exception ;

	// SELECT LIST
	public Map<String , Object> listApply(Search search, int adoptNo) throws Exception ;
	
	// DELETE
	public void delApply(Apply apply) throws Exception ;
	
	// 게시판 Page 처리를 위한 전체Row(totalCount)  return
	public int getTotalCount(int adoptNo) throws Exception ;
	
}