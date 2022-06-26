/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package sample.owner;

/**
 *
 * @author Bao
 */
public class OverviewDTO {
    private int roomNumber;
    private int serviceNumber;
    private int feedbackNumber;
    private int incomeNumber;

    public OverviewDTO() {
    }

    public OverviewDTO(int roomNumber, int serviceNumber, int feedbackNumber, int incomeNumber) {
        this.roomNumber = roomNumber;
        this.serviceNumber = serviceNumber;
        this.feedbackNumber = feedbackNumber;
        this.incomeNumber = incomeNumber;
    }

    public int getRoomNumber() {
        return roomNumber;
    }

    public void setRoomNumber(int roomNumber) {
        this.roomNumber = roomNumber;
    }

    public int getServiceNumber() {
        return serviceNumber;
    }

    public void setServiceNumber(int serviceNumber) {
        this.serviceNumber = serviceNumber;
    }

    public int getFeedbackNumber() {
        return feedbackNumber;
    }

    public void setFeedbackNumber(int feedbackNumber) {
        this.feedbackNumber = feedbackNumber;
    }

    public int getIncomeNumber() {
        return incomeNumber;
    }

    public void setIncomeNumber(int incomeNumber) {
        this.incomeNumber = incomeNumber;
    }
    
    
}
