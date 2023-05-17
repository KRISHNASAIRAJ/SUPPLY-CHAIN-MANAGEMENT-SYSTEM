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
<title>Available Products</title>
<!-- Favicon-->
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
<nav
		class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top"
		id="mainNav">
		<div class="container">
			<a class="navbar-brand" href="#page-top">SUPPLY CHAIN MANAGEMENT</a>
			<button
				class="navbar-toggler text-uppercase font-weight-bold bg-primary text-white rounded"
				type="button" data-bs-toggle="collapse"
				data-bs-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				Menu <i class="fas fa-bars"></i>
			</button>
				<ul class="navbar-nav ms-auto">
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="distributor.jsp">Dashboard</a></li>
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="distributorinventory.jsp">Product Inventory</a></li>
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="distributorproducts.jsp">Available Products</a></li>
					<a class="nav-link py-3 px-0 px-lg-3 rounded" href="login.jsp">Logout</a>
				</ul>
			</div>
		</div>
	</nav>
	
	<header class="masthead bg-primary text-white text-center">
		<div class="container d-flex align-items-center flex-column">
		<p class="masthead-subheading font-weight-light mb-0">Available Products</p>
<style>
  td {
    padding: 5px; /* add 5px of padding to all table cells */
  }
</style>

<table class="table table-bordered table-striped table-condensed" align="center">
  <thead>
    <tr>
      <th>Product ID </th>
      <th>Product Name </th>
      <th>Product Cost </th>
      <th>Product Quantity </th>
      <th></th>
    </tr>
  </thead>
  <tbody>
	<%
	try
	{
		Class.forName("com.mysql.cj.jdbc.Driver");//Loading the class for further use
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/scm?allowPublicKeyRetrieval=true&useSSL=false","root","Krishnasairaj@77");//Here we have established connection with the local database
		String query="select * from products";
		Statement stm=con.createStatement();
		ResultSet rs=stm.executeQuery(query);
		while(rs.next())
		{
			if (rs.getInt("PRODUCTQUANTITY") == 0) {
				continue; // skip this row and move to the next one
			}
			%>
			<tr>
			<td><%=rs.getString("PRODUCTID") %></td>
			<td><%=rs.getString("PRODUCTNAME") %></td>
			<td><%=rs.getString("PRODUCTCOST") %></td>
			<td><%=rs.getString("PRODUCTQUANTITY") %></td>
			<a href="placeorder.jsp?product=<%=rs.getString("PRODUCTID") %>&quantitys=<%=rs.getString("PRODUCTQUANTITY") %>" style="background-color: none; color: white; padding: 5px 10px; text-decoration: none;"></a>
  <td><a href="distributororder.jsp?product=<%=rs.getString("PRODUCTID") %>" style="background-color: red; color: white; padding: 5px 10px; text-decoration: none;">Buy</a></td>
			<%
		}
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	%>
	
  </tbody>
</table>
</body>
</html>
