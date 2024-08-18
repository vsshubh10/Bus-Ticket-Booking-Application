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

@import
	url('https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700;800;900&display=swap')
	;


.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
	background-color: #322653;
	color: white;
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



	<div class="container p-3 mt-5">
		<div class="row">

			<div class="col-md-6 offset-md-3">
				<div class="card paint-card">
					<div class="card-body">
						<p class="text-center fs-4"  style="text-transform: uppercase; font-weight: 500; font-family: 'Montserrat', sans-serif;">Approve tickets for</p>


						<%
						int id = Integer.parseInt(request.getParameter("id"));
						BookingsDao dao = new BookingsDao(DBConnect.getConn());

						Bookings bk = dao.getBookingsById(id);
						%>

						<form class="row" action="../updateStatus" method="post">

							<div class="col-md-9">
								<label>Customer Name</label> <input type="text"
									value="<%=bk.getFullName()%>" readonly class="form-control">
							</div>

							<div class="col-md-6">
								<label>From</label> <input type="text" value="<%=bk.getFrom()%>"
									readonly class="form-control">
							</div>

							<div class="col-md-6">
								<label>To</label> <input type="text" value="<%=bk.getTo()%>"
									readonly class="form-control">
							</div>


							<div class="col-md-12">
								<br> <label>Approve ?</label>
								<textarea required name="comm" class="form-control" row="3"
									cols=""></textarea>
							</div>

							<input type="hidden" name="id" value="<%=bk.getId()%>"> <input
								type="hidden" name="rid" value="<%=bk.getRouteId()%>">

							<button class=" mt-3 btn btn-primary col-md-6 offset-md-3">Submit</button>

						</form>

					</div>
				</div>
			</div>
		</div>
	</div>














	<!-- <%@include file="../component/footer.jsp"%> -->

</body>
</html>