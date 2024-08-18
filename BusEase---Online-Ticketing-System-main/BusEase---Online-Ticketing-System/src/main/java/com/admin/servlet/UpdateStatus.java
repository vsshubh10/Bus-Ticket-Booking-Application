package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.BookingsDao;
import com.db.DBConnect;


@WebServlet("/updateStatus")
public class UpdateStatus extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			
			int id=Integer.parseInt(req.getParameter("id"));
			int rid=Integer.parseInt(req.getParameter("rid"));
			String comm = req.getParameter("comm");
			
			
			
			BookingsDao dao = new BookingsDao(DBConnect.getConn());
			
			HttpSession session = req.getSession();
			
			if (dao.updateStatus(id, rid, comm)) {
				session.setAttribute("succMsg", "Status Updated");
				resp.sendRedirect("admin/all_bookings.jsp");
			} else {
				session.setAttribute("errorMsg", "Something wrong on server");
				resp.sendRedirect("admin/all_bookings.jsp");
			}

			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}

	
	
	
	
}
