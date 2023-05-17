<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>    
<%@ page import="java.util.Random" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Distb Order Page</title>
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
		<p class="masthead-subheading font-weight-light mb-0"></p>
		<a href="distributorproducts.jsp" style="color: white;">Continue Shopping</a>
		<style>
  td {
    padding: 5px; /* add 5px of padding to all table cells */
  }
</style>
		
<%
 String productId = request.getParameter("product");
 String quantityStr = request.getParameter("quantitys");
 int quantity = 0;

 if (quantityStr != null && !quantityStr.isEmpty()) {
   quantity = Integer.parseInt(quantityStr);
 }

 try {
   Class.forName("com.mysql.cj.jdbc.Driver");
   Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/scm?allowPublicKeyRetrieval=true&useSSL=false", "root", "Krishnasairaj@77");

   // Get the current quantity of the product
   String query = "SELECT PRODUCTQUANTITY FROM products WHERE PRODUCTID = ?";
   PreparedStatement stmt = con.prepareStatement(query);
   stmt.setString(1, productId);
   ResultSet rs = stmt.executeQuery();

   if (rs.next()) {
     int currentQuantity = rs.getInt("PRODUCTQUANTITY");
     int orderQuantity = 10;
	 int current=currentQuantity - orderQuantity;
     if (currentQuantity >= orderQuantity) {
       // There is enough quantity to fulfill the order, so update the database
       query = "UPDATE products SET PRODUCTQUANTITY = ? WHERE PRODUCTID = ?";
       stmt = con.prepareStatement(query);
       stmt.setInt(1, currentQuantity - orderQuantity);
       stmt.setString(2, productId);
       stmt.executeUpdate();

       // Generate a random 4-digit ORDERID
       Random rand = new Random();
       int orderIdInt = rand.nextInt(10000);
       String orderId = String.format("%04d", orderIdInt);

       // Insert the new order into the orders table
       String username = (String) session.getAttribute("USERNAME");
       query = "INSERT INTO orders (ORDERID, PRODUCTID, ORDERDATE, QUANTITY, USERNAME) VALUES (?, ?, NOW(), ?, ?)";
       stmt = con.prepareStatement(query);
       stmt.setString(1, orderId);
       stmt.setString(2, productId);
       stmt.setString(3, "10");
       stmt.setString(4, username);
       int rows = stmt.executeUpdate();

       // Display the ORDERID in the success message
       out.println("<h1>Order placed successfully! Your ORDERID is " + orderId + ".</h1>");
     } else {
       out.println("<h1>Sorry, there is not enough quantity to fulfill your order.</h1>");
     }
   } else {
     // The product does not exist, so display an error message
     out.println("<h1>Sorry, the product does not exist.</h1>");
   }

   // Close the database connection and statement objects
   rs.close();
   stmt.close();
   con.close();
 } catch (Exception e) {
   e.printStackTrace();
 }
 %>


    <br>
</body>
</html>