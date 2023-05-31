package com.hobbies.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.hobbies.model.Product;

@Repository
public class ProductDAO {
	@Autowired
	private HibernateTemplate hibernateTemplate;
	
	@Transactional
	public int saveProduct(Product product)
	{
		 this.hibernateTemplate.saveOrUpdate(product);
		 return 1;
	}
	
	@SuppressWarnings("unchecked")
	public List<Product> selectAllProduct()
	{
		Session session = hibernateTemplate.getSessionFactory().openSession();
		Query<Product> query = session.createQuery("from Product");

		List<Product> list = query.list();
		session.close();
		return list;
	}
	
	
	//delete the single product
	/*public void deleteProduct(int pid)
	{
		Product p =this.hibernateTemplate.load(Product.class, pid);
		this.hibernateTemplate.delete(p);
	}*/
	
	@SuppressWarnings("unchecked")
	@Transactional
	public int deleteProduct(int pid)
	{
		Session session = hibernateTemplate.getSessionFactory().openSession();
		Transaction tx = session.beginTransaction();
		Query<Product> query = session.createQuery("delete from Product where id=:i");
		query.setParameter("i", pid);
		int status = query.executeUpdate();
		System.out.println(status);
		tx.commit();
//		this.selectAllProduct();
		session.close();
		return 0;
	}
	
	@SuppressWarnings("unchecked")
	public Product getProduct(int id)
	{
		Session session = hibernateTemplate.getSessionFactory().openSession();
		Query<Product> query = session.createQuery("from Product where id =: e");
		query.setParameter("e", id);
		List<Product> list = query.list();
		Product p = list.get(0);
		return p;
	}
	
}
