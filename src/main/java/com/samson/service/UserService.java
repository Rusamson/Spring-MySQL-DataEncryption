package com.samson.service;

import java.util.List;

import com.samson.model.User;

public interface UserService{
	public void add(User u);
	public void update(User u);
	public List<User> getAll();
	public User getById(int id);
	public void remove(int id); 
	public User registerUser(String email, String password); 
}
