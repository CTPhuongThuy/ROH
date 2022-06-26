/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package sample.owner;

/**
 *
 * @author Bao
 */
public class RoomDetailDTO {
    private String userID;
    private int status;
    private String bookingID;
    private String roomID;
    private String roomName;
    private String roomType;
    private String roomTypeID;
    private String motelID;
    private String address;
    private String district;
    private String city;
    private String bookingDate;
    private int time;

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getBookingID() {
        return bookingID;
    }

    public void setBookingID(String bookingID) {
        this.bookingID = bookingID;
    }

    public String getRoomID() {
        return roomID;
    }

    public void setRoomID(String roomID) {
        this.roomID = roomID;
    }

    public String getRoomType() {
        return roomType;
    }

    public void setRoomType(String roomType) {
        this.roomType = roomType;
    }

    public String getMotelID() {
        return motelID;
    }

    public void setMotelID(String motelID) {
        this.motelID = motelID;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getBookingDate() {
        return bookingDate;
    }

    public void setBookingDate(String bookingDate) {
        this.bookingDate = bookingDate;
    }

    public int getTime() {
        return time;
    }

    public void setTime(int time) {
        this.time = time;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getRoomName() {
        return roomName;
    }

    public void setRoomName(String roomName) {
        this.roomName = roomName;
    }

    public String getRoomTypeID() {
        return roomTypeID;
    }

    public void setRoomTypeID(String roomTypeID) {
        this.roomTypeID = roomTypeID;
    }
    
    

    public RoomDetailDTO(String roomTypeID, String roomName,String userID,int status, String bookingID, String roomID, String roomType, String motelID, String address, String district, String city, String bookingDate, int time) {
        this.roomTypeID = roomTypeID;
        this.roomName = roomName;
        this.userID = userID;
        this.status = status;
        this.bookingID = bookingID;
        this.roomID = roomID;
        this.roomType = roomType;
        this.motelID = motelID;
        this.address = address;
        this.district = district;
        this.city = city;
        this.bookingDate = bookingDate;
        this.time = time;
    }

    public RoomDetailDTO() {
        this.roomTypeID = "";
        this.roomName = "";
        this.userID = "";
        this.status = 0;
        this.bookingID = "";
        this.roomID = "";
        this.roomType = "";
        this.motelID = "";
        this.address = "";
        this.district = "";
        this.city = "";
        this.bookingDate = "";
        this.time = 0;
    }
}
