/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package sample.service;

/**
 *
 * @author Bao
 */
public class ServiceErrorDTO {
    private String serviceIdError;
    private String nameError;
    private String priceError;
    private String quantityError;
    private String statusError;
    private String MotelIDError;

    public String getServiceIdError() {
        return serviceIdError;
    }

    public void setServiceIdError(String serviceIdError) {
        this.serviceIdError = serviceIdError;
    }

    public String getNameError() {
        return nameError;
    }

    public void setNameError(String nameError) {
        this.nameError = nameError;
    }

    public String getPriceError() {
        return priceError;
    }

    public void setPriceError(String priceError) {
        this.priceError = priceError;
    }

    public String getQuantityError() {
        return quantityError;
    }

    public void setQuantityError(String quantityError) {
        this.quantityError = quantityError;
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

    public ServiceErrorDTO(String serviceIdError, String nameError, String priceError, String quantityError, String statusError, String MotelIDError) {
        this.serviceIdError = serviceIdError;
        this.nameError = nameError;
        this.priceError = priceError;
        this.quantityError = quantityError;
        this.statusError = statusError;
        this.MotelIDError = MotelIDError;
    }

    public ServiceErrorDTO() {
        this.serviceIdError = "";
        this.nameError = "";
        this.priceError = "";
        this.quantityError = "";
        this.statusError = "";
        this.MotelIDError = "";
    }
    
    
}
