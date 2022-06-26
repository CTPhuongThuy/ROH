/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package sample.admin;

/**
 *
 * @author cao thi phuong thuy
 */
public class ReportDTO {
    
    private String reportID;
    private String userId;
    private String motelID;
    private String title;
    private String desct;
    private int status;
    private String date;

    public void setDate(String date) {
        this.date = date;
    }

    public String getDate() {
        return date;
    }

    public ReportDTO(String reportID, String userId, String motelID, String title, String desct, int status, String date) {
        this.reportID = reportID;
        this.userId = userId;
        this.motelID = motelID;
        this.title = title;
        this.desct = desct;
        this.status = status;
        this.date = date;
    }

    public String getReportID() {
        return reportID;
    }

    public String getUserId() {
        return userId;
    }

    public String getMotelID() {
        return motelID;
    }

    public String getTitle() {
        return title;
    }

    public String getDesct() {
        return desct;
    }

    public int getStatus() {
        return status;
    }

    public void setReportID(String reportID) {
        this.reportID = reportID;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public void setMotelID(String motelID) {
        this.motelID = motelID;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setDesct(String desct) {
        this.desct = desct;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public ReportDTO(String reportID, String userId, String motelID, String title, String desct, int status) {
        this.reportID = reportID;
        this.userId = userId;
        this.motelID = motelID;
        this.title = title;
        this.desct = desct;
        this.status = status;
    }

    public ReportDTO() {
    }

    
}
