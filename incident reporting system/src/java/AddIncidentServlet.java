/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@jakarta.servlet.annotation.WebServlet("/AddIncidentServlet")
public class AddIncidentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String StaffID = request.getParameter("StaffID");
        String department = request.getParameter("department");
        String room = request.getParameter("room");
        String incident = request.getParameter("incident");
        String date = request.getParameter("date");

        IncidentDAO.addIncidents(StaffID, department, room, incident, date);

        response.sendRedirect("dashboard.html");
    }
}
