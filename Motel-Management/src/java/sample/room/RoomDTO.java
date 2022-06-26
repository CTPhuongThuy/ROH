/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.room;

/**
 *
 * @author Bao
 */
public class RoomDTO {
    private String roomId;
    private String name;
    private String image;
    private int price;
    private String Desc;
    private int status;
    private String MotelID;
    private String roomType;

    public String getRoomType() {
        return roomType;
    }

    public void setRoomType(String roomType) {
        this.roomType = roomType;
    }
    
    public String getRoomId() {
        return roomId;
    }

    public void setRoomId(String roomId) {
        this.roomId = roomId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getDesc() {
        return Desc;
    }

    public void setDesc(String Desc) {
        this.Desc = Desc;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getMotelID() {
        return MotelID;
    }

    public void setMotelID(String MotelID) {
        this.MotelID = MotelID;
    }
    
    

    public RoomDTO() {
        this.roomId = "";
        this.name = "";
        this.image = "";
        this.price = 0;
        this.Desc = "";
        this.MotelID = "";
        this.status = 0;
    }

    public RoomDTO(String roomId, String name, String image, int price, String Desc, String MotelID, int status) {
        this.roomId = roomId;
        this.name = name;
        this.image = image;
        this.price = price;
        this.Desc = Desc;
        this.MotelID = MotelID;
        this.status = status;
    }

    public RoomDTO(String roomId, String name, String Desc,String roomType, int status, String MotelID) {
        this.roomId = roomId;
        this.name = name;
        this.Desc = Desc;
        this.roomType = roomType;
        this.status = status;
        this.MotelID = MotelID;
    }
    
    
    
}
