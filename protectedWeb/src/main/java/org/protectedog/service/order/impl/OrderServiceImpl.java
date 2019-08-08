package org.protectedog.service.order.impl;

import java.util.HashMap;
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
	public Map<String, Object> listOrder(Search search, String id) throws Exception {
		System.out.println("serviceImpl listorder");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", orderDAO.listOrder(search, id));
		map.put("totalCount", orderDAO.getTotalCount(id));
		System.out.println("listorder");
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


	@Override
	public Map<String, Object> listAdminOrder(Search search, String id) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("serviceImpl listorder");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", orderDAO.listAdminOrder(search, id));
		map.put("totalCount", orderDAO.getTotalCount(id));
		System.out.println("listorder");
		return map;
	}


	@Override
	public Map<String, Object> listCancleOrder(Search search, String id) throws Exception {
		System.out.println("serviceImpl listCancleOrder");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", orderDAO.listCancleOrder(search, id));
		map.put("totalCount", orderDAO.getTotalCount(id));
		System.out.println("listorder");
		return map;
	}


}
