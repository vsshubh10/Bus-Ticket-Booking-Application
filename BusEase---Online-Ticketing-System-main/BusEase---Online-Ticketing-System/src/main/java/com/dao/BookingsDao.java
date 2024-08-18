package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Bookings;

public class BookingsDao {

	private Connection conn;

	public BookingsDao(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean addBookings(Bookings bk) {
		boolean f = false;

		try {

			String sql = "insert into bookings(user_id,busNo,busName,from_city,to_city,depart_time,fare,fullName,tickets,route_id,status) values(?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setInt(1, bk.getUserId());
			ps.setString(2, bk.getBusNo());
			ps.setString(3, bk.getBusName());
			ps.setString(4, bk.getFrom());
			ps.setString(5, bk.getTo());
			ps.setString(6, bk.getTime());
			ps.setString(7, bk.getFare());
			ps.setString(8, bk.getFullName());
			ps.setString(9, bk.getTickets());
			ps.setInt(10, bk.getRouteId());
			ps.setString(11, bk.getStatus());

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public List<Bookings> getAllBookingsByLoginUser(int userId) {
		List<Bookings> list = new ArrayList<Bookings>();

		Bookings bk = null;

		try {

			String sql = "select * from bookings where user_id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, userId);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				bk = new Bookings();
				bk.setId(rs.getInt(1));
				bk.setUserId(rs.getInt(2));
				bk.setBusNo(rs.getString(3));
				bk.setBusName(rs.getString(4));
				bk.setFrom(rs.getString(5));
				bk.setTo(rs.getString(6));
				bk.setTime(rs.getString(7));
				bk.setFare(rs.getString(8));
				bk.setFullName(rs.getString(9));
				bk.setTickets(rs.getString(10));
				bk.setRouteId(rs.getInt(11));
				bk.setStatus(rs.getString(12));
				list.add(bk);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	
	
	
	
	
	
	
	public List<Bookings> getAllBookings() {
		List<Bookings> list = new ArrayList<Bookings>();

		Bookings bk = null;

		try {

			String sql = "select * from bookings order by id desc";
			PreparedStatement ps = conn.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				bk = new Bookings();
				bk.setId(rs.getInt(1));
				bk.setUserId(rs.getInt(2));
				bk.setBusNo(rs.getString(3));
				bk.setBusName(rs.getString(4));
				bk.setFrom(rs.getString(5));
				bk.setTo(rs.getString(6));
				bk.setTime(rs.getString(7));
				bk.setFare(rs.getString(8));
				bk.setFullName(rs.getString(9));
				bk.setTickets(rs.getString(10));
				bk.setRouteId(rs.getInt(11));
				bk.setStatus(rs.getString(12));
				list.add(bk);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public boolean updateStatus(int id, int routeId, String newStatus) {
		boolean f = false;
		try {
			String sql = "update bookings set status=? where id=? and route_id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, newStatus);
			ps.setInt(2, id);
			ps.setInt(3, routeId);

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}
	
	
	public Bookings getBookingsById(int id) {
		
		Bookings bk = null;

		try {

			String sql = "select * from bookings where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			
			
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				bk = new Bookings();
				bk.setId(rs.getInt(1));
				bk.setUserId(rs.getInt(2));
				bk.setBusNo(rs.getString(3));
				bk.setBusName(rs.getString(4));
				bk.setFrom(rs.getString(5));
				bk.setTo(rs.getString(6));
				bk.setTime(rs.getString(7));
				bk.setFare(rs.getString(8));
				bk.setFullName(rs.getString(9));
				bk.setTickets(rs.getString(10));
				bk.setRouteId(rs.getInt(11));
				bk.setStatus(rs.getString(12));

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return bk;
		
		
	}

}
