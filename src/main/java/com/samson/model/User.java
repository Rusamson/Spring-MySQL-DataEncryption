package com.samson.model;
 

import javax.persistence.Column;
import javax.persistence.Entity; 
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id; 
import javax.persistence.Table; 


/**
 * Entity bean with JPA annotations
 * Hibernate provides JPA implementation
 * @author Samson
 *
 */
@Entity
@Table(name="USER")
public class User {
	@Id
	@Column(name="userID")
	@GeneratedValue(strategy=GenerationType.AUTO)
	int userID;
	@Column(name="firstname")
	String firstname; 
	@Column(name="surname")
	String surname; 
	@Column(name="email")
	String email; 
	@Column(name="password")
	String password; 			
 	@Column(name="driver")
	int driver; 	
	@Column(name="address")
	String address; 	
	@Column(name="city")
	String city; 	
	@Column(name="country")
	String country;
	@Column(name="plate")
	String plate;
	@Column(name="picture")
	int picture;
	@Column(name="datecreated")
	String datecreated;
	@Column(name="phone")
	String phone;
	@Column(name="status")
	String status; 
  
	public int getUserID() {
		return userID;
	}



	public void setUserID(int userID) {
		this.userID = userID;
	} 
	
	public String getFirstname() {
		return firstname;
	}



	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}



	public String getSurname() {
		return surname;
	}



	public void setSurname(String surname) {
		this.surname = surname;
	}



	public String getEmail() {
		return email;
	}



	public void setEmail(String email) {
		this.email = email;
	}



	public String getPassword() {
		return password;
	}



	public void setPassword(String password) {
		this.password = password;
	}



	public int getDriver() {
		return driver;
	}



	public void setDriver(int driver) {
		this.driver = driver;
	}



	public String getAddress() {
		return address;
	}



	public void setAddress(String address) {
		this.address = address;
	}



	public String getCity() {
		return city;
	}



	public void setCity(String city) {
		this.city = city;
	}



	public String getCountry() {
		return country;
	}



	public void setCountry(String country) {
		this.country = country;
	}



	public String getPlate() {
		return plate;
	}



	public void setPlate(String plate) {
		this.plate = plate;
	}



	public int getPicture() {
		return picture;
	}



	public void setPicture(int picture) {
		this.picture = picture;
	}



	public String getDatecreated() {
		return datecreated;
	}



	public void setDatecreated(String datecreated) {
		this.datecreated = datecreated;
	}



	public String getPhone() {
		return phone;
	}



	public void setPhone(String phone) {
		this.phone = phone;
	}



	public String getStatus() {
		return status;
	}



	public void setStatus(String status) {
		this.status = status;
	}



	@Override
	public String toString(){
		return "id="+userID+", firstname="+firstname;
	}

}
