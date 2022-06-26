/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package sample.room;

/**
 *
 * @author cao thi phuong thuy
 */
public class TestDTO {
  private String roomTypeID;
    private String typeName;
    private int price;
    private int time;
    private int countRoom;
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

    public TestDTO() {
        this.roomTypeID = "";
        this.typeName = "";
        this.price = 0;
        this.motelID = "";
        this.image = "";
        this.desct = "";
    }
     public TestDTO(String roomTypeID, String typeName,int price, int time, int countRoom) {
        this.roomTypeID = roomTypeID;
        this.typeName = typeName;
        this.price = price;
        this.time = time;
        this.countRoom = countRoom;
    }
}
