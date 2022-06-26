/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package sample.service;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import sample.utils.DBUtils;
/**
 *
 * @author cao thi phuong thuy
 */
public class ServiceDAO {
    private static final String GET_SERVICE_BOOKING = "SELECT  s.ServiceID, s.ServiceName, s.Price, d.Quantity FROM tblBookingServiceDetail as d, tblService as s WHERE s.ServiceID = d.ServiceID AND BookingID = ?";
    private static final String GET_SERVICE = "SELECT  s.ServiceName, s.Status, s.Price,s.ServiceID , m.Name FROM tblMotel as m, tblService as s WHERE s.MotelID = m.MotelID AND s.Status = 1 AND m.MotelID =? AND s.Status = 1";
    private static final String DELETE_SERVICE = "UPDATE tblService SET Status = 0 WHERE ServiceID = ?";    
    private static final String UPDATE_SERVICE = "UPDATE tblService SET ServiceName = ?, Price = ? WHERE ServiceID = ?"; 
    
    public boolean updateService(ServiceDTO service) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATE_SERVICE);
                ptm.setString(1, service.getName());
                ptm.setInt(2, service.getPrice());
                ptm.setString(3, service.getServiceId());
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }
    
    public boolean deleteService(String serviceID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(DELETE_SERVICE);
                ptm.setString(1, serviceID);
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }
    
        public List<ServiceDTO> getServiceBooking(String bookingID) throws SQLException {
        List<ServiceDTO> listService = new ArrayList();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            while (rs.next()) {
                ptm = conn.prepareStatement(GET_SERVICE_BOOKING);
                ptm.setString(1, bookingID);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String serviceID = rs.getString("ServiceID");
                    String serviceName = rs.getString("ServiceName");
                    int price = rs.getInt("Price");
                    int quantity = rs.getInt("Quantity");
                    listService.add(new ServiceDTO(serviceID, serviceName, price, quantity,1));
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
        return listService;
    }
public List<ServiceDTO> searchservice(String motelID) throws SQLException {
        List<ServiceDTO> listService = new ArrayList();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_SERVICE);
                ptm.setString(1,motelID);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String serviceID = rs.getString("ServiceID");
                    String serviceName = rs.getString("ServiceName");
                    String motelName = rs.getString("Name");
                    int price = rs.getInt("Price");
                    int status = rs.getInt("Status");
                    listService.add(new ServiceDTO(serviceID, serviceName, price, status, motelName));
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
        return listService;
    }

}

