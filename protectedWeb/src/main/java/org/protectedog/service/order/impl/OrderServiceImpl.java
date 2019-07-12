package org.protectedog.service.order.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.protectedog.common.Search;
import org.protectedog.service.domain.Order;
import org.protectedog.service.order.OrderDAO;
import org.protectedog.service.order.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
@Service("orderServiceImpl")
public class OrderServiceImpl implements OrderService {

	@Autowired
	@Qualifier("orderDAOImpl")
	private OrderDAO orderDAO;
	
	public void setOrderDao(OrderDAO orderDAO) {
		this.orderDAO = orderDAO;
	}
	
	
	public OrderServiceImpl() {
		// TODO Auto-generated constructor stub
		System.out.println(this.getClass());
	}
	
	@Override
	public void addOrder(Order order) throws Exception {
		// TODO Auto-generated method stub
		orderDAO.addOrder(order);
	}

	@Override
	public Order getOrder(int orderNo) throws Exception {
		// TODO Auto-generated method stub
		return orderDAO.getOrder(orderNo);
	}



	@Override
	public void delOrder(Order order) throws Exception {
		// TODO Auto-generated method stub
		orderDAO.delOrder(order);
		
	}


	@Override
	public Map<String, Object> listSwapOrder(Search search, String id) throws Exception {
		List<Order> list = orderDAO.listSwapOrder(search,id);
		int totalCount = orderDAO.getTotalCount(id);
		
		Map<String, Object> map = new HashMap<String, Object>();
		System.out.println(search.getCurrentPage());
		System.out.println(search.getPageSize());
		System.out.println("service "+list.size());  
		map.put("list", list);
		map.put("totalCount", new Integer(totalCount));
		
		
		return map;
	}
		
	@Override
	public Map<String, Object> listAdminOrder(Search search, String id) throws Exception {
		// TODO Auto-generated method stub
		List<Order> list= orderDAO.listAdminOrder(search, id);
		int totalCount = orderDAO.getTotalCount(id);
		
		Map<String, Object> map = new HashMap<String, Object>();
		System.out.println(search.getCurrentPage());
		System.out.println(search.getPageSize());
		System.out.println("service "+list.size()); 
		map.put("list", list );
		map.put("totalCount", new Integer(totalCount));
		
		return map;
		
	}


	@Override
	public Map<String, Object> listOrder(Search search, String id) throws Exception {
		// TODO Auto-generated method stub
		List<Order> list= orderDAO.listOrder(search, id);
		int totalCount = orderDAO.getTotalCount(id);
				
		Map<String, Object> map = new HashMap<String, Object>();
		System.out.println(search.getCurrentPage());
		System.out.println(search.getPageSize());
		System.out.println("service "+list.size()); 
		map.put("list", list );
		map.put("totalCount", new Integer(totalCount));
				
		return map;
				
			}



	@Override
	public void updateOrder(Order order) throws Exception {
		// TODO Auto-generated method stub
		orderDAO.updateOrder(order);
	}


	@Override
	public int updateOrderCode(Order order) throws Exception {
		// TODO Auto-generated method stub
		return orderDAO.updateOrderCode(order);
	}

}
