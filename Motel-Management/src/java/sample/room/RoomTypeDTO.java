/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package sample.room;

/**
 *
 * @author Bao
 */
public class RoomTypeDTO {
    private String roomTypeID;
    private String typeName;
    private int price;
    private int time;
    private int countRoom;
    private int countTime;
    private String motelID;
    private String image;
    private String desct;

    public void setCountRoom(int countRoom) {
        this.countRoom = countRoom;
    }

    public int getCountRoom() {
        return countRoom;
    }

    public void setTime(int time) {
        this.time = time;
    }

    public int getTime() {
        return time;
    }

    public String getRoomTypeID() {
        return roomTypeID;
    }

    public void setRoomTypeID(String roomTypeID) {
        this.roomTypeID = roomTypeID;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getMotelID() {
        return motelID;
    }

    public void setMotelID(String motelID) {
        this.motelID = motelID;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getDesct() {
        return desct;
    }

    public void setDesct(String desct) {
        this.desct = desct;
    }

    public int getCountTime() {
        return countTime;
    }

    public void setCountTime(int countTime) {
        this.countTime = countTime;
    }

    public RoomTypeDTO() {
        this.roomTypeID = "";
        this.typeName = "";
        this.price = 0;
        this.motelID = "";
        this.image = "";
        this.desct = "";
    }

    public RoomTypeDTO(String roomTypeID, String typeName, int price, String motelID, String image, String desct, int countRoom) {
        this.roomTypeID = roomTypeID;
        this.typeName = typeName;
        this.price = price;
        this.motelID = motelID;
        this.image = image;
        this.desct = desct;
        this.countRoom = countRoom;
    }

    public RoomTypeDTO(String typeName, int countTime) {
        this.typeName = typeName;
        this.countTime = countTime;
    }

 
    
}
