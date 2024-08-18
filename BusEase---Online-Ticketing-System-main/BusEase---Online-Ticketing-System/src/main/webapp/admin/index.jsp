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
<title>Admin Home</title>

<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" href="../css/bootstrap.min.css">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
	integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />

<script defer src="../js/bootstrap.bundle.min.js"></script>

<style type="text/css">
@import
	url('https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700;800;900&display=swap')
	;


.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}

.admin_card {
	margin-top: 81px;
}

.card {
	background-color: #115DCB;
}




</style>

</head>
<body   style="background-color: #F1EFEF;">
	<%@include file="navbar.jsp"%>


	<c:if test="${empty adminObj }">
		<c:redirect url="../admin_login.jsp"></c:redirect>
	</c:if>

	<div class="container p-5 ">
		<p class="text-center fs-1 fw-bold text-uppercase"
			style="color: #3C486B; font-family: 'Montserrat', sans-serif;">Admin Dashboard</p>

		<c:if test="${not empty errorMsg}">
			<p class="fs-3 text-center text-danger">${errorMsg}</p>
			<c:remove var="errorMsg" scope="session" />
		</c:if>
		<c:if test="${not empty succMsg}">
			<div class="fs-3 text-center text-success" role="alert">${succMsg}</div>
			<c:remove var="succMsg" scope="session" />
		</c:if>

		<%
		RouteDao dao = new RouteDao(DBConnect.getConn());
		%>


		<div class="row admin_card">
			<div class="col-md-4">
				<div class="card paint-card">
					<div class="card-body text-center text-success">
						<i class="fa-solid fa-bus fa-3x" style="color: white;"></i><br>
						<p class="fs-3 text-center fw-bold" style="color: white;">
							All ROUTES <br>
							<%=dao.countRoute()%>
						</p>
					</div>
				</div>
			</div>


			<div class="col-md-4">
				<div class="card paint-card">
					<div class="card-body text-center text-success">
						<i class="fa-regular fa-user fa-3x" style="color: white;"></i><br>
						<p class="fs-3 text-center fw-bold" style="color: white;">
							Total Users <br>
							<%=dao.countUSer()%>
						</p>
					</div>
				</div>
			</div>


			<div class="col-md-4">
				<div class="card paint-card">
					<div class="card-body text-center text-success">
						<i class="fa-regular fa-user fa-3x" style="color: white;"></i><br>
						<p class="fs-3 text-center fw-bold" style="color: white;">
							Total Bookings<br>
							<%=dao.countBookings()%>
						</p>
					</div>
				</div>
			</div>

		</div>

	</div>
</body>
</html>