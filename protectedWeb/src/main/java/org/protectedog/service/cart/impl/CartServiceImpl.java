package org.protectedog.service.cart.impl;

import java.util.List;

import org.protectedog.service.cart.CartDAO;
import org.protectedog.service.cart.CartService;
import org.protectedog.service.domain.Cart;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service("cartServiceImpl")
public class CartServiceImpl implements CartService {
	
	@Autowired
	@Qualifier("cartDAOImpl")
	private CartDAO cartDAO;
	
	public void setCartDao(CartDAO cartDAO) {
		this.cartDAO = cartDAO;
	}
	
	public CartServiceImpl() {
		System.out.println(this.getClass());
	}
	
	
	@Override
	public void Cart(Cart cart) throws Exception {
		// TODO Auto-generated method stub
		cartDAO.addCart(cart);
		
	}

	@Override
	public void updateCart(Cart cart) throws Exception {
		// TODO Auto-generated method stub
		cartDAO.updateCart(cart);

	}

	@Override
	public int totalPrice(String id) throws Exception {
		// TODO Auto-generated method stub
		return cartDAO.totalPrice(id);
	}

	@Override
	public void delCart(int CartNo) throws Exception {
		// TODO Auto-generated method stub
		cartDAO.delCart(CartNo);

	}

	@Override
	public List<Cart> listCart(String id) throws Exception {
		// TODO Auto-generated method stub
		return cartDAO.listCart(id);
	}




}
