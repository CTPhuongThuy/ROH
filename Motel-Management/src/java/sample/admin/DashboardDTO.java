/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package sample.admin;

/**
 *
 * @author cao thi phuong thuy
 */
public class DashboardDTO {

    private int motelNumber;
    private int userNumber;
    private int ownerNumber;
    private int reportNumber;

    public int getMotelNumber() {
        return motelNumber;
    }

    public int getUserNumber() {
        return userNumber;
    }

    public int getOwnerNumber() {
        return ownerNumber;
    }

    public int getReportNumber() {
        return reportNumber;
    }

    public void setMotelNumber(int motelNumber) {
        this.motelNumber = motelNumber;
    }

    public void setUserNumber(int userNumber) {
        this.userNumber = userNumber;
    }

    public void setOwnerNumber(int ownerNumber) {
        this.ownerNumber = ownerNumber;
    }

    public void setReportNumber(int reportNumber) {
        this.reportNumber = reportNumber;
    }

    public DashboardDTO(int motelNumber, int userNumber, int ownerNumber, int reportNumber) {
        this.motelNumber = motelNumber;
        this.userNumber = userNumber;
        this.ownerNumber = ownerNumber;
        this.reportNumber = reportNumber;
    }

    public DashboardDTO() {
    }
    
    
   
    
}
