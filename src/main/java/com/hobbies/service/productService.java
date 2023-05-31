package com.hobbies.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hobbies.dao.ProductDAO;
import com.hobbies.model.Product;

@Service
public class productService {
	
	@Autowired
	private ProductDAO productdao;
	
	public int createProduct(Product product)
	{
		return this.productdao.saveProduct(product);
	}
	
	public List<Product> allProduct()
	{
		return this.productdao.selectAllProduct();
	}
	
	public int deleteProduct(int pid)
	{
		return this.productdao.deleteProduct(pid);
	}
	
	public Product getProduct(int id)
	{
		return this.productdao.getProduct(id);
	}
	
}
