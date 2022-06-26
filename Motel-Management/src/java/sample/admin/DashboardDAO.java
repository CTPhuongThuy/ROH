/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package sample.admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import sample.owner.HistoryDTO;
import sample.utils.DBUtils;

/**
 *
 * @author cao thi phuong thuy
 */
public class DashboardDAO {
    public int getMotelNumber() throws SQLException {
    int numberMotel = 0;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql ="SELECT COUNT(MotelID) as NumberMotel FROM tblMotel Where Status=1";
                ptm = conn.prepareStatement(sql);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    numberMotel = rs.getInt("NumberMotel");    
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
        return numberMotel;    
    }

    public int getUserNumber() throws SQLException {
        int numberUser = 0;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql ="SELECT COUNT(UserID) as NumberUser FROM tblUser Where Status=1";
                ptm = conn.prepareStatement(sql);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    numberUser = rs.getInt("NumberUser");    
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
        return numberUser;        
    }

    public int getOwnerNumber() throws SQLException {
     int numberUser = 0;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql ="SELECT COUNT(UserID) as NumberUser FROM tblUser Where Status=1 AND Role ='OW'";
                ptm = conn.prepareStatement(sql);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    numberUser = rs.getInt("NumberUser");    
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
        return numberUser;     
    }

    public int getReportNumber() throws SQLException {
        int numberReport = 0;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql ="SELECT COUNT(ReportID) as NumberReport FROM tblReport";
                ptm = conn.prepareStatement(sql);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    numberReport = rs.getInt("NumberReport");    
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
        return numberReport;   
        
    }

      public static  final String GET_TOP_INCOME ="SELECT distinct TOP 5 u.UserID, u.FullName, u.Image , u.Phone,m.Name,SUM(DISTINCT tblBooking.Total) as Income\n" +
"FROM tblUser as u, tblMotel as m,tblRoomType, tblRoom, tblBookingDetail, tblBooking ,tblPayment\n" +
"WHERE u.UserID = m.OwnerID AND m.MotelID = tblRoomType.MotelID AND tblRoomType.RoomTypeID = tblRoom.RoomTypeID AND tblRoom.RoomID = tblBookingDetail.RoomID AND tblBookingDetail.BookingID =tblBooking.BookingID \n" +
"Group BY u.UserID, u.FullName, u.Image , u.Phone, m.Name\n" +
"ORDER BY SUM(DISTINCT tblBooking.Total) desc";
    public List<HistoryDTO> getTopIncome() throws SQLException {
        
    List<HistoryDTO> topIncome = new ArrayList();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_TOP_INCOME);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String userID = rs.getString("UserID");
                    String userName = rs.getString("FullName");
                    String status = rs.getString("Image");
                    String payType = rs.getString("Phone");
                    int total = rs.getInt("Income");
                    topIncome.add(new HistoryDTO(userID, userName, status, payType, total));
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
        return topIncome;}

   
    
}
