package com.samson.dao;

import java.util.List;

import com.samson.model.User;

public interface UserDao {
	public void add(User u);
	public void update(User u);
	public List<User> getAll();
	public User getById(int id);
	public User getByEmail(String email);
	public void remove(int id);
}
