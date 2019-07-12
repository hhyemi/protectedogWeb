package org.protectedog.service.cart.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.protectedog.service.cart.CartDAO;
import org.protectedog.service.domain.Cart;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

@Repository("cartDAOImpl")
public class CartDAOImpl implements CartDAO{
	
	///Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	///Constructor
	public CartDAOImpl() {
		System.out.println(this.getClass());
	}
	
	@Override
	public void addCart(Cart cart) throws Exception {
		sqlSession.insert("cartMapper.addCart", cart);

	
	}

	@Override
	public void updateCart(Cart cart) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update("cartMapper.updateCart", cart);
		
	}

	@Override
	public int totalPrice(String id) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("cartMapper.totalPrice", id);
	}

	@Override
	public void delCart(int cartNo) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.delete("CartMapper.delCart", cartNo);
		
	}

	@Override
	public List<Cart> listCart(String id) throws Exception {
		System.out.println("list cart"+ id);
		return sqlSession.selectList("cartMapper.listCart", id);
	}

}
