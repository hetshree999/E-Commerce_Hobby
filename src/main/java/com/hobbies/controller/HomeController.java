package com.hobbies.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.text.DateFormat;  
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.hobbies.model.Address;
import com.hobbies.model.AdminCart;
import com.hobbies.model.Cart;
import com.hobbies.model.Product;
import com.hobbies.model.User;
import com.hobbies.service.adminCartService;
import com.hobbies.service.cartService;
import com.hobbies.service.productService;
import com.hobbies.service.userService;


@Controller
public class HomeController {

	private int loggedUserId = -1;

	public int getLoggedUserId() {
		return loggedUserId;
	}

	public void setLoggedUserId(int loggedUserId) {
		this.loggedUserId = loggedUserId;
	}

	@RequestMapping("/login")
	public String login() {
		return "login";
	}

	@RequestMapping("/signup")
	public String signup() {
		return "signup";
	}

	@Autowired
	private userService UserService;
	
	@Autowired
	private cartService CartService;
	
	@Autowired
	private adminCartService AdminCartService;
	
	@Autowired
	private productService ProductService;

	@RequestMapping(path = "/saveuser", method = RequestMethod.POST)
	public String saveuser(@ModelAttribute User user, Model m) {
//		System.out.println(user);
		String email = user.getEmail();
		if (this.UserService.checkUserEmail(email) == 1) {
			String error = "Invalid";
			m.addAttribute("msg", error);
			return "signup";
		} else {
			int craetedUser = this.UserService.createUser(user);
			System.out.println(craetedUser);
			return "login";
		}
	}

	@RequestMapping(path = "/loginAction", method = RequestMethod.POST)
	public String loginAction(@RequestParam(name = "email") String email, @RequestParam(name = "password") String pwd,
			Model m) {
		if ("admin@gmail.com".equals(email) && "admin".equals(pwd)) {
			return "adminHome";
		}
		int exist = this.UserService.checkUserLogin(email, pwd);
		if (exist == 1) {
			User user = this.UserService.selectUserWhereEmail(email);
			System.out.println(user);
			this.setLoggedUserId(user.getId());
			m.addAttribute("email", email);
			return "redirect:home";
		} else {
			String error = "Invalid";
			m.addAttribute("msg", error);
			return "login";
		}
	}

	@RequestMapping("/addNewProduct")
	public String addNewProduct() {
		return "addNewProduct";
	}

	@RequestMapping("/home")
	public String home(@ModelAttribute Product product, Model m) {
		int id = this.getLoggedUserId();
		if (loggedUserId == -1) {
			return "login";
		} else {
			User user = this.UserService.selectUserWhereId(id);
			String email = user.getEmail();
			m.addAttribute("email", email);
			List<Product> products = this.UserService.allProduct();
			if (products.size() != 0) {
				m.addAttribute("product", products);
				m.addAttribute("msg", "Valid");
				return "home";
			} else {
				m.addAttribute("msg", "Invalid");
				return "home";
			}
		}
	}

	@RequestMapping("/error")
	public String error() {
		return "error";
	}

	@RequestMapping("/changeDetails")
	public String changeDetails(Model m) {
		int id = this.getLoggedUserId();
		if (loggedUserId == -1) {
			return "login";
		} else {
		User user = this.UserService.selectUserWhereId(id);
		m.addAttribute("user", user);
		return "changeDetails";
		}
	}

	@RequestMapping("/askForAddress")
	public String askForAddress() {
		if (loggedUserId == -1) {
			return "login";
		} else {
		return "askForAddress";
		}
	}
	
	@RequestMapping("/addChangeAddress")
	public String addChangeAddress(Model m) {
		int id = this.getLoggedUserId();
		Address address = this.UserService.getAddress(id);
		if(address !=null)
		{
			m.addAttribute("msg", "yes");
			m.addAttribute("address", address);
		}
		return "addChangeAddress";
	}
	
	@RequestMapping("/addChangeAddressAction")
	public String addChangeAddressAction(@ModelAttribute Address address, Model m)
	{
		int id = this.getLoggedUserId();
//		User user = this.UserService.selectUserWhereId(id);
		this.UserService.addAddress(id, address);
		Address addd = this.UserService.getAddress(id);
		System.out.println(addd);
//		int add_id = addd.getAddressId();
		m.addAttribute("msg", "yes");
//		m.addAttribute("msg", "not added");
		return "addChangeAddress";
	}
	
	@RequestMapping("/changeAddress")
	public String changeAddress(Model m)
	{
		Address address = this.UserService.getAddress(loggedUserId);
		if(address !=null)
		{
			m.addAttribute("msg", "yes");
			m.addAttribute("address", address);
			return "changeAddress";
		}
		else
		{
			m.addAttribute("msg", "no");
			return "addChangeAddress";
		}
	}
	
	@RequestMapping("/changeAddressAction")
	public String chageAddressAction(@ModelAttribute Address address, Model m, @RequestParam("addressId") int id)
	{
		this.UserService.changeAddress(address);
		m.addAttribute("msg", "updated");
		return "changeAddress";
	}
	
