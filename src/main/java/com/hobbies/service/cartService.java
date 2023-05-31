package com.hobbies.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hobbies.dao.CartDAO;
import com.hobbies.model.Cart;

@Service
public class cartService {
	
	@Autowired
	private CartDAO cartdao;
	
	public int addItemToCart(Cart cartItem)
	{
		return this.cartdao.addItemToCart(cartItem);
	}
	
	public List<Cart> getCartItems(String email)
	{
		return this.cartdao.getCartItems(email);
	}
	
	public int deleteFromCart(int id)
	{
		return this.cartdao.deleteFromCart(id);
	}
	
	public Cart getItemByProductId(int id, String email)
	{
		return this.cartdao.getItemByProductId(id, email);
	}
	
	public int updateCartItem(int id, int q, String email)
	{
		return this.cartdao.updateCartItem(id,q, email);
	}
	
	public int updateCartItemByP(int id, int q, String email) {
		return this.cartdao.updateCartItemByP(id, q, email);
	}
	
	public int deleteFromCartEmail(String email) {
		return this.cartdao.deleteFromCartEmail(email);
	}
	
	
	public int updateCartItemStatus(int id, String status)
	{
		return this.cartdao.updateCartItemStatus(id, status);
	}
	
	public List<Cart> getCartItemsByBill(String email, String status)
	{
		return this.cartdao.getCartItemsByBill(email, status);
	}
	
}
