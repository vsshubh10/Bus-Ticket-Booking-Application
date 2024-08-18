<%@page import="com.entity.Route"%>
<%@page import="com.entity.Bookings"%>
<%@page import="com.dao.BookingsDao"%>
<%@page import="com.dao.RouteDao"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Bookings</title>

<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" href="../css/bootstrap.min.css">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
	integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />

<script defer src="../js/bootstrap.bundle.min.js"></script>


<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}

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
	<%@include file="navbar.jsp"%>


	<c:if test="${empty adminObj }">
		<c:redirect url="../admin_login.jsp"></c:redirect>
	</c:if>


	<div class="container-fluid p-3">
		<div class="row">




			<div class="col-md-12">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center fw-bold" style="color: #115DCB;">ALL
							BOOKINGS</p>
						<c:if test="${not empty errorMsg}">
							<p class="fs-3 text-center text-danger">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session" />
						</c:if>
						<c:if test="${not empty succMsg}">
							<div class="fs-3 text-center text-success" role="alert">${succMsg}</div>
							<c:remove var="succMsg" scope="session" />
						</c:if>
						<table class="table">
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
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>

								<%
								BookingsDao dao2 = new BookingsDao(DBConnect.getConn());
								List<Bookings> list = dao2.getAllBookings();
								for (Bookings bk : list) {
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
									<td><%=bk.getStatus()%></td>
									<td>
										<%
										if ("Pending".equals(bk.getStatus())) {
										%> <a href="approve.jsp?id=<%=bk.getId()%>"
										class="btn btn-success btn-sm">Approve</a> <%
 } else {
 %> <a href="approve.jsp" class="btn btn-success btn-sm disabled">Approve</a>
										<%
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



		</div>
	</div>

















	<!-- <%@include file="../component/footer.jsp"%> -->

</body>
</html>