	@RequestMapping("/changePassword")
	public String changePassword() {
		return "changePassword";
	}

	@RequestMapping(path = "/changePasswordAction", method = RequestMethod.POST)
	public String changePasswordAction(@RequestParam("oldPassword") String op, @RequestParam("newPassword") String np,
			@RequestParam("confirmPassword") String cp, Model m) {
		int id = this.getLoggedUserId();
		User user = this.UserService.selectUserWhereId(id);
		String passw = user.getPassword();
		if (op.equals(passw) && cp.equals(np)) {
			this.UserService.changePassword(id, np);
			m.addAttribute("msg", "valid");
			return "changePassword";
		} else if (!(cp.equals(np))) {
			m.addAttribute("msg", "notMatch");
			return "changePassword";
		} else if (!(op.equals(passw))) {
			m.addAttribute("msg", "same");
			return "changePassword";
		} else {
			m.addAttribute("msg", "Invalid");
			return "changePassword";
		}
	}

	@RequestMapping("changeSecurityQuestion")
	public String changeSecurityQuestion() {
		return "changeSecurityQuestion";
	}

	@RequestMapping(path = "changeSecurityQuestionAction", method = RequestMethod.POST)
	public String changeSecurityQuestionAction(@RequestParam("securityQuestion") String sq,
			@RequestParam("newAnswer") String na, @RequestParam("password") String pwd, Model m) {
		int id = this.getLoggedUserId();
		User user = this.UserService.selectUserWhereId(id);
		String passw = user.getPassword();
		if (passw.equals(pwd)) {
			this.UserService.changeSecurityQuestion(id, sq);
			this.UserService.changeSecurityAnswer(id, na);
			m.addAttribute("msg", "Valid");
			return "changeSecurityQuestion";
		} else {
			m.addAttribute("msg", "Invalid");
			return "changeSecurityQuestion";
		}
	}

	@RequestMapping("/changeMobileNumber")
	public String changeMobileNumber() {
		return "changeMobileNumber";
	}

	@RequestMapping(path = "/changeMobileNumberAction", method = RequestMethod.POST)
	public String changeMobileNumberAction(@RequestParam("mobileNumber") long mNo, @RequestParam("password") String pwd,
			Model m) {
		int id = this.getLoggedUserId();
		User user = this.UserService.selectUserWhereId(id);
		String passw = user.getPassword();
		if (passw.equals(pwd)) {
			this.UserService.changeMobileNumber(id, mNo);
			m.addAttribute("msg", "valid");
			return "changeMobileNumber";
		} else {
			m.addAttribute("msg", "Invalid");
			return "changeMobileNumber";
		}
	}
	
	public double getGrandTotal(List<Cart> cartList)
	{
		double grandTotal = 0;
		int count = 0;
		while(count<cartList.size())
		{
			grandTotal = grandTotal + (cartList.get(count).getQuantity() * cartList.get(count).getPrice());
			count++;
		}
		return grandTotal;
	}
	
	@RequestMapping("/myCart")
	public String myCart(Model m)
	{
		User user = this.UserService.selectUserWhereId(loggedUserId);
		String email = user.getEmail();
		List<Cart> cartItem = this.CartService.getCartItems(email);
		if(cartItem.size() != 0)
		{
			m.addAttribute("cartItem", cartItem);
			double grandTotal = this.getGrandTotal(cartItem);
			m.addAttribute("grandTotal", grandTotal);
			m.addAttribute("msg", "Valid");
			return "myCart";
		}
		else
		{
			return "myCart";
		}
	}
	
	@RequestMapping("/addToCartAction/{id}")
	public String addToCartAction(@PathVariable("id") int id, Model m)
	{
		
		Product product = this.ProductService.getProduct(id);
		User user = this.UserService.selectUserWhereId(loggedUserId);
		String email = user.getEmail();
		List<Cart> item = this.CartService.getCartItems(email);
		Cart cartItem = new Cart();
		cartItem.setProductid(product.getId());
		cartItem.setEmail(email);
		cartItem.setQuantity(1);
		int quan = 1;
		cartItem.setPrice(product.getPrice());
		cartItem.setProductName(product.getName());
		cartItem.setTotal((product.getPrice()) * quan);
		this.CartService.addItemToCart(cartItem);
		
		AdminCart acartItem = new AdminCart();
		acartItem.setProductid(product.getId());
		acartItem.setEmail(email);
		acartItem.setQuantity(1);
		int quann = 1;
		acartItem.setPrice(product.getPrice());
		acartItem.setProductName(product.getName());
		acartItem.setTotal((product.getPrice()) * quann);
		this.AdminCartService.addItemToAdminCart(acartItem);
		
		m.addAttribute("msg", "added");
		return "home";
	}
	
