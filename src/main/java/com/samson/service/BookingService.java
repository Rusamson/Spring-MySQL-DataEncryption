package com.samson.service;

import java.util.List;

import com.samson.model.Booking; 

public interface BookingService {
	public void add(Booking b);
	public void update(Booking b);
	public List<Booking> getAll();
	public Booking getById(int id);
	public void remove(int id); 
	public List<Booking> getAllByUserId(int userID);
	public List<?> getAllByUserCountry(String country); 
}
