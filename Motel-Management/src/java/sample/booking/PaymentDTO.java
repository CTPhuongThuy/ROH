/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package sample.booking;

/**
 *
 * @author cao thi phuong thuy
 */
public class PaymentDTO {
       private String paymentID;
    private String desct;
    private String paymentTime;
    private String sender;
    private String Receiver;
    private String paymentTypeName;

    public String getPaymentID() {
        return paymentID;
    }

    public String getDesct() {
        return desct;
    }

    public String getPaymentTime() {
        return paymentTime;
    }

    public String getSender() {
        return sender;
    }

    public String getReceiver() {
        return Receiver;
    }

    public String getPaymentTypeName() {
        return paymentTypeName;
    }


    public void setPaymentID(String paymentID) {
        this.paymentID = paymentID;
    }

    public void setDesct(String desct) {
        this.desct = desct;
    }

    public void setPaymentTime(String paymentTime) {
        this.paymentTime = paymentTime;
    }

    public void setSender(String sender) {
        this.sender = sender;
    }

    public void setReceiver(String Receiver) {
        this.Receiver = Receiver;
    }

    public void setPaymentTypeName(String paymentTypeName) {
        this.paymentTypeName = paymentTypeName;
    }

    public PaymentDTO(String paymentID, String desct, String paymentTime, String sender, String Receiver, String paymentTypeName) {
        this.paymentID = paymentID;
        this.desct = desct;
        this.paymentTime = paymentTime;
        this.sender = sender;
        this.Receiver = Receiver;
        this.paymentTypeName = paymentTypeName;
    }

    public PaymentDTO() {
    }
    
}
