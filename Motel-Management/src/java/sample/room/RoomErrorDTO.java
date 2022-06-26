/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package sample.room;

/**
 *
 * @author Bao
 */
public class RoomErrorDTO {
    private String roomIdError;
    private String nameError;
    private String imageError;
    private String priceError;
    private String DescError;
    private String statusError;
    private String MotelIDError;

    public RoomErrorDTO() {
        this.roomIdError = "";
        this.nameError = "";
        this.imageError = "";
        this.priceError = "";
        this.DescError = "";
        this.statusError = "";
        this.MotelIDError = "";
    }

    public RoomErrorDTO(String roomIdError, String nameError, String imageError, String priceError, String DescError, String statusError, String MotelIDError) {
        this.roomIdError = roomIdError;
        this.nameError = nameError;
        this.imageError = imageError;
        this.priceError = priceError;
        this.DescError = DescError;
        this.statusError = statusError;
        this.MotelIDError = MotelIDError;
    }

    public String getRoomIdError() {
        return roomIdError;
    }

    public void setRoomIdError(String roomIdError) {
        this.roomIdError = roomIdError;
    }

    public String getNameError() {
        return nameError;
    }

    public void setNameError(String nameError) {
        this.nameError = nameError;
    }

    public String getImageError() {
        return imageError;
    }

    public void setImageError(String imageError) {
        this.imageError = imageError;
    }

    public String getPriceError() {
        return priceError;
    }

    public void setPriceError(String priceError) {
        this.priceError = priceError;
    }

    public String getDescError() {
        return DescError;
    }

    public void setDescError(String DescError) {
        this.DescError = DescError;
    }

    public String getStatusError() {
        return statusError;
    }

    public void setStatusError(String statusError) {
        this.statusError = statusError;
    }

    public String getMotelIDError() {
        return MotelIDError;
    }

    public void setMotelIDError(String MotelIDError) {
        this.MotelIDError = MotelIDError;
    }
    
    
}
