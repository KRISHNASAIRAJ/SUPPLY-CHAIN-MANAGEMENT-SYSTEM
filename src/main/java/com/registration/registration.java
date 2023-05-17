//Done
package com.registration;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/registration")
public class registration extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// The below instructions are to request the data from the webpage
		String NAME=request.getParameter("name"); // Retrieve the value of the "name" parameter from the request
		String GMAILID=request.getParameter("email"); // Retrieve the value of the "email" parameter from the request
		String USERTYPE=request.getParameter("usertype"); // Retrieve the value of the "usertype" parameter from the request
		String USERNAME=request.getParameter("username"); // Retrieve the value of the "username" parameter from the request
		String PASSWORD=request.getParameter("pass"); // Retrieve the value of the "pass" parameter from the request
		String PHONE=request.getParameter("contact"); // Retrieve the value of the "contact" parameter from the request
		RequestDispatcher dispatcher=null;
		Connection con = null;
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver"); // Load the MySQL JDBC driver class
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/scm?allowPublicKeyRetrieval=true&useSSL=false","root","Krishnasairaj@77");
			// Establish a connection to the MySQL database using the provided URL, username, and password

			PreparedStatement pst=con.prepareStatement("insert into signup(NAME,GMAILID,USERTYPE,USERNAME,PASSWORD,PHONE) values(?,?,?,?,?,?)");
			// Create a prepared statement to insert data into the "signup" table

			pst.setString(1, NAME); // Set the first parameter in the prepared statement to the value of "NAME"
			pst.setString(2, GMAILID); // Set the second parameter in the prepared statement to the value of "GMAILID"
			pst.setString(3, USERTYPE); // Set the third parameter in the prepared statement to the value of "USERTYPE"
			pst.setString(4, USERNAME); // Set the fourth parameter in the prepared statement to the value of "USERNAME"
			pst.setString(5, PASSWORD); // Set the fifth parameter in the prepared statement to the value of "PASSWORD"
			pst.setString(6, PHONE); // Set the sixth parameter in the prepared statement to the value of "PHONE"

			int rowCount=pst.executeUpdate(); // Execute the update query and get the number of affected rows

			dispatcher=request.getRequestDispatcher("registration.jsp"); // Get the request dispatcher for "registration.jsp"

			if(rowCount>0)
			{
				request.setAttribute("status", "success"); // Set an attribute named "status" with the value "success" in the request
			}
			else
			{
				request.setAttribute("status", "failed"); // Set an attribute named "status" with the value "failed" in the request
			}

			dispatcher.forward(request, response); // Forward the request and response objects to "registration.jsp"
		}
		catch(Exception e)
		{
			e.printStackTrace(); // Print the stack trace of any exception that occurred
		}
		finally
		{
			try
			{
				con.close(); // Close the database connection
			}
			catch(SQLException e)
			{

				e.printStackTrace();
			}
		}
	}}