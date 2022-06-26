/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.users;

import java.sql.Date;

public class UserError {

    private String userIdError;
    private String fullNameError;
    private String imageError;
    private String genderError;
    private String birthDayError;
    private String citizenNumberError;
    private String phoneError;
    private String gmailError;
    private String addressError;
    private String passwordError;
    private String roleError;
    private int statusError;
    private String confirmpasswordError;

    public UserError() {
        this.userIdError = "";
        this.fullNameError = "";
        this.imageError = "";
        this.genderError = "";
        this.birthDayError = "";
        this.citizenNumberError = "";
        this.phoneError = "";
        this.gmailError = "";
        this.addressError = "";
        this.passwordError = "";
        this.roleError = "";
        this.statusError = 0;
        this.confirmpasswordError = "";
    }

    public UserError(String userIdError, String fullNameError, String phoneError, String gmailError, String addressError, String passwordError, String roleError, String confirmpasswordError) {
        this.userIdError = userIdError;
        this.fullNameError = fullNameError;
        this.phoneError = phoneError;
        this.gmailError = gmailError;
        this.addressError = addressError;
        this.passwordError = passwordError;
        this.roleError = roleError;
        this.confirmpasswordError = confirmpasswordError;
    }

    public UserError(String userIdError, String fullNameError, String passwordError, String roleError) {
        this.userIdError = userIdError;
        this.fullNameError = fullNameError;
        this.passwordError = passwordError;
        this.roleError = roleError;
    }

    public UserError(String userIdError, String fullNameError, String imageError, String genderError, String birthDayError, String citizenNumberError, String phoneError, String gmailError, String addressError, String passwordError, String roleError, int statusError) {
        this.userIdError = userIdError;
        this.fullNameError = fullNameError;
        this.imageError = imageError;
        this.genderError = genderError;
        this.birthDayError = birthDayError;
        this.citizenNumberError = citizenNumberError;
        this.phoneError = phoneError;
        this.gmailError = gmailError;
        this.addressError = addressError;
        this.passwordError = passwordError;
        this.roleError = roleError;
        this.statusError = statusError;
    }

    public String getUserIdError() {
        return userIdError;
    }

    public void setUserIdError(String userIdError) {
        this.userIdError = userIdError;
    }

    public String getFullNameError() {
        return fullNameError;
    }

    public void setFullNameError(String fullNameError) {
        this.fullNameError = fullNameError;
    }

    public String getImageError() {
        return imageError;
    }

    public void setImageError(String imageError) {
        this.imageError = imageError;
    }

    public String getGenderError() {
        return genderError;
    }

    public void setGenderError(String genderError) {
        this.genderError = genderError;
    }

    public String getBirthDayError() {
        return birthDayError;
    }

    public void setBirthDayError(String birthDayError) {
        this.birthDayError = birthDayError;
    }

    public String getCitizenNumberError() {
        return citizenNumberError;
    }

    public void setCitizenNumberError(String citizenNumberError) {
        this.citizenNumberError = citizenNumberError;
    }

    public String getPhoneError() {
        return phoneError;
    }

    public void setPhoneError(String phoneError) {
        this.phoneError = phoneError;
    }

    public String getGmailError() {
        return gmailError;
    }

    public void setGmailError(String gmailError) {
        this.gmailError = gmailError;
    }

    public String getAddressError() {
        return addressError;
    }

    public void setAddressError(String addressError) {
        this.addressError = addressError;
    }

    public String getPasswordError() {
        return passwordError;
    }

    public void setPasswordError(String passwordError) {
        this.passwordError = passwordError;
    }

    public String getRoleError() {
        return roleError;
    }

    public void setRoleError(String roleError) {
        this.roleError = roleError;
    }

    public int getStatusError() {
        return statusError;
    }

    public void setStatusError(int statusError) {
        this.statusError = statusError;
    }

    public String getConfirmpasswordError() {
        return confirmpasswordError;
    }

    public void setConfirmpasswordError(String confirmpasswordError) {
        this.confirmpasswordError = confirmpasswordError;
    }

}
