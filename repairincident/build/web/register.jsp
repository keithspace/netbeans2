<%-- 
    Document   : register
    Created on : Mar 6, 2024, 2:44:19 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Registration</title>
</head>
<body>
    <h2>User Registration</h2>
     <%-- Display error message if registration fails --%>
    <% if (request.getParameter("error") != null && request.getParameter("error").equals("1")) { %>
        <p style="color: red;">Registration failed. Please try again.</p>
    <% } else if (request.getParameter("error") != null && request.getParameter("error").equals("2")) { %>
        <p style="color: red;">An error occurred. Please try again later.</p>
    <% } %>

    <form action="dashboard.jsp" method="post">
        Staff ID: <input type="text" name="staffId" required><br>
        Name: <input type="text" name="name" required><br>
        Password: <input type="password" name="password" required><br>
        Email: <input type="email" name="email" required><br>
        Phone Number: <input type="tel" name="phoneNumber" required><br>
        <input type="submit" value="Register">
    </form>
</body>
</html>