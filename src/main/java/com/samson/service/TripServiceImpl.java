package com.samson.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.samson.dao.BookingDao;
import com.samson.dao.TripDao; 
import com.samson.model.Trip; 

@Service
@Transactional
public class TripServiceImpl implements TripService {
	
	@Autowired
	private TripDao tripDao;
	private BookingDao bookingDao; 
  
	public void setTripDao(TripDao tripDao) {
		this.tripDao = tripDao;
	}
	public void setBookingDao(BookingDao bookingDao) {
		this.bookingDao= bookingDao;
	}
	@Override
	@Transactional
	public void add(Trip t, int bookingId) { 
	this.tripDao.add(t); 
	this.bookingDao.changeStatus(bookingId, 1);
	}

	@Override
	@Transactional
	public void update(Trip t) {
	this.tripDao.update(t);
	}

	@Override
	@Transactional
	public List<Trip> getAll() { 
		return this.tripDao.getAll();
	}
	@Override
	@Transactional
	public List<?> getAllByDriver(int userID) { 
		return this.tripDao.getAllByDriver(userID);
	}
	@Override
	@Transactional
	public Trip getById(int id) { 
		return this.tripDao.getById(id);
	}

	@Override
	@Transactional
	public void remove(int id) {
	this.tripDao.remove(id);
	} 
}