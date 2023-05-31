package com.hobbies.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hobbies.dao.UserDAO;
import com.hobbies.model.Address;
import com.hobbies.model.Product;
import com.hobbies.model.User;

@Service
public class userService {
	
	@Autowired
	private UserDAO userdao;
	
	public int createUser(User user)
	{
		return this.userdao.saveUser(user);
	}
	
	public int checkUserLogin(String email, String password)
	{
		return this.userdao.checkLogin(email, password);
	}
	
	public int checkUserEmail(String email)
	{
		return this.userdao.checkEmail(email);
	}
	
	public List<Product> allProduct()
	{
		return this.userdao.selectAllProduct();
	}
	
	public User selectUserWhereEmail(String Email)
	{
		return this.userdao.selectUserWhereEmail(Email);
	}
	
	public User selectUserWhereId(int id)
	{
		return this.userdao.selectUserWhereId(id);
	}
	
	
	
	public int changePassword(int id, String pwd)
	{
		return this.userdao.changePassword(id, pwd);
	}
	
	public int changeSecurityQuestion(int id, String sq)
	{
		return this.userdao.changeSecurityQuestion(id, sq);
	}
	
	public int changeSecurityAnswer(int id, String ans)
	{
		return this.userdao.changeSecurityAnswer(id, ans);
	}
	
	public int changeMobileNumber(int id, long num)
	{
		return this.userdao.changeMobileNumber(id, num);
	}
	
	public List<User> viewAllCustomer()
	{
		return this.userdao.viewAllCustomer();
	}
	
	public int addAddress(int id, Address address)
	{
		return this.userdao.addAddress(id, address);
	}
	
	public Address getAddress(int id)
	{
		return this.userdao.getAddress(id);
	}
	
	public int changeAddress(Address address)
	{
		return this.userdao.changeAddress(address);
	}
	
}