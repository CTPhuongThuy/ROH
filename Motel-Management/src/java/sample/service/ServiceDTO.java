/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.service;

/**
 *
 * @author Bao
 */
public class ServiceDTO {
    private String serviceId;
    private String name;
    private int price;
    private int quantity;
    private int status;
    private String MotelID;
    
    public String getServiceId() {
        return serviceId;
    }

    public void setServiceId(String serviceId) {
        this.serviceId = serviceId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
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

    public ServiceDTO() {
        this.serviceId = "";
        this.name = "";
        this.price = 0;
        this.quantity = 0;
        this.status = 0;
        this.MotelID = "";
    }

    public ServiceDTO(String serviceId, String name, int price, int quantity, int status) {
        this.serviceId = serviceId;
        this.name = name;
        this.price = price;
        this.quantity = quantity;
        this.status = status;
    }

    public ServiceDTO(String name, int status) {
        this.name = name;
        this.status = status;
    }

    public ServiceDTO(String serviceId, String name, int price, int status, String MotelID) {
        this.serviceId = serviceId;
        this.name = name;
        this.price = price;
        this.status = status;
        this.MotelID = MotelID;
    }
     
}
