/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author User
 */
@WebServlet(urlPatterns = {"/login"})
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve user input from the request
        String staffId = request.getParameter("staffId");
        String password = request.getParameter("password");

        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            // Establish database connection
            connection = DatabaseConnection.getConnection();

            // Prepare SQL statement
            String sql = "SELECT * FROM staff WHERE staff_id = ? AND password = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, staffId);
            preparedStatement.setString(2, password);

            // Execute the query
            resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                // User is authenticated
                // Redirect to the dashboard or perform other actions
                response.sendRedirect("dashboard.jsp");
            } else {
                // Invalid credentials, redirect to login page with an error message
                response.sendRedirect("login.jsp?error=1");
            }

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