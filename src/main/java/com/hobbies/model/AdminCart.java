package com.hobbies.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class AdminCart {
	@Id
	@GeneratedValue
	private int cartItemId;
	private int productid;
	private int quantity;
	private double price;
	private double total;
	private String productName;
	private String email;
	private String orderDate;
	private String deliverDate;
	private String status;
	public int getCartItemId() {
		return cartItemId;
	}
	public void setCartItemId(int cartItemId) {
		this.cartItemId = cartItemId;
	}
	public int getProductid() {
		return productid;
	}
	public void setProductid(int productid) {
		this.productid = productid;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public double getTotal() {
		return total;
	}
	public void setTotal(double total) {
		this.total = total;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}
	public String getDeliverDate() {
		return deliverDate;
	}
	public void setDeliverDate(String deliverDate) {
		this.deliverDate = deliverDate;
	}
	
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public AdminCart() {
		super();
		// TODO Auto-generated constructor stub
	}
	public AdminCart(int cartItemId, int productid, int quantity, double price, double total, String productName,
			String email, String orderDate, String deliverDate, String status) {
		super();
		this.cartItemId = cartItemId;
		this.productid = productid;
		this.quantity = quantity;
		this.price = price;
		this.total = total;
		this.productName = productName;
		this.email = email;
		this.orderDate = orderDate;
		this.deliverDate = deliverDate;
		this.status = status;
	}
	@Override
	public String toString() {
		return "AdminCart [cartItemId=" + cartItemId + ", productid=" + productid + ", quantity=" + quantity
				+ ", price=" + price + ", total=" + total + ", productName=" + productName + ", email=" + email
				+ ", orderDate=" + orderDate + ", deliverDate=" + deliverDate + ", status=" + status + "]";
	}
	
}
