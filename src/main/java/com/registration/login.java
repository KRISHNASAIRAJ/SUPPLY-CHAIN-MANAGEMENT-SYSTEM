//Done
package com.registration; // Package declaration for the class

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/login") // Servlet annotation for mapping the servlet to a URL pattern
public class login extends HttpServlet { // Class declaration for the servlet
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Method to handle POST requests for the login servlet
		
		String USERNAME = request.getParameter("username"); // Retrieve the value of the "username" parameter from the request
		String PASSWORD = request.getParameter("password"); // Retrieve the value of the "password" parameter from the request
		RequestDispatcher dispatcher = null; // Declare a variable to store the request dispatcher
		Connection con = null; // Declare a variable for the database connection
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver"); // Load the MySQL JDBC driver class
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/scm?allowPublicKeyRetrieval=true&useSSL=false","root","Krishnasairaj@77");
			// Establish a connection to the MySQL database with the specified URL, username, and password
			
			PreparedStatement pst = con.prepareStatement("select USERNAME, USERTYPE from signup where USERNAME = ? and PASSWORD = ?");
			// Prepare a parameterized SQL statement for selecting the username and usertype from the "signup" table based on the provided username and password
			
			pst.setString(1, USERNAME); // Set the value of the first parameter in the prepared statement to the provided username
			pst.setString(2, PASSWORD); // Set the value of the second parameter in the prepared statement to the provided password
			
			HttpSession session = request.getSession(); // Get the HttpSession object associated with the request
			
			ResultSet rs = pst.executeQuery(); // Execute the SQL query and retrieve the result set
			
			if (rs.next()) { // Check if there is a row in the result set
				String userType = rs.getString("USERTYPE"); // Retrieve the value of the "USERTYPE" column from the result set
				
				// Check the user type and set the appropriate attributes in the session, and forward the request to the corresponding JSP page
				if (userType.equals("CLIENT")) {
				    session.setAttribute("USERNAME", rs.getString("USERNAME")); // Set the "USERNAME" attribute in the session to the retrieved username
				    dispatcher = request.getRequestDispatcher("Client.jsp"); // Get the request dispatcher for the "Client.jsp" page
				} else if (userType.equals("DISTRIBUTOR")) {
				    session.setAttribute("USERNAME", rs.getString("USERNAME")); // Set the "USERNAME" attribute in the session to the retrieved username
				    dispatcher = request.getRequestDispatcher("distributor.jsp"); // Get the request dispatcher for the "distributor.jsp" page
				} else if (userType.equals("DEALER")) {
				    session.setAttribute("USERNAME", rs.getString("USERNAME")); // Set the "USERNAME" attribute in the session to the retrieved username
				    dispatcher = request.getRequestDispatcher("Dealer.jsp"); // Get the request dispatcher for the "Dealer.jsp" page
				}
			} else {
				request.setAttribute("status", "failed"); // Set the "status" attribute in the request to "failed"
				dispatcher = request.getRequestDispatcher("login.jsp"); // Get the request dispatcher for the "login.jsp"
			}
			dispatcher.forward(request, response);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
}