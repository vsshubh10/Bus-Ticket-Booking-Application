package com.entity;

public class Bookings {

	private int id;
	private int userId;
	private String busNo;
	private String busName;
	private String from;
	private String to;
	private String time;
	private String fare;
	private String fullName;
	private String tickets;
	private int routeId;
	private String status;
	
	
	
	public Bookings() {
		super();
		// TODO Auto-generated constructor stub
	}



	public Bookings(int userId, String busNo, String busName, String from, String to, String time, String fare,
			String fullName, String tickets, int routeId, String status) {
		super();
		this.userId = userId;
		this.busNo = busNo;
		this.busName = busName;
		this.from = from;
		this.to = to;
		this.time = time;
		this.fare = fare;
		this.fullName = fullName;
		this.tickets = tickets;
		this.routeId = routeId;
		this.status = status;
	}


	
	
	
	

	public int getId() {
		return id;
	}



	public void setId(int id) {
		this.id = id;
	}



	public int getUserId() {
		return userId;
	}



	public void setUserId(int userId) {
		this.userId = userId;
	}



	public String getBusNo() {
		return busNo;
	}



	public void setBusNo(String busNo) {
		this.busNo = busNo;
	}



	public String getBusName() {
		return busName;
	}



	public void setBusName(String busName) {
		this.busName = busName;
	}



	public String getFrom() {
		return from;
	}



	public void setFrom(String from) {
		this.from = from;
	}



	public String getTo() {
		return to;
	}



	public void setTo(String to) {
		this.to = to;
	}



	public String getTime() {
		return time;
	}



	public void setTime(String time) {
		this.time = time;
	}



	public String getFare() {
		return fare;
	}



	public void setFare(String fare) {
		this.fare = fare;
	}



	public String getFullName() {
		return fullName;
	}



	public void setFullName(String fullName) {
		this.fullName = fullName;
	}



	public String getTickets() {
		return tickets;
	}



	public void setTickets(String tickets) {
		this.tickets = tickets;
	}



	public int getRouteId() {
		return routeId;
	}



	public void setRouteId(int routeId) {
		this.routeId = routeId;
	}



	public String getStatus() {
		return status;
	}



	public void setStatus(String status) {
		this.status = status;
	}
	
	
	

	
	
	
	
	
	
}
