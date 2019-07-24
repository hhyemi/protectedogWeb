package org.protectedog.service.domain;

public class Cart {
	
	//Field
	private int cartNO;
	private int prodNo;
	private String id;
	private int totalPrice;
	private int quantity;
	
	
	public Cart() {
		
	}


	public int getCartNO() {
		return cartNO;
	}


	public void setCartNO(int cartNO) {
		this.cartNO = cartNO;
	}


	public int getProdNo() {
		return prodNo;
	}


	public void setProdNo(int prodNo) {
		this.prodNo = prodNo;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public int getTotalPrice() {
		return totalPrice;
	}


	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}


	public int getQuantity() {
		return quantity;
	}


	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}


	@Override
	public String toString() {
		return "Cart [cartNO=" + cartNO + ", prodNo=" + prodNo + ", id=" + id + ", totalPrice=" + totalPrice
				+ ", quantity=" + quantity + "]";
	}
	
}
	
	