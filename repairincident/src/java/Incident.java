/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author User
 */
public class Incident {
    private int incidentId;
    private String description;
    private String dateReported;

    // Constructors, getters, and setters

    public Incident(int incidentId, String description, String dateReported) {
        this.incidentId = incidentId;
        this.description = description;
        this.dateReported = dateReported;
    }

    // Getters and setters for other attributes

    public int getIncidentId() {
        return incidentId;
    }

    public void setIncidentId(int incidentId) {
        this.incidentId = incidentId;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getDateReported() {
        return dateReported;
    }

    public void setDateReported(String dateReported) {
        this.dateReported = dateReported;
    }
}

