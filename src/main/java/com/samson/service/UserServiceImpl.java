package com.samson.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional; 






import com.samson.dao.UserDao;
import com.samson.model.User;

@Service
@Transactional
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserDao userDao; 
	@Autowired
	private  BCryptPasswordEncoder passwordEncoder;
	 
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}
	
	@Override
	@Transactional
	public void add(User u) { 
    u.setPassword(passwordEncoder.encode(u.getPassword()));
	this.userDao.add(u);
	}

	@Override
	@Transactional
	public void update(User u) {
	//for user info updates don t re encrypt the password except in a case of changing the password
	this.userDao.update(u);
	}

	@Override
	@Transactional
	public List<User> getAll() { 
		return this.userDao.getAll();
	}

	@Override
	@Transactional
	public User getById(int id) { 
		return this.userDao.getById(id);
	}

	@Override
	@Transactional
	public void remove(int id) {
	this.userDao.remove(id);
	} 
	
	@Override
	@Transactional
	public User registerUser(String email, String rawPassword) {  
		User u = this.userDao.getByEmail(email);  
		if(passwordEncoder.matches(rawPassword, u.getPassword())){
			return u;
		}else{
			return null;
		} 
	} 
}
