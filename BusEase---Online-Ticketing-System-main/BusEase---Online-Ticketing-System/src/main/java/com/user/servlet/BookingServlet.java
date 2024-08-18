package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.BookingsDao;
import com.db.DBConnect;
import com.entity.Bookings;

@WebServlet("/addBooking")
public class BookingServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int userId = Integer.parseInt(req.getParameter("userid"));
		String busno = req.getParameter("busno");
		String busname = req.getParameter("busname");
		String from = req.getParameter("from");
		String to = req.getParameter("to");
		String time = req.getParameter("time");
		String fare = req.getParameter("fare");
		String fullname = req.getParameter("fullname");
		String tickets = req.getParameter("tickets");
		int routeid = Integer.parseInt(req.getParameter("routeid"));

		Bookings bk = new Bookings(userId, busno, busname, from, to, time, fare, fullname, tickets, routeid, "Pending");
		
		BookingsDao dao = new BookingsDao(DBConnect.getConn());
		HttpSession session = req.getSession();
		
		
		if (dao.addBookings(bk)) {
			session.setAttribute("succMsg", "Booked Sucessfully");
			resp.sendRedirect("book_ticket.jsp");
		} else {
			session.setAttribute("errorMsg", "Something wrong on server");
			resp.sendRedirect("book_ticket.jsp");
		}

	}

}
