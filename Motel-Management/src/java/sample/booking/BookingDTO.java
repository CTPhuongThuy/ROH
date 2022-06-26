/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package sample.booking;

/**
 *
 * @author cao thi phuong thuy
 */
public class BookingDTO {
     private String bookingID;
    private String date;
    private String desct;
    private String userId;
    private int status;
    private int total;

    public String getBookingID() {
        return bookingID;
    }

    public String getDate() {
        return date;
    }

    public String getDesct() {
        return desct;
    }

    public String getUserId() {
        return userId;
    }

    public int getStatus() {
        return status;
    }

    public int getTotal() {
        return total;
    }

    public void setBookingID(String bookingID) {
        this.bookingID = bookingID;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public void setDesct(String desct) {
        this.desct = desct;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public BookingDTO(String bookingID, String date, String desct, String userId, int status, int total) {
        this.bookingID = bookingID;
        this.date = date;
        this.desct = desct;
        this.userId = userId;
        this.status = status;
        this.total = total;
    }

    public BookingDTO() {
    }
    
    
}
