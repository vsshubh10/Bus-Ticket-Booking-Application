<%@page import="com.db.DBConnect"%>
<%@page import="java.sql.Connection"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ISBT</title>


<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/bootstrap.min.css">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
	integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />

<script defer src="js/bootstrap.bundle.min.js"></script>
</head>
<body>


	<%@include file="component/navbar.jsp"%>




	<div class="container col-xxl-8 px-4 py-5">
		<div class="row flex-lg-row-reverse align-items-center g-5 py-5">
			<div class="col-10 col-sm-8 col-lg-6">
				<img src="https://www.motorindiaonline.in/wp-content/uploads/2015/08/BMTC-pic-3.jpg" class="d-block mx-lg-auto img-fluid"
					alt="hero" width="900" height="500" loading="lazy">
			</div>
			<div class="col-lg-6">
				<h1 class="display-5 fw-bold lh-1 mb-3 text-uppercase mainh1">Welcome
					to ISBT Bangalore Ticket Booking Counter</h1>


				<c:if test="${empty userObj }">
					<div class="d-grid gap-2 d-md-flex justify-content-md-start">
						<a href="user_login.jsp" class="primary_btn">BOOK NOW !</a>
					</div>
				</c:if>

				<c:if test="${not empty userObj }">
					<div class="d-grid gap-2 d-md-flex justify-content-md-start">
						<a href="book_ticket.jsp" class="primary_btn">BOOK NOW !</a>
					</div>
				</c:if>
			</div>
		</div>
	</div>





	<%@include file="component/footer.jsp"%>
</body>
</html>