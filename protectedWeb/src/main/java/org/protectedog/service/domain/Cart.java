package org.protectedog.service.domain;

public class Cart {
		
		//Field
		private int cartNo;
		private Product prodNo;
		private User id;
		private int totalPrice;
		private int quantity;
		
		
		public Cart() {
			
		}


		public int getCartNo() {
			return cartNo;
		}


		public void setCartNo(int cartNo) {
			this.cartNo = cartNo;
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
			return "Cart [cartNo=" + cartNo + ", prodNo=" + prodNo + ", id=" + id + ", totalPrice=" + totalPrice
					+ ", quantity=" + quantity + "]";
		}
		

}
