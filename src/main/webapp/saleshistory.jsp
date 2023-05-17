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
			</div>
		</div>
	</nav>
	
	<header class="masthead bg-primary text-white text-center">
		<div class="container d-flex align-items-center flex-column">
		<p class="masthead-subheading font-weight-light mb-0">Order History</p>
		<br>
<style>
  td {
    padding: 5px; /* add 5px of padding to all table cells */
  }
</style>

<table class="table table-bordered table-striped table-condensed" align="center">
  <thead>
    <tr>
    <th>USERNAME</th>
      <th>ORDER ID</th>
      <th>PRODUCT ID</th>
      <th>PRODUCT QUANTITY</th>
      <th>ORDER DATE</th>
    </tr>
  </thead>
  <tbody>
    <% 
    String username = (String) session.getAttribute("USERNAME");
    if (username == null) {
      response.sendRedirect("login.jsp");
    } else {
      try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/scm?allowPublicKeyRetrieval=true&useSSL=false","root","Krishnasairaj@77");
        String query = "SELECT * FROM orders WHERE USERNAME = ?";
        PreparedStatement pstmt = con.prepareStatement(query);
        pstmt.setString(1, username);
        ResultSet rs = pstmt.executeQuery();
        if (!rs.isBeforeFirst()) {
          out.println("<p>No orders found for this user.</p>");
        } else {
          while (rs.next()) { %>
            <tr>
            <td><%=rs.getString("USERNAME") %></td>
              <td><%=rs.getString("ORDERID") %></td>
              <td><%=rs.getString("PRODUCTID") %></td>
              <td><%=rs.getString("QUANTITY") %></td>
              <td><%=rs.getDate("ORDERDATE") %></td>
            </tr>
          <% }
        }
      } catch (Exception e) {
        out.println(e);
      }
    }
    %>
  </tbody>
</table>


</body>
</html>
