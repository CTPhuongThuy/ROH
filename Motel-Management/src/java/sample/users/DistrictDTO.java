/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package sample.users;

/**
 *
 * @author cao thi phuong thuy 

 */
public class DistrictDTO {
    
    private String districtID;
    private String name;
    private String cityID;

    public String getDistrictID() {
        return districtID;
    }

    public String getName() {
        return name;
    }

    public String getCityID() {
        return cityID;
    }

    public void setDistrictID(String districtID) {
        this.districtID = districtID;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setCityID(String cityID) {
        this.cityID = cityID;
    }

    public DistrictDTO() {
    }

    public DistrictDTO(String districtID, String name, String cityID) {
        this.districtID = districtID;
        this.name = name;
        this.cityID = cityID;
    }
    
}
