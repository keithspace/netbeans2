<%-- 
    Document   : report-incident
    Created on : Mar 6, 2024, 4:11:55 PM
    Author     : User
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Report Incident</title>
</head>
<body>
    <h2>Report Incident</h2>

    <%-- Display error message if incident reporting fails --%>
    <% if (request.getParameter("error") != null && request.getParameter("error").equals("1")) { %>
        <p style="color: red;">Incident reporting failed. Please try again.</p>
    <% } %>

    <form action="report-incident" method="post">
        Department Name: <input type="text" name="departmentName" required><br>
        Room Name: <input type="text" name="roomName" required><br>
        Description: <textarea name="description" required></textarea><br>
        Date Reported: <input type="text" name="dateReported" placeholder="YYYY-MM-DD" required><br>
        <input type="submit" value="Submit Incident Report">
    </form>
</body>
</html>

