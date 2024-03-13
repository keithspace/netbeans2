<%-- 
    Document   : dashboard
    Created on : Mar 6, 2024, 4:11:03 PM
    Author     : User
--%>

<<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Dashboard</title>
</head>
<body>
    <h2>Welcome to the Dashboard</h2>

    <form action="report-incident" method="post">
        <input type="submit" value="Report Incident">
    </form>

    <form action="view-reports" method="get">
        <input type="submit" value="View Reported Incidents">
    </form>
</body>
</html>

