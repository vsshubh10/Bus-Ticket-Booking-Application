package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.RouteDao;
import com.db.DBConnect;
import com.entity.Route;


@WebServlet("/updateRoute")
public class UpdateRoute extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			String busno = req.getParameter("busno");
			String busname = req.getParameter("busname");
			String from = req.getParameter("from");
			String to = req.getParameter("to");
			String time = req.getParameter("time");
			String fare = req.getParameter("fare");
			
			int id =Integer.parseInt(req.getParameter("id"));
			
			Route r = new Route(id,busno,busname,from,to,time,fare);
			
			RouteDao dao=new RouteDao(DBConnect.getConn());
			HttpSession session=req.getSession();
			
			
			if(dao.updateRoute(r))
			{
				session.setAttribute("succMsg", "Route updated Successfully");
				resp.sendRedirect("admin/add_routes.jsp");
			} else {
				session.setAttribute("errorMsg", "Something Went Wrong !");
				resp.sendRedirect("admin/add_routes.jsp");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
	}

	
	
	
}
