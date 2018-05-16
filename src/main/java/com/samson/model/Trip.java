package com.samson.model;

import javax.persistence.Column;
import javax.persistence.Entity; 
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Entity bean with JPA annotations
 * Hibernate provides JPA implementation
 * @author Samson
 *
 */
@Entity
@Table(name="TRIP")
public class Trip {
	@Id
	@Column(name="bookingID")
	int bookingID; 
	@Column(name="driverID")
	int driverID; 
	@Column(name="clientID")
	int clientID; 
	@Column(name="acceptedtime")
	String acceptedtime; 
	@Column(name="accomplishedtime")
	String accomplishedtime;
	
	
	public int getBookingID() {
		return bookingID;
	}
	public void setBookingID(int bookingID) {
		this.bookingID = bookingID;
	}
	public int getDriverID() {
		return driverID;
	}
	public void setDriverID(int driverID) {
		this.driverID = driverID;
	}
	public int getClientID() {
		return clientID;
	}
	public void setClientID(int clientID) {
		this.clientID = clientID;
	}
	public String getAcceptedtime() {
		return acceptedtime;
	}
	public void setAcceptedtime(String acceptedtime) {
		this.acceptedtime = acceptedtime;
	}
	public String getAccomplishedtime() {
		return accomplishedtime;
	}
	public void setAccomplishedtime(String accomplishedtime) {
		this.accomplishedtime = accomplishedtime;
	} 			
 
	@Override
	public String toString(){
		return "bookingID="+bookingID+", driverID="+driverID;
	}

}
