/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/view-reports")
public class ViewReportsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve user input from the request (staffId)
        String staffId = request.getParameter("staffId");

        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            // Establish database connection
            connection = DatabaseConnection.getConnection();

            // Prepare SQL statement
            String sql = "SELECT * FROM incidents WHERE staff_id = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, staffId);

            // Execute the query
            resultSet = preparedStatement.executeQuery();

            // Process the results
            List<Incident> incidents = new ArrayList<>();
            while (resultSet.next()) {
                // Retrieve data from the result set and create Incident objects
                Incident incident = new Incident(
                    resultSet.getInt("incident_id"),
                    resultSet.getString("description"),
                    resultSet.getString("date_reported")
                );
                incidents.add(incident);
            }

            // Pass the incidents list to the JSP page
            request.setAttribute("incidents", incidents);
            request.getRequestDispatcher("view-reports.jsp").forward(request, response);

        } catch (SQLException e) {
            e.printStackTrace();
            // Handle database-related errors (e.g., display an error message)
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
            if (resultSet != null) {
                try {
                    resultSet.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
