<%-- 
    Document   : incidentdb
    Created on : Mar 12, 2024, 8:09:18 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.DataSource" %>
<%@ page import="javax.naming.InitialContext" %>
<%@ page import="javax.naming.NamingException" %>

<%
    // Database connection parameters
    String url = "jdbc:mysql://localhost:3306/staff";
    String username = "root";
    String password = "1234";

    // JDBC variables
    Connection connection = null;
    PreparedStatement preparedStatement = null;

    try {
        // Establish database connection
        Class.forName("com.mysql.cj.jdbc.Driver");
        connection = DriverManager.getConnection(url, username, password);

        // Retrieve form data
        
        String StaffID = request.getParameter("StaffID");
        String department = request.getParameter("department");
        String room = request.getParameter("room");
        String incident = request.getParameter("incident");
        String date = request.getParameter("date");
        String incidentID = request.getParameter("incidentID");
        
        // SQL query to insert data into the staff_info table
        String sql = "INSERT INTO incidents (incidentID, StaffID, department, room, incident, date) " +
                     "VALUES (? ,?, ?, ?, ?, ?)";

        // Create a prepared statement
        preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1, StaffID);
        preparedStatement.setString(2, department);
        preparedStatement.setString(3, room);
        preparedStatement.setString(4, incident);
        preparedStatement.setString(5, date);
        preparedStatement.setString(6, incidentID);
    
        

        // Execute the statement
        preparedStatement.executeUpdate();

        // Redirect to a success page or perform any other necessary actions
        response.sendRedirect("dashboard.html");

    } catch (ClassNotFoundException | SQLException e) {
        e.printStackTrace();
        // Handle exceptions appropriately
        response.sendRedirect("error.html");
    } finally {
        // Close resources
        try {
            if (preparedStatement != null) preparedStatement.close();
            if (connection != null) connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>

