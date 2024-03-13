/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/report-incident")
public class ReportIncidentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve user input from the request
        
        String staffId = request.getParameter("staffId");
        String department = request.getParameter("department");
        String room = request.getParameter("room");
        String description = request.getParameter("description");
        String dateReported = request.getParameter("dateReported");

        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            // Establish database connection
            connection = DatabaseConnection.getConnection();

            // Prepare SQL statement
            String sql = "INSERT INTO incidents (staff_id, dept_id, room_id, description, date_reported) VALUES (?, ?, ?, ?, ?)";
            preparedStatement = connection.prepareStatement(sql);

            // Set parameters
            preparedStatement.setString(1, staffId);
            // Retrieve dept_id and room_id based on department and room names (not implemented here)
            preparedStatement.setInt(2, getDepartmentIdByName(department));
            preparedStatement.setInt(3, getRoomIdByName(room));
            preparedStatement.setString(4, description);
            preparedStatement.setString(5, dateReported);

            // Execute the query
            int rowsAffected = preparedStatement.executeUpdate();

            // Handle the result as needed (e.g., display a success message)
           // Check if the incident reporting was successful
            if (rowsAffected > 0) {
                // Redirect to a success page or dashboard
                response.sendRedirect("dashboard.jsp");
            } else {
                // Incident reporting failed, redirect to the incident reporting page with an error message
                response.sendRedirect("report-incident.jsp?error=1");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle database-related errors (e.g., display an error message)
            response.sendRedirect("report-incident.jsp?error=2");
        } finally {
            // Close resources in a finally block
            DatabaseConnection.closeConnection(connection);
            if (preparedStatement != null) {
                try {
                    preparedStatement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
  
        }
    }

    // You may implement methods to retrieve department and room IDs by name
    private int getDepartmentIdByName(String departmentName) {
        // Implement logic to retrieve department ID by name from the database
        return 0;
    }

    private int getRoomIdByName(String roomName) {
        // Implement logic to retrieve room ID by name from the database
        return 0;
    }
}