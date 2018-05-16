package com.samson.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.samson.model.Booking;   

@Repository
public class BookingDaoImpl implements BookingDao{
	
	private static final Logger logger = LoggerFactory.getLogger(BookingDaoImpl.class);

	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sf){
		this.sessionFactory = sf;
	}

	@Override
	public void add(Booking b) {
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(b);
		logger.info("Booking saved successfully, Booking Details="+b);	
	}

	@Override
	public void update(Booking b) {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(b);
		logger.info("Booking updated successfully, Booking Details="+b);
		
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<Booking> getAll() {
		Session session = this.sessionFactory.getCurrentSession();
		List<Booking> bookingsList = session.createQuery("from Booking").list();
		for(Booking b : bookingsList){
			logger.info("Users List::"+b);
		}
		return bookingsList;
	}

	@Override
	public Booking getById(int id) {
		Session session = this.sessionFactory.getCurrentSession();		
		Booking b = (Booking) session.load(Booking.class, new Integer(id));
		logger.info("Booking loaded successfully, Booking details="+b);
		return b;
	}

	@Override
	public void remove(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		Booking b = (Booking) session.load(Booking.class, new Integer(id));
		if(null != b){
			session.delete(b);
		}
		logger.info("Booking deleted successfully, Booking details="+b);
		
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<Booking> getAllByUserId(int userID) {
		Session session = this.sessionFactory.getCurrentSession();	  
	    List<Booking> bookingsList = session.createQuery("from Booking where userID = :userID")
				 			 	 .setParameter("userID", userID)
				 			 	 .list();  
		return bookingsList;
	} 
	@Override
	public List<?> getAllByUserCountry(String country) {
		//http://www.mkyong.com/hibernate/hibernate-one-to-many-relationship-example-annotation/
		Session session = this.sessionFactory.getCurrentSession();	  
		//String hql = "from User as use, Booking as book";
	   String hql = "from User as use, Booking as book where use.userID = book.userID";
		  
		List<?> list = session.createQuery(hql).list();  
		return list;
	}
	@Override
	public void changeStatus(int bookingID, int status) {
		Session session = this.sessionFactory.getCurrentSession();		
		Booking b = (Booking) session.load(Booking.class, new Integer(bookingID));
		b.setStatus(status);
		session.update(b);
		logger.info("Booking Status changed");
		 
	}
}
