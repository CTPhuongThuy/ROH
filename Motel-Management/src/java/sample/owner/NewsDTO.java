/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package sample.owner;

/**
 *
 * @author Bao
 */
public class NewsDTO {
    private String userID;
    private int price;
    private String roomName;
    private String status;

    public NewsDTO() {
        this.userID = "";
        this.price = 0;
        this.roomName = "";
        this.status = "";
    }

    public NewsDTO(String userID, int price, String roomName, String status) {
        this.userID = userID;
        this.price = price;
        this.roomName = roomName;
        this.status = status;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getRoomName() {
        return roomName;
    }

    public void setRoomName(String roomName) {
        this.roomName = roomName;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
    
}
