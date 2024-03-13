<%-- 
    Document   : login
    Created on : Mar 6, 2024, 3:11:53 PM
    Author     : User
--%>

<<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login</title>
</head>
<body>
    <h2>Login</h2>
    <form action="reportin" method="post">
        Staff ID: <input type="text" name="staffId" required><br>
        Password: <input type="password" name="password" required><br>
        <input type="submit" value="Login">
    </form>
     Don't have an account?<a href="register.jsp">Sign Up</a>
</body>
</html>

