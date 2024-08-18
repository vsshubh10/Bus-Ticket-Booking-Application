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

.search-container {
	display: flex;
	justify-content: center;
	align-items: center;
	height: 50%;
}

/* Style for the search input */
.search-input {
	background: #DDE6ED; padding : 10px;
	margin: 5px;
	border: 2px solid #353935;
	border-radius: 5px;
	width: 500px;
	height: 40px;
	font-size: 16px;
	outline: none;
	padding: 10px;
}

.search-input:hover {
	border-color: #322653;
}
</style>
</head>
<body>


	<%@include file="component/navbar.jsp"%>



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


						<div class="search-container">
							<input type="text" class="search-input"
								placeholder="Search by city name..." id="myInput"
								onkeyup="searchFun()">
						</div>

						<table class="table" style="background-color: #F6F1F1;"
							id="myTable">
							<thead>
								<tr class="header table-back">
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
									<td>Rs.  <%=r.getFare()%></td>
									<c:if test="${empty userObj }">
										<td><a href="user_login.jsp"
											class="btn btn-sm btn-warning fw-bold col-md-6"
											style="color: #000000; background-color: #FFFF00; border-color: #000000;">BOOK</a></td>
									</c:if>

									<c:if test="${not empty userObj }">
										<td><a href="book_now.jsp?id=<%=r.getId()%>"
											class="btn btn-sm btn-warning fw-bold col-md-6"
											style="color: #000000; background-color: #FFFF00; border-color: #000000;">BOOK</a></td>
									</c:if>

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




	<script type="text/javascript">
		const searchFun = () => {
			  let filter = document.getElementById('myInput').value.toUpperCase();
			  let myTable = document.getElementById('myTable');
			  
			  let tr = myTable.getElementsByTagName('tr');
			  
			  for(var i = 0; i<tr.length; i++){
			    let td= tr[i].getElementsByTagName('td')[2];
			    
			    if(td){
			      let textvalue = td.textContent || td.innerHTML;
			      if(textvalue.toUpperCase().indexOf(filter) > -1){
			        tr[i].style.display="";
			      }else{
			        tr[i].style.display= "none";
			      }
			    }
			  }
			}



</script>



</body>
</html>