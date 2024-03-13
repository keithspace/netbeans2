<%-- 
    Document   : view-reports
    Created on : Mar 6, 2024, 3:02:55 PM
    Author     : User
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Reported Incidents</title>
</head>
<body>
    <h2>View Reported Incidents</h2>

    <%-- Display error message if viewing incidents fails --%>
    <% if (request.getParameter("error") != null && request.getParameter("error").equals("1")) { %>
        <p style="color: red;">Failed to view incidents. Please try again.</p>
    <% } %>

    <table border="1">
        <tr>
            <th>Incident ID</th>
            <th>Department Name</th>
            <th>Room Name</th>
            <th>Description</th>
            <th>Date Reported</th>
        </tr>
        <%-- Iterate through the list of incidents and display them in the table --%>
        <c:forEach var="incident" items="${incidents}">
            <tr>
                <td>${incident.incidentId}</td>
                <td>${incident.departmentName}</td>
                <td>${incident.roomName}</td>
                <td>${incident.description}</td>
                <td>${incident.dateReported}</td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
