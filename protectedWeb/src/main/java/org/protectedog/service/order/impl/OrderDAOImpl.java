package org.protectedog.service.order.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.protectedog.common.Search;
import org.protectedog.service.domain.Mileage;
import org.protectedog.service.domain.Order;
import org.protectedog.service.order.OrderDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
	
	// 备概-备概包府
	@Repository("orderDAOImpl")
	public class OrderDAOImpl implements OrderDAO{
		
	///Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
		
	public void setSqlSession(SqlSession sqlSession){
		this.sqlSession = sqlSession;
	}
		
	///Constructor
	public OrderDAOImpl(){
		System.out.println(this.getClass());
	}
		
	@Override
	public void addOrder(Order order) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert("orderMapper.addOrder", order);

	}

	@Override
	public Order getOrder(int orderNo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("orderMapper.getOrder", orderNo);
	}

	@Override
	public List<Order> listOrder(Search search, String id) throws Exception {
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("search", search);
		map.put("id", id);
		return sqlSession.selectList("orderMapper.listOrder",map);
	}


	@Override
	public void updateOrder(Order order) throws Exception {
		sqlSession.update("orderMapper.updateOrder", order);

	}

	@Override
	public int updateOrderCode(Order order) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.update("orderMapper.updateOrderCode", order);

	}

	@Override
	public List<Order> listSwapOrder(Search search, String id) throws Exception {
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("search", search);
		map.put("id", id);
		return sqlSession.selectList("orderMapper.listSwapOrder", search);
	}

	@Override
	public List<Order> listAdminOrder(Search search, String id) throws Exception {
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("search", search);
		map.put("id", id);
		return sqlSession.selectList("orderMapper.listAdminOrder", search);
	}

	@Override
	public void delOrder(Order order) throws Exception {
			sqlSession.update("orderMapper.delOrder", order);
		}

	@Override
	public int getTotalCount(String id) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("orderMapper.getTotalCount", id);
	}

	@Override
	public void addDeliveryCode(int orderNo) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert("orderMapper.addDeliveryCode", orderNo);
	}

	@Override
	public void updateMileage(String id) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert("mileageMapper.updateMileage", id);
	}
	}
		

