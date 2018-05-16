package com.samson.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.samson.dao.BookingDao; 
import com.samson.model.Booking; 


@Service
@Transactional
public class BookingServiceImpl implements BookingService {
	
	@Autowired
	private BookingDao bookingDao; 
	
	public void setBookingDao(BookingDao bookingDao) {
		this.bookingDao = bookingDao;
	}
	
	@Override
	@Transactional
	public void add(Booking b) { 
	this.bookingDao.add(b);
	}

	@Override
	@Transactional
	public void update(Booking b) {
	this.bookingDao.update(b);
	}

	@Override
	@Transactional
	public List<Booking> getAll() { 
		return this.bookingDao.getAll();
	}

	@Override
	@Transactional
	public Booking getById(int id) { 
		return this.bookingDao.getById(id);
	}

	@Override
	@Transactional
	public void remove(int id) {
	this.bookingDao.remove(id);
	} 
	
	@Override
	@Transactional
	public List<Booking> getAllByUserId(int userID) { 
		return this.bookingDao.getAllByUserId(userID);
	}
	@Override
	@Transactional
	public List<?> getAllByUserCountry(String country) { 
		return this.bookingDao.getAllByUserCountry(country);
	}	
	 
}