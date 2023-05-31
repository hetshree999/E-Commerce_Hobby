package com.hobbies.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hobbies.dao.AdminCartDAO;
import com.hobbies.model.AdminCart;

@Service
public class adminCartService {
	@Autowired
	private AdminCartDAO admincartdao;
	
	public int addItemToAdminCart(AdminCart aCart)
	{
		return this.admincartdao.addItemToAdminCart(aCart);
	}
	
	public List<AdminCart> getAdminCartItems(String email)
	{
		return this.admincartdao.getAdminCartItems(email);
	}
	
	public int deleteFromAdminCart(int id, String email) {
		return this.admincartdao.deleteFromAdminCart(id, email);
	}
	
	public int deleteFromAdminCartEmail(String email) {
		return this.admincartdao.deleteFromAdminCartEmail(email);
	}
	
	public AdminCart getAdminItemByProductId(int id) {
		return this.admincartdao.getAdminItemByProductId(id);
	}
	
	public int updateAdminCartItem(int id, int q, String email) {
		return this.admincartdao.updateAdminCartItem(id, q, email);
	}
	
	public int updateAdminCartItemByP(int id, int q, String email) {
		return this.admincartdao.updateAdminCartItemByP(id, q, email);
	}
	
	public int updateAdminCartItemStatus(int id, String status) {
		return this.admincartdao.updateAdminCartItemStatus(id, status);
	}
	
	public List<AdminCart> getAdminCartItemsByBill(String email, String status)
	{
		return this.admincartdao.getAdminCartItemsByBill(email, status);
	}
	
	public List<AdminCart> getAllProductsBill()
	{
		return this.admincartdao.getAllProductsBill();
	}
	
	public int updateAdminCartDate(int id, String oDate, String dDate)
	{
		return this.admincartdao.updateAdminCartDate(id, oDate, dDate);
	}
	
}
