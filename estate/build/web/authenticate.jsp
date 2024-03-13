<%-- 
    Document   : authenticate
    Created on : Mar 13, 2024, 11:47:09 AM
    Author     : User
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String staffID = request.getParameter("staffID");
    String password = request.getParameter("password");
    
    String url = "jdbc:mysql://localhost:3306/staff";
    String user = "root";
    String pass = "1234"; 
    
    boolean isAuthenticated = false;
    
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        try (Connection conn = DriverManager.getConnection(url, user, pass)) {
            String sql = "SELECT * FROM user WHERE StaffID=? AND password=?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, staffID);
            stmt.setString(2, password);
            ResultSet rs = stmt.executeQuery();
            
            if (rs.next()) {
                isAuthenticated = true;
            }
            rs.close();
            stmt.close();
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    
    if (isAuthenticated) {
        response.sendRedirect("reporting.html"); 
    } else {
        // Forward the request back to login.jsp with an error message
        request.setAttribute("error", "Invalid staff ID or password. Please try again.");
        request.getRequestDispatcher("index.html").forward(request, response);
    }
%>

