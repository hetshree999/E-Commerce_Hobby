package com.hobbies.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.hobbies.model.AdminCart;
import com.hobbies.model.Cart;


@Repository
public class AdminCartDAO {
	@Autowired
	private HibernateTemplate hibernateTemplate;
	
	@Transactional
	public int addItemToAdminCart(AdminCart aCart)
	{
		this.hibernateTemplate.save(aCart);
		return 1;
	}
	
	public List<AdminCart> getAdminCartItems(String email)
	{
		Session session = this.hibernateTemplate.getSessionFactory().openSession();
		Query<AdminCart> query = session.createQuery("from AdminCart where email=:e ");
		query.setParameter("e", email);
		List<AdminCart> list = query.list();
		session.close();
		return list;
	}
	
	@SuppressWarnings("unchecked")
	@Transactional
	public int deleteFromAdminCart(int id, String email) {
		Session session = hibernateTemplate.getSessionFactory().openSession();
		Transaction tx = session.beginTransaction();
		Query<AdminCart> query = session.createQuery("delete from AdminCart where productid=:i and email=:e");
		query.setParameter("i", id);
		query.setParameter("e", email);
		int status = query.executeUpdate();
		System.out.println(status);
		tx.commit();
		session.close();
		return 1;
	}
	
	@SuppressWarnings("unchecked")
	@Transactional
	public int deleteFromAdminCartEmail(String email) {
		Session session = hibernateTemplate.getSessionFactory().openSession();
		Transaction tx = session.beginTransaction();
		Query<AdminCart> query = session.createQuery("delete from AdminCart where email=:i");
		query.setParameter("i", email);
		int status = query.executeUpdate();
		System.out.println(status);
		tx.commit();
		session.close();
		return 1;
	}
	
	@SuppressWarnings("unchecked")
	public AdminCart getAdminItemByProductId(int id) {
		Session session = this.hibernateTemplate.getSessionFactory().openSession();
		Query<AdminCart> query = session.createQuery("from AdminCart where productid=:i");
		query.setParameter("i", id);
		List<AdminCart> list = query.list();
		AdminCart acart = list.get(0);
		return acart;
	}
	
	@SuppressWarnings("unchecked")
	@Transactional
	public int updateAdminCartItem(int id, int q, String email) {
		Session session = this.hibernateTemplate.getSessionFactory().openSession();
		Transaction tx = session.beginTransaction();
		Query<AdminCart> query = session.createQuery("update AdminCart set quantity=:qua where cartItemId=:i and email=:e");
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
	public int updateAdminCartItemByP(int id, int q, String email) {
		Session session = this.hibernateTemplate.getSessionFactory().openSession();
		Transaction tx = session.beginTransaction();
		Query<AdminCart> query = session.createQuery("update AdminCart set quantity=:qua where productid=:i and email=:e");
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
	public int updateAdminCartItemStatus(int id, String status) {
		Session session = this.hibernateTemplate.getSessionFactory().openSession();
		Transaction tx = session.beginTransaction();
		Query<AdminCart> query = session.createQuery("update AdminCart set status=:s where cartItemId=:i");
		query.setParameter("s", status);
		query.setParameter("i", id);
		query.executeUpdate();
		tx.commit();
		session.close();
		return 1;
	}
	
	@SuppressWarnings("unchecked")
	public List<AdminCart> getAdminCartItemsByBill(String email, String status)
	{
		Session session = hibernateTemplate.getSessionFactory().openSession();
		Query<AdminCart> query = session.createQuery("from AdminCart where email=:e AND status=:s");
		query.setParameter("e", email);
		query.setParameter("s", status);
		List<AdminCart> list = query.list();
		session.close();
		return list;
	}
	
	@SuppressWarnings("unchecked")
	public List<AdminCart> getAllProductsBill()
	{
		Session session = this.hibernateTemplate.getSessionFactory().openSession();
		Query<AdminCart> query = session.createQuery("from AdminCart where status=:s");
		query.setParameter("s", "bill");
		List<AdminCart> list = query.list();
		session.close();
		return list;
	}
	
	@SuppressWarnings("unchecked")
	@Transactional
	public int updateAdminCartDate(int id, String oDate, String dDate)
	{
		Session session = this.hibernateTemplate.getSessionFactory().openSession();
		Transaction tx = session.beginTransaction();
		Query<AdminCart> query = session.createQuery("update AdminCart set orderDate=:o, deliverDate=:d where cartItemId=:i");
		query.setParameter("o", oDate);
		query.setParameter("d", dDate);
		query.setParameter("i", id);
		query.executeUpdate();
		tx.commit();
		session.close();
		return 1;
	}
	
}
