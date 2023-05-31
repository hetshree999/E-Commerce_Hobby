package com.hobbies.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.hobbies.model.Address;
import com.hobbies.model.Product;
import com.hobbies.model.User;

@Repository
public class UserDAO {
	
	@Autowired
	private HibernateTemplate hibernateTemplate;
	
	@Transactional
	public int saveUser(User user)
	{
		 int id= (Integer)this.hibernateTemplate.save(user);
		 return id;
	}
	
	@SuppressWarnings({ "deprecation", "unchecked" })
	public int checkLogin(String email, String pwd)
	{
		Session session = hibernateTemplate.getSessionFactory().openSession();
		Criteria criteria = session.createCriteria(User.class);
		criteria.add(Restrictions.eq("email", email));
		criteria.add(Restrictions.eq("password", pwd));
		List<User> listUser = criteria.list();
		
		if(pwd != "" && email != "" && listUser !=null && listUser.size() > 0)
		{
			return 1;
		}
		return 0;
	}
	
	@SuppressWarnings({ "deprecation", "unchecked" })
	public int checkEmail(String email)
	{
		Session session = hibernateTemplate.getSessionFactory().openSession();
		Criteria criteria = session.createCriteria(User.class);
		criteria.add(Restrictions.eq("email", email));
		List <User> listUser = criteria.list();
		
		if(listUser != null && listUser.size()>0)
			return 1;
		return 0;
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
	
	@SuppressWarnings("unchecked")
	public User selectUserWhereEmail(String email)
	{
		Session session = hibernateTemplate.getSessionFactory().openSession();
		Query<User> query = session.createQuery("from User where email =: e");
		query.setParameter("e", email);
		List<User> list = query.list();
		String email1 = list.get(0).getEmail();
		String name = list.get(0).getName();
		int id= list.get(0).getId();
		User user = new User();
		user.setEmail(email1);
		user.setName(name);
		user.setId(id);
		session.close();
		return user;
	}
	
	@SuppressWarnings("unchecked")
	@Transactional
	public User selectUserWhereId(int id)
	{
		Session session = hibernateTemplate.getSessionFactory().openSession();
		Query<User> query = session.createQuery("from User where id =: i");
		query.setParameter("i", id);
		List<User> list = query.list();
		int id1 = list.get(0).getId();
		String email = list.get(0).getEmail();
		String name = list.get(0).getName();
		long mobile = list.get(0).getMobileNumber();
		String sq = list.get(0).getSecurityQuestion();
		String pass = list.get(0).getPassword();
		User user = new User();
		user.setId(id1);
		user.setEmail(email);
		user.setName(name);
		user.setMobileNo(mobile);
		user.setSecurityQuestion(sq);
		user.setPassword(pass);
		session.save(user);
		session.close();
		return user;
	}
	@SuppressWarnings("unchecked")
	@Transactional
	public int changePassword(int id, String pwd)
	{
		Session session = hibernateTemplate.getSessionFactory().openSession();
		Transaction tx = session.beginTransaction();
		Query<User> query = session.createQuery("update User set password=:n where id=:i");
		query.setParameter("n", pwd);
		query.setParameter("i", id);
		query.executeUpdate();
		tx.commit();
		session.close();
		return 1;
	}
	
	@SuppressWarnings("unchecked")
	@Transactional 
	public int changeSecurityQuestion(int id, String squestion)
	{
		Session session = hibernateTemplate.getSessionFactory().openSession();
		Transaction tx = session.beginTransaction();
		Query<User> query = session.createQuery("update User set securityQuestion=:n where id=:i");
		query.setParameter("n", squestion);
		query.setParameter("i", id);
		query.executeUpdate();
		tx.commit();
		session.close();
		return 1;
	}
	
	@SuppressWarnings("unchecked")
	@Transactional 
	public int changeSecurityAnswer(int id, String ans)
	{
		Session session = hibernateTemplate.getSessionFactory().openSession();
		Transaction tx = session.beginTransaction();
		Query<User> query = session.createQuery("update User set answer=:a where id=:i");
		query.setParameter("a", ans);
		query.setParameter("i", id);
		query.executeUpdate();
		tx.commit();
		session.close();
		return 1;
	}
	
	@SuppressWarnings("unchecked")
	@Transactional 
	public int changeMobileNumber(int id, long no)
	{
		Session session = hibernateTemplate.getSessionFactory().openSession();
		Transaction tx = session.beginTransaction();
		Query<User> query = session.createQuery("update User set mobileNumber=:n where id=:i");
		query.setParameter("n", no);
		query.setParameter("i", id);
		query.executeUpdate();
		tx.commit();
		session.close();
		return 1;
	}
	
	@SuppressWarnings("unchecked")
	public List<User> viewAllCustomer()
	{
		Session session = hibernateTemplate.getSessionFactory().openSession();
		Query<User> query = session.createQuery("from User");

		List<User> list = query.list();
		session.close();
		return list;
	}
	
	@SuppressWarnings("unchecked")
	public Address getAddressById(int id)
	{
		Session session = hibernateTemplate.getSessionFactory().openSession();
		Query<Address> query = session.createNamedQuery("from Address where addressId=:i");
		query.setParameter("i", id);
		List<Address> list = query.list();
		Address address = list.get(0);
		return address;
	}
	
	public int addAddress(int id, Address address)
	{
		Session session = hibernateTemplate.getSessionFactory().openSession();
		User user = session.get(User.class, id);
		user.setAddress(address);
		Transaction tx = session.beginTransaction();
		session.save(user);
		tx.commit();
		session.close();
		return 1;
	}
	
	public Address getAddress(int id)
	{
		Session session = hibernateTemplate.getSessionFactory().openSession();
		User user = session.get(User.class, id);
		Address add = user.getAddress();
		return add;
	}
	
	@Transactional
	public int changeAddress(Address address)
	{
		this.hibernateTemplate.saveOrUpdate(address);
		return 1;
	}
	
}