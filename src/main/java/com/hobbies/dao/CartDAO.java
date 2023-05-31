package com.hobbies.dao;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.hobbies.model.Cart;

@Repository
public class CartDAO {
	@Autowired
	private HibernateTemplate hibernateTemplate;

	@Transactional
	public int addItemToCart(Cart cartItem) {
		this.hibernateTemplate.save(cartItem);
		return 1;
	}

	@SuppressWarnings("unchecked")
	public List<Cart> getCartItems(String email) {
		Session session = hibernateTemplate.getSessionFactory().openSession();
		Query<Cart> query = session.createQuery("from Cart where email=:e and status=:n");
		query.setParameter("e", email);
		query.setParameter("n", "np");
		List<Cart> list = query.list();
		session.close();
		return list;
	}
	
//	@SuppressWarnings("unchecked")
//	public List<Cart> getCartItemsByStatus(String email) {
//		Session session = hibernateTemplate.getSessionFactory().openSession();
//		Query<Cart> query = session.createQuery("from Cart where email=:e and status=:n");
//		query.setParameter("e", email);
//		query.setParameter("n", "bill");
//		List<Cart> list = query.list();
//		session.close();
//		return list;
//	}

	/*
	 * @Transactional public int incDecQuantityAction(int id) { Session session =
	 * hibernateTemplate.getSessionFactory().openSession(); Transaction tx =
	 * session.beginTransaction(); Query <Cart> query = session.
	 * createQuery("update Cart set quantity=quantity+1 where cartItemId=:i ")
	 * return 1; }
	 */

	@SuppressWarnings("unchecked")
	@Transactional
	public int deleteFromCart(int id) {
		Session session = hibernateTemplate.getSessionFactory().openSession();
		Transaction tx = session.beginTransaction();
		Query<Cart> query = session.createQuery("delete from Cart where cartItemId=:i");
		query.setParameter("i", id);
		int status = query.executeUpdate();
		System.out.println(status);
		tx.commit();
		session.close();
		return 1;
	}
	
	@SuppressWarnings("unchecked")
	@Transactional
	public int deleteFromCartEmail(String email) {
		Session session = hibernateTemplate.getSessionFactory().openSession();
		Transaction tx = session.beginTransaction();
		Query<Cart> query = session.createQuery("delete from Cart where email=:i");
		query.setParameter("i", email);
		int status = query.executeUpdate();
		System.out.println(status);
		tx.commit();
		session.close();
		return 1;
	}

	@SuppressWarnings("unchecked")
	public Cart getItemByProductId(int id, String email) {
		Session session = this.hibernateTemplate.getSessionFactory().openSession();
		Query<Cart> query = session.createQuery("from Cart where productid=:i and email=:e");
		query.setParameter("i", id);
		query.setParameter("e", email);
		List<Cart> list = query.list();
		Cart cart = list.get(0);
		return cart;
	}

	@SuppressWarnings("unchecked")
	@Transactional
	public int updateCartItem(int id, int q, String email) {
		Session session = this.hibernateTemplate.getSessionFactory().openSession();
		Transaction tx = session.beginTransaction();
		Query<Cart> query = session.createQuery("update Cart set quantity=:qua where cartItemId=:i and email=:e");
		query.setParameter("qua", q);
		query.setParameter("i", id);
		query.setParameter("e", email);
		query.executeUpdate();
		tx.commit();
		session.close();
		return 1;
	}
	
	@SuppressWarnings("unchecked")
	@Transactional
	public int updateCartItemByP(int id, int q, String email) {
		Session session = this.hibernateTemplate.getSessionFactory().openSession();
		Transaction tx = session.beginTransaction();
		Query<Cart> query = session.createQuery("update Cart set quantity=:qua where productid=:i and email=:e");
		query.setParameter("qua", q);
		query.setParameter("i", id);
		query.setParameter("e", email);
		query.executeUpdate();
		tx.commit();
		session.close();
		return 1;
	}
	
	@SuppressWarnings("unchecked")
	@Transactional
	public int updateCartItemStatus(int id, String status) {
		Session session = this.hibernateTemplate.getSessionFactory().openSession();
		Transaction tx = session.beginTransaction();
		Query<Cart> query = session.createQuery("update Cart set status=:s where cartItemId=:i");
		query.setParameter("s", status);
		query.setParameter("i", id);
		query.executeUpdate();
		tx.commit();
		session.close();
		return 1;
	}
	
	@SuppressWarnings("unchecked")
	public List<Cart> getCartItemsByBill(String email, String status)
	{
		Session session = hibernateTemplate.getSessionFactory().openSession();
		Query<Cart> query = session.createQuery("from Cart where email=:e AND status=:s");
		query.setParameter("e", email);
		query.setParameter("s", status);
		List<Cart> list = query.list();
		session.close();
		return list;
	}
	
	
	@SuppressWarnings("rawtypes")
	@Transactional
	public int addIntoOrder(List < Integer > pid, String email) {
	    Session session = this.hibernateTemplate.getSessionFactory().openSession();
	    Transaction tx = session.beginTransaction();
	    for (Integer i: pid) {
	        DateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd hh:mm:ss");
	        Date currentDate = new Date();
	        Calendar c = Calendar.getInstance();
	        c.setTime(currentDate);
	        Date currentDate1 = c.getTime();
	        String currentDateStr = dateFormat.format(currentDate1);
	        c.add(Calendar.DATE, 7);
	        Date currentDatePlusSeven = c.getTime();
	        String currentDatePlusSevenStr = dateFormat.format(currentDatePlusSeven);  
	        Query query = session.createQuery("insert into Order(productid, email, orderDate,deliverDate , status) select :productid, :email, :orderDate, :deliverDate, :status from Oorder2");
	        query.setParameter("a", i);
	        query.setParameter("b", email);
	        query.setParameter("c", currentDateStr);
	        query.setParameter("d", currentDatePlusSevenStr);
	        query.setParameter("e", "billed");
	        query.executeUpdate();
	    }
	    tx.commit();
	    session.close();
	    return 1;
	}

}
