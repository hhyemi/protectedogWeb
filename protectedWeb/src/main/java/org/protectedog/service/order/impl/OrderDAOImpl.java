package org.protectedog.service.order.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.protectedog.common.Search;
import org.protectedog.service.domain.Order;
import org.protectedog.service.order.OrderDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
	

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
		sqlSession.insert("OrderMapper.addOrder", order);
		
	}
	
	@Override
	public List<Order> listOrder(Search search, String id) throws Exception {
		
		Map<String , Object>  map = new HashMap<String, Object>();

		map.put("search", search);
		System.out.println();
		map.put("id", id);
		map.put("startRowNum", search.getStartRowNum());
		map.put("endRowNum",search.getEndRowNum());
		System.out.println("listorder DAOImpl");

		return sqlSession.selectList("OrderMapper.listOrder", map);
		

	}
	
	@Override
	public int getTotalCount(String id) throws Exception {
		// TODO Auto-generated method stub
		Map<String,String> map = new HashMap<String,String>();
		map.put("id", id);
		
		return sqlSession.selectOne("OrderMapper.getTotalCount", map);
	}
	

	@Override
	public Order getOrder(int orderNo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("OrderMapper.getOrder", orderNo);
	}


	@Override
	public void updateOrder(Order order) throws Exception {
		sqlSession.update("OrderMapper.updateOrder", order);

	}

	@Override
	public int updateOrderCode(Order order) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.update("OrderMapper.updateOrderCode", order);

	}

	@Override
	public void delOrder(Order order) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Order> listAdminOrder(Search search, String id) throws Exception {
		Map<String , Object>  map = new HashMap<String, Object>();

		map.put("search", search);
		System.out.println();
		map.put("id", id);
		map.put("startRowNum", search.getStartRowNum());
		map.put("endRowNum",search.getEndRowNum());
		System.out.println("listAdminOrder DAOImpl");

		return sqlSession.selectList("OrderMapper.listAdminOrder", map);
	}

	@Override
	public List<Order> listCancleOrder(Search search, String id) throws Exception {
		Map<String , Object>  map = new HashMap<String, Object>();

		map.put("search", search);
		System.out.println();
		map.put("id", id);
		map.put("startRowNum", search.getStartRowNum());
		map.put("endRowNum",search.getEndRowNum());
		System.out.println("listCancleOrder");

		return sqlSession.selectList("OrderMapper.listCancleOrder", map);
	}





	}

