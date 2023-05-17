<%@page import="java.sql.*"%>
<%
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/scm?allowPublicKeyRetrieval=true&useSSL=false", "root", "Krishnasairaj@77");

        // Check if a product ID has been passed as a parameter
        String productId = request.getParameter("id");
        if (productId != null) {
            // Delete the product from the database
            String query = "DELETE FROM products WHERE PRODUCTID = ?";
            PreparedStatement stm = con.prepareStatement(query);
            stm.setString(1, productId);
            stm.executeUpdate();
            con.close();

            response.sendRedirect("viewproduct.jsp");
        }

        // Fetch all products from the database and display them in a table
        String query = "SELECT * FROM products";
        Statement stm = con.createStatement();
        ResultSet rs = stm.executeQuery(query);
        while (rs.next()) {
%>
        <tr>
            <td><a href="viewproduct.jsp?id=<%= rs.getString("PRODUCTID") %>">Delete</a></td>
        </tr>
<%
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
