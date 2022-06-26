/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package sample.booking;

import java.util.List;

/**
 *
 * @author cao thi phuong thuy
 */
public class BookingDetailDTO {
    private String bookingDetailID;
    private String roomID;
    private String bookingID;
    private int time;

    public String getBookingDetailID() {
        return bookingDetailID;
    }

    public String getRoomID() {
        return roomID;
    }

    public String getBookingID() {
        return bookingID;
    }

    public int getTime() {
        return time;
    }

    public void setBookingDetailID(String bookingDetailID) {
        this.bookingDetailID = bookingDetailID;
    }

    public void setRoomID(String roomID) {
        this.roomID = roomID;
    }

    public void setBookingID(String bookingID) {
        this.bookingID = bookingID;
    }

    public void setTime(int time) {
        this.time = time;
    }

    public BookingDetailDTO() {
    }

    public BookingDetailDTO(String bookingDetailID, String roomID, String bookingID, int time) {
        this.bookingDetailID = bookingDetailID;
        this.roomID = roomID;
        this.bookingID = bookingID;
        this.time = time;
    }

    
    
    
}
