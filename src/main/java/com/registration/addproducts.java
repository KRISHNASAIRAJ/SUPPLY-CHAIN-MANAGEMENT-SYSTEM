//Done
package com.registration;
// A package is a group of similar classes, interfaces, and subpackages.

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;

@WebServlet("/addproducts")
// The @WebServlet annotation specifies the URL pattern that maps to this servlet.

public class addproducts extends HttpServlet {
    private static final long serialVersionUID = 1L;
    // The serialVersionUID is a unique identifier for this class used during deserialization.

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // This method handles the HTTP POST request.
        
        // Retrieve the values from the form fields in the request(webpage).
        String PRODUCTID = request.getParameter("product_id");
        String PRODUCTNAME = request.getParameter("product_name");
        String PRODUCTCOST = request.getParameter("product_cost");
        String PRODUCTQUANTITY = request.getParameter("product_quantity");
        
        RequestDispatcher dispatcher = null;
        // RequestDispatcher is used to forward the request and response to another resource.

        Connection con = null;
        // Connection object to establish a connection with the database.
        
        try {
            // Load the MySQL JDBC driver class.
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            // Establish a connection with the local database.
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/scm?allowPublicKeyRetrieval=true&useSSL=false","root","Krishnasairaj@77");
            
            // Prepare a SQL statement to insert data into the "products" table.
            PreparedStatement pst = con.prepareStatement("INSERT INTO products (PRODUCTID,PRODUCTNAME,PRODUCTCOST, PRODUCTQUANTITY) VALUES (?, ?, ?, ?)");
            
            // Set the values for the parameters in the SQL statement.
            pst.setString(1, PRODUCTID);
            pst.setString(2, PRODUCTNAME);
            pst.setString(3, PRODUCTCOST);
            pst.setString(4, PRODUCTQUANTITY);
            
            // Execute the SQL statement to insert the data.
            int rowCount = pst.executeUpdate();
            
            dispatcher = request.getRequestDispatcher("newproduct.jsp");
            
            // Set the "status" attribute in the request based on the success of the insert operation.
            if (rowCount > 0) {
                request.setAttribute("status", "success");
            } else {
                request.setAttribute("status", "failed");
            }
            
            // Forward the request and response to the "newproduct.jsp" page.
            dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        response.sendRedirect("newproduct.jsp");
        // Redirect the response to the "newproduct.jsp" page.
    }
}
