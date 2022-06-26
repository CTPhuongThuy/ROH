/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package sample.booking;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import sample.room.RoomDTO;
import sample.service.ServiceDTO;
import sample.utils.DBUtils;

/**
 *
 * @author cao thi phuong thuy
 */
public class BookingDetailDAO {

    private static final String BOOKINGDT_SUB = "INSERT [tblBookingDetail] ([BookingDetailID], [RoomID], [BookingID], [Time]) VALUES (?,?,?,?)";

    public  boolean insertBt(BookingDetailDTO bt, String roomId) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                    ptm = conn.prepareStatement(BOOKINGDT_SUB);
                    ptm.setString(1, bt.getBookingID());
                    ptm.setString(2, roomId);
                    ptm.setString(3, bt.getBookingID());
                    ptm.setInt(4, bt.getTime());
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

    public List<BookingDetailDTO> insertBt(String roomId) throws SQLException {
       List<BookingDetailDTO> listService = new ArrayList();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            while (rs.next()) {
                ptm = conn.prepareStatement(BOOKINGDT_SUB);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String serviceID = rs.getString("ServiceID");
                    String serviceName = rs.getString("ServiceName");
                    int price = rs.getInt("Price");
                    int quantity = rs.getInt("Quantity");
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
