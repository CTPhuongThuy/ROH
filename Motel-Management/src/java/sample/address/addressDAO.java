/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package sample.address;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import sample.utils.DBUtils;

/**
 *
 * @author Bao
 */
public class addressDAO {

    private static final String GET_LIST_DISTRICT = "SELECT DistrictID, Name, CityID FROM tblDistrict";
    private static final String GET_LIST_city = "SELECT Name, CityID FROM tblCity";
    
    public List<cityDTO> getListCity() throws SQLException {
        List<cityDTO> listCity = new ArrayList();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_LIST_city);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String cityName = rs.getString("Name");
                    String citiID = rs.getString("CityID");
                    listCity.add(new cityDTO(citiID, cityName));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return listCity;
    }
    
    public List<districtDTO> getListDistrict() throws SQLException {
        List<districtDTO> listDistrict = new ArrayList();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_LIST_DISTRICT);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String districtID = rs.getString("DistrictID");
                    String districtName = rs.getString("Name");
                    String citiID = rs.getString("CityID");
                    listDistrict.add(new districtDTO(districtID, districtName, citiID));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return listDistrict;
    }
}
