/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package sample.owner;

/**
 *
 * @author Bao
 */
public class FeedbackDTO {
    private String userId;
    private String feedbackID;
    private String userName;
    private String desc;
    private int rating;
    private String MotelID;
    private String image;
    private int status;
    private String bookingID;

    public String getBookingID() {
        return bookingID;
    }

    public void setBookingID(String bookingID) {
        this.bookingID = bookingID;
    }

    public FeedbackDTO(String userId, String feedbackID, String desc, int rating, String MotelID, int status, String bookingID) {
        this.userId = userId;
        this.feedbackID = feedbackID;
        this.desc = desc;
        this.rating = rating;
        this.MotelID = MotelID;
        this.status = status;
        this.bookingID = bookingID;
    }
    

    public FeedbackDTO(String userName, String desc, int rating, String image) {
        this.userName = userName;
        this.desc = desc;
        this.rating = rating;
        this.image = image;
    }
    
    public FeedbackDTO() {
        this.feedbackID = "";
        this.userName = "";
        this.desc = "";
        this.rating = 0;
        this.MotelID = "";
        this.image = "";
    }
    
     public FeedbackDTO(String userId, String feedbackID, String desc, int rating, String MotelID) {
        this.userId = userId;
        this.feedbackID = feedbackID;
        this.desc = desc;
        this.rating = rating;
        this.MotelID = MotelID;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getUserId() {
        return userId;
    }

    public FeedbackDTO(String feedbackID, String userName, String desc, int rating, String MotelID, String image) {
        this.feedbackID = feedbackID;
        this.userName = userName;
        this.desc = desc;
        this.rating = rating;
        this.MotelID = MotelID;
        this.image = image;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
    
    public String getFeedbackID() {
        return feedbackID;
    }

    public void setFeedbackID(String feedbackID) {
        this.feedbackID = feedbackID;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public String getMotelID() {
        return MotelID;
    }

    public void setMotelID(String MotelID) {
        this.MotelID = MotelID;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public FeedbackDTO(String desc, int status) {
        this.desc = desc;
        this.status = status;
    }

    public FeedbackDTO(String userId, String feedbackID, String desc, int rating, String MotelID, int status) {
        this.userId = userId;
        this.feedbackID = feedbackID;
        this.desc = desc;
        this.rating = rating;
        this.MotelID = MotelID;
        this.status = status;
    }
    
    
}
