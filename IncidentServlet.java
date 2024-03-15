/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.sql.*;

@WebServlet("/IncidentServlet")
public class IncidentServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Set response content type
        response.setContentType("text/html");

        PrintWriter out = response.getWriter();
        String title = "Reported Incidents ";

        // Retrieve StaffID from session
        HttpSession session = request.getSession();
        String staffID = (String) session.getAttribute("StaffID");

        // JDBC parameters
        String url = "jdbc:mysql://localhost:3306/staff";
        String user = "root";
        String password = "1234";

        try {
            // Load the JDBC driver
            Class.forName("com.mysql.jdbc.Driver");

            // Establish a connection
            Connection conn = DriverManager.getConnection(url, user, password);

            // Create a statement
            Statement stmt = conn.createStatement();

            // Execute the query to retrieve incidents for the current user
            String query = "SELECT incidentID, incident, date FROM incidents WHERE StaffID = ?";
            PreparedStatement preparedStatement = conn.prepareStatement(query);
            preparedStatement.setString(1, staffID);
            ResultSet rs = preparedStatement.executeQuery();

            // Output response HTML
            out.println("<html><head><title>" + title + "</title>");
            out.println("<link rel='stylesheet' type='text/css' href='css/styles.css'>");
            out.println("</head><body>");
            out.println("<h1>" + title + "</h1>");
            out.println("<table border='1'>");
            out.println("<tr><th>Incident ID</th><th>Incident</th><th>Date</th></tr>");

            // Process the result set
            while (rs.next()) {
                // Output each incident as a table row
                out.println("<tr>");
                out.println("<td>" + rs.getString("incidentID") + "</td>");
                out.println("<td>" + rs.getString("incident") + "</td>");
                out.println("<td>" + rs.getString("date") + "</td>");
                out.println("</tr>");
            }

            out.println("</table>");
            out.println("</body></html>");

            // Clean-up environment
            rs.close();
            stmt.close();
            conn.close();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}
