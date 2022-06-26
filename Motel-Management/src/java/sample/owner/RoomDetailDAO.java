/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package sample.owner;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import sample.room.RoomTypeDTO;
import sample.users.UserDTO;
import sample.utils.DBUtils;

/**
 *
 * @author Bao
 */
public class RoomDetailDAO {
    private static final String GET_ROOM_DETAIL="SELECT b.UserID, r.Status, b.BookingID, r.RoomID, rt.TypeName,m.MotelID,m.Address, dt.Name as district, c.Name as city, b.BookingDate,bd.Time FROM tblCity as c, tblDistrict as dt, tblMotel as m, tblRoomType as rt, tblRoom as r,tblBookingDetail as bd, tblBooking as b\n" +
                                            "WHERE c.CityID = dt.CityID AND dt.DistrictID = m.DistrictID AND m.MotelID = rt.MotelID AND rt.RoomTypeID = r.RoomTypeID AND r.RoomID = bd.RoomID AND bd.BookingID = b.BookingID AND r.RoomID= ? AND b.Status =2";
    private static final String GET_BOOKING_PRICE ="SELECT b.BookingID, r.RoomID, rt.Price, bd.Time FROM tblBooking as b , tblBookingDetail as bd, tblRoom as r, tblRoomType as rt \n" +
                                                   "WHERE b.BookingID = bd.BookingID AND bd.RoomID = r.RoomID AND r.RoomTypeID = rt.RoomTypeID AND b.BookingID = ?";
    private static final String GET_ROOM_DETAIL_NULL = "SELECT  r.Name as RoomName,r.RoomTypeID,r.Status, r.RoomID, rt.TypeName,m.MotelID,m.Address, dt.Name as district, c.Name as city FROM tblCity as c, tblDistrict as dt, tblMotel as m, tblRoomType as rt, tblRoom as r\n" +
                                                       "WHERE c.CityID = dt.CityID AND dt.DistrictID = m.DistrictID AND m.MotelID = rt.MotelID AND rt.RoomTypeID = r.RoomTypeID AND r.RoomID= ? ";
     private static final String GET_ROOMTYPE = "SELECT rt.RoomTypeID, rt.TypeName FROM tblMotel as m, tblRoomType as rt WHERE m.MotelID = rt.MotelID AND m.MotelID = ?";
     
     public List<RoomTypeDTO> getRoomType(String motelID) throws SQLException {
        List<RoomTypeDTO> listRoomType = new ArrayList();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_ROOMTYPE);
                ptm.setString(1, motelID);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String roomtypeID = rs.getString("RoomTypeID");
                    String TypeName = rs.getString("TypeName");
                    listRoomType.add(new RoomTypeDTO(roomtypeID, TypeName, 0, "", "", "",0));
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
        return listRoomType;
    }
     
    public RoomDetailDTO getRoomDetailNull(String roomID) throws SQLException {
        RoomDetailDTO roomDetail = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_ROOM_DETAIL_NULL);
                ptm.setString(1, roomID);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    String roomTypeID = rs.getString("RoomTypeID");
                    String roomName = rs.getString("RoomName");
                    int status = rs.getInt("Status");
                    String typeName = rs.getString("TypeName");                  
                    String motelID = rs.getString("MotelID");
                    String address = rs.getString("Address");
                    String district = rs.getString("district");
                    String city = rs.getString("city");
                     roomDetail = new RoomDetailDTO(roomTypeID,roomName,"...",status, "", roomID, typeName, motelID, address, district, city, "...", 0);
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
        return roomDetail;
    }
    
    public int getBookingPrice(String bookingID) throws SQLException {
        int total = 0;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_BOOKING_PRICE);
                ptm.setString(1, bookingID);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int price = rs.getInt("Price");
                    int time = rs.getInt("Time");
                    total += price * time;    
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
        return total;
    }
    
    public RoomDetailDTO getRoomDetail(String roomID) throws SQLException {
        RoomDetailDTO roomDetail = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_ROOM_DETAIL);
                ptm.setString(1, roomID);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    String userID = rs.getString("UserID");
                    int status = rs.getInt("Status");
                    String bookingID = rs.getString("BookingID");
                    String typeName = rs.getString("TypeName");                  
                    String motelID = rs.getString("MotelID");
                    String address = rs.getString("Address");
                    String district = rs.getString("district");
                    String city = rs.getString("city");
                    String bookingDate = rs.getString("BookingDate");
                    int time = rs.getInt("Time");
                    roomDetail = new RoomDetailDTO("","",userID,status, bookingID, roomID, typeName, motelID, address, district, city, bookingDate, time);
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
        return roomDetail;
    }
}
