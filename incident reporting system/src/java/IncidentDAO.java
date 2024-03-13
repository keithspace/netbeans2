/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author User
 */
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class IncidentDAO {
    private static final String URL = "jdbc:mysql://localhost:3306/staff";
    private static final String USERNAME = "root";
    private static final String PASSWORD = "1234";

    public static void addIncidents(String StaffID,String department, String room, String incident, String date) {
        try (Connection connection = DriverManager.getConnection(URL, USERNAME, PASSWORD)) {
            String query = "INSERT INTO incidents (StaffID, department, room, incident, date) VALUES (?, ?, ?, ?, ?)";
            try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
                preparedStatement.setString(1, StaffID);
                preparedStatement.setString(2, department);
                preparedStatement.setString(3, room);
                preparedStatement.setString(4, incident);
                preparedStatement.setString(5, date);
                preparedStatement.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}


