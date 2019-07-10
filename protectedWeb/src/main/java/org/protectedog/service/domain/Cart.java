package org.protectedog.service.domain;

public class Cart {
	
	//Field
	private int cartNO;
	private Product prodNo;
	private User id;
	private int totalPrice;
	private int quantity;
	
	///Constructor
	public Cart(int cartNO, Product prodNo, User id, int totalPrice, int quantity) {
		super();
		this.cartNO = cartNO;
		this.prodNo = prodNo;
		this.id = id;
		this.totalPrice = totalPrice;
		this.quantity = quantity;
		
	}

	public int getCartNO() {
		return cartNO;
	}

	public void setCartNO(int cartNO) {
		this.cartNO = cartNO;
	}

	public Product getProdNo() {
		return prodNo;
	}

	public void setProdNo(Product prodNo) {
		this.prodNo = prodNo;
	}

	public User getId() {
		return id;
	}

	public void setId(User id) {
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
