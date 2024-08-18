<%@page import="com.entity.Route"%>
<%@page import="com.dao.RouteDao"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Routes</title>

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


	<div class="container-fluid p-3">
		<div class="row">




			<div class="col-md-12">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center fw-bold" style="color: #115DCB;">ALL
							ROUTES</p>
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
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>

								<%
								RouteDao dao2 = new RouteDao(DBConnect.getConn());
								List<Route> list2 = dao2.getAllRoute();
								for (Route r : list2) {
								%>

								<tr>
									<td><%=r.getBusno()%></td>
									<td><%=r.getBusname()%></td>
									<td><%=r.getFrom()%></td>
									<td><%=r.getTo()%></td>
									<td><%=r.getTime()%></td>
									<td><%=r.getFare()%></td>
									<td><a href="edit_routes.jsp?id=<%=r.getId()%>"
										class="btn btn-sm btn-primary">Edit</a> <a
										href="../deleteRoute?id=<%=r.getId()%>"
										class="btn btn-sm btn-danger">Delete</a></td>
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