package org.protectedog.service.cart;

import java.util.List;

import org.protectedog.common.Search;
import org.protectedog.service.domain.Cart;

public interface CartDAO {
	
	public void addCart(Cart cart) throws Exception;

	public List<Cart> listCart(String id) throws Exception;
	
	public void updateCart(Cart cart) throws Exception;

	public void delCart(int cartNo) throws Exception;

	public void modifyCart(Cart cart) throws Exception;

	public int totalPrice(String userId) throws Exception;

	public int countCart(int prodNo, String id) throws Exception;

	
	
	

}
