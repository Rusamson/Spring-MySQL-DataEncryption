package com.samson.dao;

import java.util.List; 
 
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.samson.model.User; 

@Repository
public class UserDAOImpl implements UserDao{
	
	private static final Logger logger = LoggerFactory.getLogger(UserDAOImpl.class);

	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sf){
		this.sessionFactory = sf;
	}

	@Override
	public void add(User u) {
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(u);
		logger.info("User saved successfully, User Details="+u);	
	}

	@Override
	public void update(User u) {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(u);
		logger.info("User updated successfully, User Details="+u);
		
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<User> getAll() {
		Session session = this.sessionFactory.getCurrentSession();
		List<User> usersList = session.createQuery("from User").list();
		for(User u : usersList){
			logger.info("Users List::"+u);
		}
		return usersList;
	}
	@Override
	public User getByEmail(String email) {
		 Session session = this.sessionFactory.getCurrentSession();	 
		 User u = (User) session.createQuery("from User where email = :email")
				 .setParameter("email", email)
				 .uniqueResult(); 
		return u;
	}
	@Override
	public User getById(int id) {
		Session session = this.sessionFactory.getCurrentSession();		
		User u = (User) session.load(User.class, new Integer(id));
		logger.info("User loaded successfully, User details="+u);
		return u;
	}

	@Override
	public void remove(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		User u = (User) session.load(User.class, new Integer(id));
		if(null != u){
			session.delete(u);
		}
		logger.info("User deleted successfully, User details="+u);
		
	}

}
