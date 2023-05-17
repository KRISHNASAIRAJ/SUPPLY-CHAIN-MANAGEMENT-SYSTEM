<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>    
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Users List</title>
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js"
	crossorigin="anonymous"></script>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css" />
<link
	href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic"
	rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/index-styles.css" rel="stylesheet" />
</head>
<body id="page-top">
	<!-- Navigation-->
	<style>
#mainNav {
  position: fixed;
  top: 0;
  width: 100%;
}
.nav-link {
  white-space: nowrap;
}
  body {
    margin: 0;
    padding: 0;
  }
</style>
	<nav
		class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top"
		id="mainNav">
		<div class="container">
			<a class="navbar-brand" href="admin.jsp">SUPPLY CHAIN MANAGEMENT</a>
			<button
				class="navbar-toggler text-uppercase font-weight-bold bg-primary text-white rounded"
				type="button" data-bs-toggle="collapse"
				data-bs-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				Menu <i class="fas fa-bars"></i>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ms-auto">
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="distributor.jsp">Dashboard</a></li>
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="distributorinventory.jsp">Product Inventory</a></li>
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="distributorproducts.jsp">Available Products</a></li>
					<a class="nav-link py-3 px-0 px-lg-3 rounded" href="login.jsp">Logout</a>
				</ul>
	</nav>
	<header class="masthead bg-primary text-white text-center">
		<div class="container d-flex align-items-center flex-column">
<div style="display: flex;">
  <div style="width: 50%;">
    <h3>Sales History</h3>
    <a href="distbinventoryproducts.jsp">
      <div style="display: flex; flex-direction: column; align-items: center;">
        <img src="images/AddProduct.png" alt="Product Image" style="width: 100px; height: 100px;">
        <p style="text-align: center;"></p>
      </div>
    </a>
  </div>
  <div style="width: 300px;">
  <h3>Orderhistory</h3>
  <a href="distributororderhistory.jsp">
    <div style="display: flex; flex-direction: column; align-items: center;">
      <img src="images/viewproduct.png" alt="Product Image" style="width: 100px; height: 100px;">
      <p style="text-align: center;"></p>
    </div>
  </a>
</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="js/scripts.js"></script>
	<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
</body>
</html>