	@RequestMapping("/incQuantityAction/{id}")
	public String incQuantityAction(@PathVariable("id") int id, Model m)
	{
		User user = this.UserService.selectUserWhereId(loggedUserId);
		String email = user.getEmail();
		Cart cartItem = this.CartService.getItemByProductId(id, email);
		int q = cartItem.getQuantity();
		System.out.println(q);
		cartItem.setQuantity(q+1);
		int cart_id = cartItem.getCartItemId();
		int idd = this.CartService.updateCartItemByP(id, (q+1), email);
		System.out.println(idd);
		this.AdminCartService.updateAdminCartItemByP(id, q+1, email);
		m.addAttribute("msg", "inc");
		return "myCart";
	}
	
	@RequestMapping("/decQuantityAction/{id}")
	public String decQuantityAction(@PathVariable("id") int id, Model m)
	{
		User user = this.UserService.selectUserWhereId(loggedUserId);
		String email = user.getEmail();
		Cart cartItem = this.CartService.getItemByProductId(id, email);
		int q = cartItem.getQuantity();
		if(q!=1)
		{
			cartItem.setQuantity(q-1);
			int cart_id = cartItem.getCartItemId();
			this.CartService.updateCartItemByP(id, (q-1), email);
			this.AdminCartService.updateAdminCartItemByP(id, q-1, email);
			m.addAttribute("msg", "dec");
			return "myCart";
		}
		else
		{
			m.addAttribute("msg", "last");
			return "myCart";
		}
	}
	
	@RequestMapping("/removeFromCart/{id}")
	public String removeFromCart(@PathVariable("id") int id, Model m)
	{
		User user = this.UserService.selectUserWhereId(loggedUserId);
		String email = user.getEmail();
		this.CartService.deleteFromCart(id);
		this.AdminCartService.deleteFromAdminCart(id, email);
		return "myCart";
	}
	
	
	@RequestMapping("/about")
	public String about() {
		return "about";
	}

	@RequestMapping("/logout")
	public String logout() {
		this.setLoggedUserId(-1);
		return "login";
	}
	
	@RequestMapping("/addressPaymentForOrder")
	public String addressPaymentForOrder(Model m)
	{
		User user = this.UserService.selectUserWhereId(loggedUserId);
		String email = user.getEmail();
		long mNo = user.getMobileNumber();
		m.addAttribute("mNo", mNo);
		List<Cart> list = this.CartService.getCartItems(email);
		m.addAttribute("list", list);
		double grandTotal = this.getGrandTotal(list);
		m.addAttribute("grandTotal", grandTotal);
		Address address = this.UserService.getAddress(loggedUserId);
		if(address != null)
		{
			m.addAttribute("msg", "address");
			m.addAttribute("address", address);
		}
		return "addressPaymentForOrder";
	}
	
	@RequestMapping("/addressPaymentForOrderAction")
	public String addressPaymentForOrderAction(@ModelAttribute Address address, Model m)
	{
		User user = this.UserService.selectUserWhereId(loggedUserId);
		m.addAttribute("user", user);
		m.addAttribute("address", address);
		String email = user.getEmail();
		List<Cart> ItemList = this.CartService.getCartItems(email);
		List<AdminCart> aList = this.AdminCartService.getAdminCartItems(email);
		System.out.println(aList.size());
		for(Cart c : ItemList)
		{
			c.setStatus("bill");
			this.CartService.updateCartItemStatus(c.getCartItemId(), "bill");
		}
		for(AdminCart c: aList)
		{
			Date currentDate = new Date();
			Calendar c1 = Calendar.getInstance();
			c1.setTime(currentDate); 
			Date currentDate1 = c1.getTime();
			c1.add(Calendar.DATE, 7);
			Date currentDatePlusSeven = c1.getTime();
			this.AdminCartService.updateAdminCartDate(c.getCartItemId(), new Date().toString(), currentDatePlusSeven.toString());
			c.setStatus("bill");
			this.AdminCartService.updateAdminCartItemStatus(c.getCartItemId(), "bill");
		}
		List<Cart> orderItem = this.CartService.getCartItemsByBill(email, "bill");
		System.out.println(orderItem.size());
		m.addAttribute("orderItem", orderItem);
		double grandTotal = this.getGrandTotal(orderItem);
		m.addAttribute("grandTotal", grandTotal);
		List<Integer> p_id = new ArrayList<Integer>();
		for(Cart c : orderItem)
		{
			int id = c.getProductid();
			p_id.add(id);
		}
		this.CartService.deleteFromCartEmail(email);
		return "bill";
	}
	
	@RequestMapping("/continueShopping")
	public String continueShopping()
	{
		return "redirect:home";
	}
	
	@RequestMapping("/myOrders")
	public String myOrders(Model m)
	{
		User user = this.UserService.selectUserWhereId(loggedUserId);
		String email = user.getEmail();
		List<AdminCart> acart = this.AdminCartService.getAdminCartItems(email);
		m.addAttribute("acart", acart);
		return "myOrders";
	}
	
	@RequestMapping("/forgotPassword")
	public String forgotPassword()
	{
		return "forgotPassword";
	}
}
