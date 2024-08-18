<style>
.dropdown-menu {
	margin-left: -60px;
}
</style>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<nav class="navbar navbar-expand-lg ">
	<div class="container-fluid">
		<a class="navbar-brand" href="index.jsp"><img
			src="https://mir-s3-cdn-cf.behance.net/projects/404/7e3492164365195.Y3JvcCwyMDUwLDE2MDQsMzU1LDA.png" alt="logo" width="375px" height="73px"></a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
				<li class="nav-item"><a
					class="nav-link active text-white fw-normal" aria-current="page"
					href="all_routes.jsp"><i class="fa-solid fa-bus"></i> ALL ROUTES</a></li>

				<li class="nav-item"><a
					class="nav-link active text-white fw-normal" aria-current="page"
					href="add_routes.jsp"><i class="fa-solid fa-circle-plus"></i> ADD ROUTES</a></li>

				<li class="nav-item"><a
					class="nav-link active text-white fw-normal" aria-current="page"
					href="index.jsp"> DASHBOARD</a></li>
					
					<li class="nav-item"><a
					class="nav-link active text-white fw-normal" aria-current="page"
					href="all_bookings.jsp"> ALL BOOKINGS</a></li>
			</ul>

			<form class="d-flex">
				<div class="dropdown">
					<button class="btn btn-light dropdown-toggle" type="button"
						id="dropdownMenuButton1" data-bs-toggle="dropdown"
						aria-expanded="false">Admin</button>
					<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
						<li><a class="dropdown-item" href="../adminLogout">Logout</a></li>
					</ul>
				</div>
			</form>
		</div>
	</div>
</nav>