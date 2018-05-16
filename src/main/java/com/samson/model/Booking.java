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
@Table(name="BOOKING")
public class Booking {
	@Id
	@Column(name="id")
	@GeneratedValue(strategy=GenerationType.AUTO)
	int id;
	@Column(name="userID")
	int userID; 
	@Column(name="origine")
	String origine; 
	@Column(name="destination")
	String destination; 
	@Column(name="price")
	String price; 			
 	@Column(name="triptime")
	int triptime; 	
	@Column(name="timebooked")
	String timebooked; 	
	@Column(name="status")
	int status; 	
	@Column(name="remember")
	int remember; 
	@Column(name="contact")
	String contact; 	
	 
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUserID() {
		return userID;
	}
	public void setUserID(int userID) {
		this.userID = userID;
	}
	public String getOrigine() {
		return origine;
	}
	public void setOrigine(String from) {
		this.origine = from;
	}
	public String getDestination() {
		return destination;
	}
	public void setDestination(String to) {
		this.destination = to;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public int getTriptime() {
		return triptime;
	}
	public void setTriptime(int triptime) {
		this.triptime = triptime;
	}
	public String getTimebooked() {
		return timebooked;
	}
	public void setTimebooked(String timebooked) {
		this.timebooked = timebooked;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getRemember() {
		return remember;
	}
	public void setRemember(int remember) {
		this.remember = remember;
	}
 
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	@Override
	public String toString(){
		return "id="+id+", userID="+userID+" ; "+origine+" ; "+destination+" ; "+price+" ; "+triptime+" ; "+timebooked;
	}
}
