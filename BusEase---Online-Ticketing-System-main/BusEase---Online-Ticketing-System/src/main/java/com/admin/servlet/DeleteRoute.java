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


@WebServlet("/deleteRoute")
public class DeleteRoute extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int id = Integer.parseInt(req.getParameter("id"));

		RouteDao dao = new RouteDao(DBConnect.getConn());
		HttpSession session = req.getSession();

		if (dao.deleteRoute(id)) {
			session.setAttribute("succMsg", "Routes Deleted Sucessfully..");
			resp.sendRedirect("admin/all_routes.jsp");
		} else {
			session.setAttribute("errorMsg", "something wrong on server");
			resp.sendRedirect("admin/all_routes.jsp");
		}

	}

}
