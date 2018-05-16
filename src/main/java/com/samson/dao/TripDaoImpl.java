package com.samson.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

 

import com.samson.model.Trip;

@Repository
public class TripDaoImpl implements TripDao{
	
	private static final Logger logger = LoggerFactory.getLogger(TripDaoImpl.class);

	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sf){
		this.sessionFactory = sf;
	}

	@Override
	public void add(Trip t) {
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(t);
		logger.info("Trip saved successfully, Trip Details="+t);	
	}

	@Override
	public void update(Trip t) {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(t);
		logger.info("Trip updated successfully, Trip Details="+t);
		
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<Trip> getAll() {
		Session session = this.sessionFactory.getCurrentSession();
		List<Trip> tripsList = session.createQuery("from Trip").list();
		for(Trip t : tripsList){
			logger.info("Trips List::"+t);
		}
		return tripsList;
	}
 
	@Override
	public List<?> getAllByDriver(int userID) {
		Session session = this.sessionFactory.getCurrentSession(); 
		//String hql = "from User as use, Booking as book";
	    String hql = "from Trip as trip, Booking as book where trip.bookingID = book.id and trip.driverID ="+userID;
		  
		List<?> list = session.createQuery(hql).list();  
		return list;
	}
	@Override
	public Trip getById(int id) {
		Session session = this.sessionFactory.getCurrentSession();		
		Trip t = (Trip) session.load(Trip.class, new Integer(id));
		logger.info("Trip loaded successfully, Trip details="+t);
		return t;
	}

	@Override
	public void remove(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		Trip t = (Trip) session.load(Trip.class, new Integer(id));
		if(null != t){
			session.delete(t);
		}
		logger.info("Trip deleted successfully, Trip details="+t);
		
	}

}