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
<title>Add Product</title>
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
</style>
	<input type="hidden" id="status" value="<%=request.getAttribute("status")%>">
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
						class="nav-link py-3 px-0 px-lg-3 rounded" href="admin.jsp">Dashboard</a></li>
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="productinventory.jsp">Product Inventory</a></li>
						<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="userslist.jsp">Users List</a></li>
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="saleshistory.jsp">Sales History</a></li>
				</ul>
	</nav>
	<header class="masthead bg-primary text-white text-center">
		<div class="container d-flex align-items-center flex-column">
				</div>
				<div class="divider-custom-line"></div>
<title>Add Inventory</title>
    <style>
      label {
        display: inline-block;
        width: 150px;
        text-align: right;
        margin-right: 20px;
      }
      input[type="text"] {
        
        border: 1px solid #1bbc9b;
      }
      
      .field-group {
        margin-bottom: 10px;
        border: none;
        border-radius: 5px;
        background-color: #1bbc9b;
        padding: 10px;
        box-sizing: border-box;
      }
      .field-group label {
        display: inline-block;
        width: 100px;
        margin-right: 10px;
        vertical-align: top;
      }
      .field-group input[type="text"] {
        width: 200px;
      }
      .field-group input[type="submit"] {
        margin-top: 10px;
      }
    </style>
  </head>
  <body>
	<div class="main">

		<!-- Sign up form -->
		<section class="signup">
			<div class="container">
				<div class="signup-content">
					<div class="signup-form">
						<h2 class="form-title">Add Product</h2>
					
						<form method="post" action="addproducts" class="register-form" id="register-form">
							<div class="field-group">
        <label for="product_id">Product ID:</label>
        <input type="text" id="product_id" name="product_id"/>
        <label for="product_name">Product Name:</label>
        <input type="text" id="product_name" name="product_name"/>
      </div>
		<div class="field-group">
                <label for="product_cost">Product Cost:</label>
        <input type="text" id="product_cost" name="product_cost"/>
        <label for="product_quantity">Product Quantity:</label>
        <input type="text" id="product_quantity" name="product_quantity"/>
      </div>
      </div>
							<div class="field-group">
								<input type="submit" name="addproduct" id="addproduct"
									class="form-submit" value="Add Product" />
	</div>
	<!-- JS -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="js/main.js"></script>

	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="alert/dist/sweetalert.css">
	
<script type="text/javascript">

var status=document.getElementById("status").value;
if(status == "success")
{
swal("Congrats","Product Added Successfully","success");
}
</script>
</body>
</html>