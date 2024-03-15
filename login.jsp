<%-- 
    Document   : login
    Created on : Mar 13, 2024, 4:05:49 PM
    Author     : User
--%>

<%@ page import="java.sql.*" %>
<%@ page import="java.io.*, java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login Page</title>
    <script src="validation.js"></script>
    <style media="all">
            *,
            *:before,
            *:after {
              padding: 0;
              margin: 0;
              box-sizing: border-box;
            }

            body {
              background-color: #080710;
            }

            .background {
              width: 430px;
              height: 520px;
              position: absolute;
              transform: translate(-50%, -50%);
              left: 50%;
              top: 50%;
            }

            .background .shape {
              height: 200px;
              width: 200px;
              position: absolute;
              border-radius: 50%;
            }

            .shape:first-child {
              background: linear-gradient(#50C878,
                  #228B22);
              left: -80px;
              top: -100px;
            }

            .shape:last-child {
              background: linear-gradient(to right,
                  #B2BEB5,
                  #A9A9A9);
              right: -70px;
              bottom: -80px;
            }

            form {
              height: 520px;
              width: 400px;
              background-color: rgba(255, 255, 255, 0.13);
              position: absolute;
              transform: translate(-50%, -50%);
              top: 50%;
              left: 50%;
              border-radius: 10px;
              backdrop-filter: blur(10px);
              border: 2px solid rgba(255, 255, 255, 0.1);
              box-shadow: 0 0 40px rgba(8, 7, 16, 0.6);
              padding: 50px 35px;
            }

            form * {
              font-family: 'Poppins', sans-serif;
              color: #ffffff;
              letter-spacing: 0.5px;
              outline: none;
              border: none;
            }

            form h3 {
              font-size: 32px;
              font-weight: 500;
              line-height: 42px;
              text-align: center;
            }

            label {
              display: block;
              margin-top: 30px;
              font-size: 16px;
              font-weight: 500;
            }

            input {
              display: block;
              height: 50px;
              width: 100%;
              background-color: rgba(255, 255, 255, 0.07);
              border-radius: 3px;
              padding: 0 10px;
              margin-top: 8px;
              font-size: 14px;
              font-weight: 300;
            }

            ::placeholder {
              color: #e5e5e5;
            }

            button {
              margin-top: 50px;
              width: 100%;
              background-color: #ffffff;
              color: #080710;
              padding: 15px 0;
              font-size: 18px;
              font-weight: 600;
              border-radius: 5px;
              cursor: pointer;
            }
        </style>
</head>
<body>

<%  
   // Check if the form is submitted
   if ("POST".equalsIgnoreCase(request.getMethod())) {
    String staffID = request.getParameter("StaffID");
    String pass = request.getParameter("pass");

    // Database connection parameters
    String url = "jdbc:mysql://localhost:3306/staff";
    String user = "root";
    String password = "1234";

    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;

    try {
        // Load the JDBC driver
        Class.forName("com.mysql.cj.jdbc.Driver");

        // Establish a connection
        conn = DriverManager.getConnection(url, user, password);

        // Create a statement
        stmt = conn.createStatement();

        // Execute the query to check staff credentials
        String query = "SELECT * FROM user WHERE StaffID='" + staffID + "' AND password='" + pass + "'";
        rs = stmt.executeQuery(query);

        if (rs.next()) {
            // Staff ID and password are correct
            // Set the staff ID as a session attribute
            session.setAttribute("StaffID", staffID);
            // Redirect to the home page or perform other actions
            response.sendRedirect("dashboard.jsp");
           
        } else {
            // Invalid credentials
            out.println("<p style='color:red;'>Invalid staff ID or password. Please try again.</p>");
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        // Close the resources
        try {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
   }   
%>


  <div class="background">
    <div class="shape"></div>
    <div class="shape"></div>
  </div>
<form action="login.jsp" method="post" onsubmit="return validateForm()">
    <h3>Login</h3>

    <label for="StaffID">Staff ID :</label>
    <input type="text" name="StaffID" id="StaffID" placeholder="Enter your Staff ID" required>

    <label for="password">Password :</label>
    <input type="password" name="pass" id="pass" placeholder="Enter your password" required><br><br>
    <p>Don't have an account? <a href="signup.html">Sign Up</a>
    <button>Log In</button>
  </form>

</body>
</html>

