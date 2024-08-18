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
<title>Book Tickets</title>


<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/bootstrap.min.css">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
	integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />

<script defer src="js/bootstrap.bundle.min.js"></script>

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


	<%@include file="component/navbar.jsp"%>


	<div class="container p-3">
		<div class="row">

			<div class="col-md-6 offset-md-3">
				<div class="card paint-card">
					<div class="card-body">
						<p class="text-center fs-4 fw-bold" style="color: #115DCB;">BOOK
							NOW</p>

						<%
						int id = Integer.parseInt(request.getParameter("id"));
						RouteDao dao = new RouteDao(DBConnect.getConn());

						Route r = dao.getRouteById(id);
						%>


						<form class="row" action="addBooking" method="post">

							<input type="hidden" name="userid" value="${userObj.id }">


							<div class="col-md-6">
								<label>Bus No.</label> <input type="text" readonly name="busno"
									value="<%=r.getBusno()%>" class="form-control">
							</div>

							<div class="col-md-6">
								<label>Bus Name</label> <input type="text" readonly
									value="<%=r.getBusname()%>" name="busname" class="form-control">
							</div>


							<div class="col-md-6">
								<br> <label>From</label> <input type="text" readonly
									value="<%=r.getFrom()%>" name="from" class="form-control">
							</div>

							<div class="col-md-6">
								<br> <label>To</label> <input type="text" readonly
									value="<%=r.getTo()%>" name="to" class="form-control">
							</div>

							<div class="col-md-6">
								<br> <label>Departure Time</label> <input type="text"
									value="<%=r.getTime()%>" name="time" readonly
									class="form-control">
							</div>

							<div class="col-md-6">
								<br> <label>Ticket Fare</label> <input type="text" readonly
									value="<%=r.getFare()%>" name="fare" class="form-control">
							</div>

							<div class="col-md-6">
								<br> <label>Full Name</label> <input type="text"
									name="fullname" class="form-control">
							</div>



							<div class="col-md-6">
								<br> <label>No of Tickets</label> <input type="text"
									name="tickets" class="form-control">
							</div>

							<input type="hidden" name="routeid" value="<%=r.getId()%>">

							<button class=" mt-3 btn btn-primary col-md-6 offset-md-3">Submit</button>

						</form>

					</div>
				</div>
			</div>
		</div>
	</div>








</body>
</html>