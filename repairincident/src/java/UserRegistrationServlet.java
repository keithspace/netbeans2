/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
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
@WebServlet(urlPatterns = {"/register.jsp"})
public class UserRegistrationServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve user input from the request
        String staffId = request.getParameter("staffId");
        String name = request.getParameter("name");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phoneNumber");

        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            // Establish database connection
            connection = DatabaseConnection.getConnection();

            // Prepare SQL statement
            String sql = "INSERT INTO staff (staff_id, name, password, email, phone_number) VALUES (?, ?, ?, ?, ?)";
            preparedStatement = connection.prepareStatement(sql);

            // Set parameters
            preparedStatement.setString(1, staffId);
            preparedStatement.setString(2, name);
            preparedStatement.setString(3, password);
            preparedStatement.setString(4, email);
            preparedStatement.setString(5, phoneNumber);

            // Execute the query
            int rowsAffected = preparedStatement.executeUpdate();

            // Handle the result as needed (e.g., display a success message)
            if (rowsAffected > 0) {
                // Registration successful, you can redirect to a success page or login page
                response.sendRedirect("login.jsp");
            } else {
                // Registration failed, you can redirect to a failure page or show an error message
                response.sendRedirect("register.jsp?error=1");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle database-related errors (e.g., display an error message)
            response.sendRedirect("register.jsp?error=2");
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
}