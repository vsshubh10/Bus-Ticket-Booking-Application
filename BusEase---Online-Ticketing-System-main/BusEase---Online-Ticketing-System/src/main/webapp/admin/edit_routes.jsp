<%@page import="com.entity.Route"%>
<%@page import="com.dao.RouteDao"%>
<%@page import="com.db.DBConnect"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Routes</title>

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
</style>

</head>
<body>
	<%@include file="navbar.jsp"%>


	<div class="container-fluid p-3">
		<div class="row">

			<div class="col-md-5 offset-md-4">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center fw-bolder" style="color: #115DCB;">EDIT
							ROUTES</p>


						<c:if test="${not empty errorMsg}">
							<p class="fs-3 text-center text-danger">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session" />
						</c:if>
						<c:if test="${not empty succMsg}">
							<div class="fs-3 text-center text-success" role="alert">${succMsg}</div>
							<c:remove var="succMsg" scope="session" />
						</c:if>

						<%
						int id = Integer.parseInt(request.getParameter("id"));
						RouteDao dao2 = new RouteDao(DBConnect.getConn());
						Route r = dao2.getRouteById(id);
						%>






						<form action="../updateRoute" method="post">
							<div class="mb-3">
								<label class="form-label">Bus No.</label> <input type="text"
									required name="busno" class="form-control"
									value="<%=r.getBusno()%>">
							</div>

							<div class="mb-3">
								<label class="form-label">Bus Name</label> <input type="text"
									required name="busname" class="form-control"
									value="<%=r.getBusname()%>">
							</div>

							<div class="mb-3">
								<label class="form-label">From</label> <input type="text"
									required name="from" class="form-control"
									value="<%=r.getFrom()%>">
							</div>

							<div class="mb-3">
								<label class="form-label">To</label> <input type="text" required
									name="to" class="form-control" value="<%=r.getTo()%>">
							</div>

							<div class="mb-3">
								<label class="form-label">Departure Time</label> <input
									type="text" required name="time" class="form-control"
									value="<%=r.getTime()%>">
							</div>

							<div class="mb-3">
								<label class="form-label">Fare</label> <input type="text"
									required name="fare" class="form-control"
									value="<%=r.getFare()%>">
							</div>

							<input type="hidden" name="id" value="<%=r.getId()%>">


							<button type="submit" class="btn btn-primary col-md-12">Update</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>



	<%@include file="../component/footer.jsp"%>
</body>
</html>