package org.protectedog.service.apply;

import java.util.Map;

import org.protectedog.common.Search;
import org.protectedog.service.domain.Apply;



//==> 분양신청관리에서 서비스할 내용 추상화/캡슐화한 Service  Interface Definition  
public interface ApplyService {
	
	// 신청글 등록
	public void addApply(Apply apply) throws Exception;
	
	// 신청글 상세조회
	public Apply getApply(int applyNo) throws Exception;
	
	// 신청글 리스트 
	public Map<String , Object> listApply(Search search,int adoptNo) throws Exception;
	// 후기등록 권한 
	public Map<String , Object> listApply2(String id) throws Exception;
	
	// 신청글 삭제
	public void delApply(Apply apply) throws Exception;
	
}