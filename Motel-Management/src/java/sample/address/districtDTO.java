/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package sample.address;

/**
 *
 * @author Bao
 */
public class districtDTO {
    private String districtID;
    private String districtName;
    private String CityID;

    public districtDTO(String districtID, String districtName, String CityID) {
        this.districtID = districtID;
        this.districtName = districtName;
        this.CityID = CityID;
    }

    public districtDTO() {
        this.districtID = "";
        this.districtName = "";
        this.CityID = "";
    }

    public String getDistrictID() {
        return districtID;
    }

    public void setDistrictID(String districtID) {
        this.districtID = districtID;
    }

    public String getDistrictName() {
        return districtName;
    }

    public void setDistrictName(String districtName) {
        this.districtName = districtName;
    }

    public String getCityID() {
        return CityID;
    }

    public void setCityID(String CityID) {
        this.CityID = CityID;
    }
    
    
}
