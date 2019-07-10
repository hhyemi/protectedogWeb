package org.protectedog.service.adopt;

import java.util.Map;

import org.protectedog.service.domain.Adopt;



//==> 분양관리에서 서비스할 내용 추상화/캡슐화한 Service  Interface Definition  
public interface AdoptService {
	
	// 글 등록
	public void addAdopt(Adopt adopt) throws Exception;
	
	// 글 상세조회
	public Adopt getAdopt(int postNo) throws Exception;
	
	// 글 리스트 조회
//	public Map<String , Object> listAdopt(Search search, String boardCode) throws Exception;
	
	// 글 수정
	public void updateAdopt(Adopt adopt) throws Exception;
	
	// 글 상태 변경 | 글 삭제
	public void updateStatusCode(Adopt adopt) throws Exception;
	

	

}