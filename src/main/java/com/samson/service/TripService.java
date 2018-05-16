package com.samson.service;

import java.util.List;

import com.samson.model.Trip; 

public interface TripService {
	public void add(Trip u, int BookingID);
	public void update(Trip u);
	public List<Trip> getAll();
	public Trip getById(int id);
	public void remove(int id); 
	public List<?> getAllByDriver(int userID);
}
