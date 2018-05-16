package com.samson.dao;

import java.util.List;

import com.samson.model.Booking; 

public interface BookingDao{
	public void add(Booking b);
	public void update(Booking b);
	public List<Booking> getAll();
	public Booking getById(int id);
	public void remove(int id);
	public List<Booking> getAllByUserId(int userID);
	public List<?> getAllByUserCountry(String country);
	public void changeStatus(int bookingID, int status);
}
