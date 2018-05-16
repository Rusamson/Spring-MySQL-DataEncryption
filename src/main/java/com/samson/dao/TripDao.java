package com.samson.dao;

import java.util.List;

import com.samson.model.Trip;

public interface TripDao {
	public void add(Trip t);
	public void update(Trip t);
	public List<Trip> getAll();
	public Trip getById(int id);
	public void remove(int id);
	public List<?> getAllByDriver(int userID);
}
