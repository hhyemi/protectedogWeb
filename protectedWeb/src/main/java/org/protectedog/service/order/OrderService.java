package org.protectedog.service.order;

import java.util.List;
import java.util.Map;

import org.protectedog.common.Search;
import org.protectedog.service.domain.Order;


public interface OrderService {

	//구매내역 추가 
	public void addOrder(Order order) throws Exception;
	
	//구매내역 상세조회
	public Order getOrder(int orderNo) throws Exception;
	
	//주문내역 리스트
	public Map<String,Object> listOrder(Search search,String id) throws Exception;
	
	//구매정보 수정 
	public void updateOrder(Order order) throws Exception;
	
	// 배송중 2 배송완료/구매후기 작성 3 구매후기 조회 4 구매취소 5 교환/반품중 6 수정 
	public int updateOrderCode(Order order) throws Exception;

	//주문 삭제(관리자 권한)
	public void delOrder(Order order)throws Exception;
	
	//관리자주문내역 리스트
    public Map<String,Object> listAdminOrder(Search search, String id) throws Exception;
    //주문취소리스트
    public Map<String,Object> listCancleOrder(Search search, String id) throws Exception;
	

}