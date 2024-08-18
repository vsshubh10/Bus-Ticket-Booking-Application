package com.entity;

public class Route {

	private int id;
	private String busno;
	private String busname;
	private String from;
	private String to;
	private String time;
	private String fare;
	
	
	
	public Route() {
		super();
		// TODO Auto-generated constructor stub
	}



	public Route(String busno, String busname, String from, String to, String time, String fare) {
		super();
		this.busno = busno;
		this.busname = busname;
		this.from = from;
		this.to = to;
		this.time = time;
		this.fare = fare;
	}


	
	
	
	

	public Route(int id, String busno, String busname, String from, String to, String time, String fare) {
		super();
		this.id = id;
		this.busno = busno;
		this.busname = busname;
		this.from = from;
		this.to = to;
		this.time = time;
		this.fare = fare;
	}



	public int getId() {
		return id;
	}



	public void setId(int id) {
		this.id = id;
	}



	public String getBusno() {
		return busno;
	}



	public void setBusno(String busno) {
		this.busno = busno;
	}



	public String getBusname() {
		return busname;
	}



	public void setBusname(String busname) {
		this.busname = busname;
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
	
	
	
}
