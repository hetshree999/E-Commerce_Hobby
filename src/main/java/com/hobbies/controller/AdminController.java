package com.hobbies.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.hobbies.model.AdminCart;
import com.hobbies.model.Product;
import com.hobbies.model.User;
import com.hobbies.service.adminCartService;
import com.hobbies.service.productService;
import com.hobbies.service.userService;

@Controller
public class AdminController {
	
	@Autowired
	private productService ProductService;
	
	@Autowired
	private userService UserService;
	
	@Autowired
	private adminCartService AdminCartService;
	
	@RequestMapping(path="/addNewProductAction", method=RequestMethod.POST)
	public String addNewProductAction(@ModelAttribute Product product, Model m)
	{
		int createdProduct = this.ProductService.createProduct(product);
		System.out.println(createdProduct);
		m.addAttribute("msg", "Valid");
		return "addNewProduct";
	}
	
	@RequestMapping("/allProductEditProduct")
	public String addProductEditProduct(@ModelAttribute Product product, Model m)
	{
		List<Product> products = this.ProductService.allProduct();
		if(products.size()!=0)
		{
			m.addAttribute("product", products);
			m.addAttribute("msg", "Valid");
			return "allProductEditProduct";
		}
		else
		{
			m.addAttribute("msg", "Invalid");
			return "allProductEditProduct";
		}
	}
	
	@RequestMapping("/deleteProduct")
	public String deleteProduct(@RequestParam("id") int id, Model m)
	{
		int deletedProduct = this.ProductService.deleteProduct(id);
		System.out.println(deletedProduct);
		return "redirect:allProductEditProduct";
	}
	
	@RequestMapping("/editProduct/{id}")
	public String editProduct(@PathVariable("id") int id, Model m)
	{
		Product product = this.ProductService.getProduct(id);
		m.addAttribute("product", product);
		return "editProduct";
	}
	
	@RequestMapping(path="/editProductAction", method=RequestMethod.POST)
	public String editProductAction(@ModelAttribute Product product, Model m)
	{
		System.out.println(product);
		return "editProduct";
	}
	
	@RequestMapping("/viewAllCustomers")
	public String viewAllCustomers(Model m) {
		List<User> u = this.UserService.viewAllCustomer();
		if (u.size() > 0) {
			m.addAttribute("msg", "valid");
			m.addAttribute("user", u);
			return "viewAllCustomers";
		} else {
			m.addAttribute("msg", "noUser");
			return "viewAllCustomers";
		}
	}
	
	@RequestMapping("/ordersReceived")
	public String ordersReceived(Model m)
	{
		List<AdminCart> alist = this.AdminCartService.getAllProductsBill();
		m.addAttribute("alist", alist);
		System.out.println(alist.size());
		return "ordersReceived";
	}
	
}
