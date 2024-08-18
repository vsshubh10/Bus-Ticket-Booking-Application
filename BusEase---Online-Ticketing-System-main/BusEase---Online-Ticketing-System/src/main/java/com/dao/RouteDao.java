package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Route;

public class RouteDao {
	private Connection conn;

	public RouteDao(Connection conn) {
		super();
		this.conn = conn;
	}
	
	
	public boolean addRoutes(Route r)
	{
		boolean f = false;
		
		try {
			String sql = "insert into routes(busno,busname,from_city,to_city,depart_time,fare) values(?,?,?,?,?,?)";
			PreparedStatement ps=conn.prepareStatement(sql);
			
			ps.setString(1, r.getBusno());
			ps.setString(2, r.getBusname());
			ps.setString(3, r.getFrom());
			ps.setString(4, r.getTo());
			ps.setString(5, r.getTime());
			ps.setString(6, r.getFare());
			
			
			int i = ps.executeUpdate();
			if(i==1) {
				f = true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
	
	
	public List<Route> getAllRoute()
	{
		List<Route> list = new ArrayList<Route>();
		Route r=null;
		
		try {
			
			String sql ="select * from routes order by id desc";
			PreparedStatement ps = conn.prepareStatement(sql);
			
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next())
			{
				r=new Route();
				r.setId(rs.getInt(1));
				r.setBusno(rs.getString(2));
				r.setBusname(rs.getString(3));
				r.setFrom(rs.getString(4));
				r.setTo(rs.getString(5));
				r.setTime(rs.getString(6));
				r.setFare(rs.getString(7));
				
				list.add(r);
				
			}
			
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	
	
	public Route getRouteById(int id) {
		Route r = null;
		
		try {
			String sql = "select * from routes where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next())
			{
				r=new Route();
				r.setId(rs.getInt(1));
				r.setBusno(rs.getString(2));
				r.setBusname(rs.getString(3));
				r.setFrom(rs.getString(4));
				r.setTo(rs.getString(5));
				r.setTime(rs.getString(6));
				r.setFare(rs.getString(7));
				
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return r;
	}
	
	public boolean updateRoute(Route r)
	{
		boolean f = false;
		
		
		try {
			
			
			
			String sql = "update routes set busno=?,busname=?,from_city=?,to_city=?,depart_time=?,fare=? where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ps.setString(1, r.getBusno());
			ps.setString(2, r.getBusname());
			ps.setString(3, r.getFrom());
			ps.setString(4, r.getTo());
			ps.setString(5, r.getTime());
			ps.setString(6, r.getFare());
			ps.setInt(7, r.getId());
			
			int i = ps.executeUpdate();
			if(i==1) {
				f = true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return f;
	}
	
	
	public boolean deleteRoute(int id)
	{
		boolean f = false;
		
		
		try {
			String sql = "delete from routes where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
		
	}
	
	
	public int countUSer() {
		int i = 0;
		try {
			String sql = "select * from user_dtls";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				i++;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return i;
	}
	
	
	public int countRoute() {
		int i = 0;
		try {
			String sql = "select * from routes";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				i++;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return i;
	}
	
	
	public int countBookings() {
		int i = 0;
		try {
			String sql = "select * from bookings";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				i++;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return i;
	}
	
}
