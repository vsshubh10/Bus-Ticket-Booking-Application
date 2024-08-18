<%@page import="com.entity.Route"%>
<%@page import="com.entity.Bookings"%>
<%@page import="com.entity.User"%>
<%@page import="com.dao.RouteDao"%>
<%@page import="com.dao.BookingsDao"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>My Bookings</title>


<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/bootstrap.min.css">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
	integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />

<script defer src="js/bootstrap.bundle.min.js"></script>

<style type="text/css">
@import
	url('https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700;800;900&display=swap')
	;

.admin_card {
	margin-top: 81px;
}

.table-back {
	background-color: #353935;
	color: #ffffff;
}
</style>
</head>
<body>


	<%@include file="component/navbar.jsp"%>





	<div class="container p-3">
		<div class="row">

			<div class="col-md-9">
				<div class="card paint-card">
					<div class="card-body" style="background-color: #D2E0FB;">
						<p class="fs-1 text-center fw-bold"
							style="color: #3C486B; font-family: 'Montserrat', sans-serif;">MY
							BOOKINGS</p>
						<c:if test="${not empty errorMsg}">
							<p class="fs-3 text-center text-danger">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session" />
						</c:if>
						<c:if test="${not empty succMsg}">
							<div class="fs-3 text-center text-success" role="alert">${succMsg}</div>
							<c:remove var="succMsg" scope="session" />
						</c:if>
						<table class="table" style="background-color: #F6F1F1;">
							<thead>
								<tr class="table-back">
									<th scope="col">Bus No.</th>
									<th scope="col">Bus Name</th>
									<th scope="col">From</th>
									<th scope="col">To</th>
									<th scope="col">Departure Time</th>
									<th scope="col">Fare</th>
									<th scope="col">Full Name</th>
									<th scope="col">No Of Tickets</th>
									<th scope="col">Status</th>
								</tr>
							</thead>
							<tbody>

								<%
								User user = (User) session.getAttribute("userObj");
								BookingsDao dao = new BookingsDao(DBConnect.getConn());
								RouteDao dao2 = new RouteDao(DBConnect.getConn());
								List<Bookings> list = dao.getAllBookingsByLoginUser(user.getId());
								for (Bookings bk : list) {
									Route r = dao2.getRouteById(bk.getRouteId());
								%>

								<tr>
									<td><%=bk.getBusNo()%></td>
									<td><%=bk.getBusName()%></td>
									<td><%=bk.getFrom()%></td>
									<td><%=bk.getTo()%></td>
									<td><%=bk.getTime()%></td>
									<td><%=bk.getFare()%></td>
									<td><%=bk.getFullName()%></td>
									<td><%=bk.getTickets()%></td>
									<td>
										<%
										if ("Pending".equals(bk.getStatus())) {
										%> <a href="#" class="btn btn-sm btn-warning">Pending</a> <%
 } else {
 %> <a href="#" class="btn btn-sm btn-success"><%=bk.getStatus()%></a> <%
 }
 %>
									</td>

								</tr>


								<%
								}
								%>





							</tbody>
						</table>
					</div>
				</div>

			</div>


			<div class="col-md-3 p-3">
				<img alt="" src="images/nbstc_bus.png" width="300px" height="300px">
			</div>


		</div>
	</div>








</body>
</html>