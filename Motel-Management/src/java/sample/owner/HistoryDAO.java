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
import sample.service.ServiceDTO;
import sample.users.UserDTO;
import sample.utils.DBUtils;

/**
 *
 * @author Bao
 */
public class HistoryDAO {
    private static final String GET_HISTORY="SELECT b.BookingID, m.MotelID,r.RoomID,u.FullName,b.Status,b.BookingDate,b.Total FROM tblMotel as m, tblRoomType as rt, tblRoom as r, tblBookingDetail as bd, tblBooking as b , tblUser as u\n" +
                                            "WHERE m.OwnerID = ? AND m.MotelID = rt.MotelID AND rt.RoomTypeID = r.RoomTypeID AND r.RoomID = bd.RoomID AND bd.BookingID = b.BookingID AND b.UserID = u.UserID";
    private static final String GET_PAYTYPE = "SELECT PaymentTypeName FROM tblPayment WHERE tblPayment.PaymentID = ?";
    private static final String GET_NUMBER_SERVICE = "SELECT COUNT(*) as NumberService FROM tblBooking as b, tblBookingServiceDetail as s WHERE b.BookingID = s.BookingID AND b.BookingID = ? ";
    private static final String GET_USER_BOOKING = "SELECT u.FullName, u.Phone, u.CitizenNumber, u.Address FROM tblBooking as b, tblUser as u WHERE b.UserID = u.UserID AND b.BookingID=?";
    private static final String GET_FEEDBACK = "SELECT f.Ratings , f.Desct FROM tblBooking as b, tblFeedBack as f WHERE b.BookingID = f.BookingID AND b.BookingID = ?";
    private static final String GET_HISTORY_DETAIL = "SELECT b.Status, b.Total ,bd.Time, m.Name as motelName,  r.Name as roomName, rt.TypeName as roomType, m.Address, d.Name as districtName, c.Name as cityName, b.BookingDate,p.PaymentTypeName \n" +
                                                     "FROM tblPayment as p , tblBooking as b, tblBookingDetail as bd, tblRoom as r, tblRoomType as rt, tblMotel as m, tblDistrict as d, tblCity as c\n" +
                                                     "WHERE b.BookingID = ? AND p.PaymentID = b.BookingID AND b.BookingID = bd.BookingID AND bd.RoomID = r.RoomID AND r.RoomTypeID = rt.RoomTypeID AND rt.MotelID = m.MotelID AND m.DistrictID = d.DistrictID AND d.CityID = c.CityID AND  r.RoomID=?;";
    private static final String GET_SERVICE = "SELECT s.ServiceName, s.Price, sd.Quantity FROM tblBooking as b, tblBookingServiceDetail as sd , tblService as s \n" +
                                              "WHERE b.BookingID = ? AND b.BookingID = sd.BookingID AND sd.ServiceID = s.ServiceID";
    
    public List<ServiceDTO> getListService(String bookingID) throws SQLException {
        List<ServiceDTO> listService = new ArrayList();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_SERVICE);
                ptm.setString(1, bookingID);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String serviceName = rs.getString("ServiceName");
                    int quantity = rs.getInt("Quantity");
                    int price = rs.getInt("Price");
                    int totalPrice = price * quantity;
                    listService.add(new ServiceDTO("", serviceName, totalPrice, 0, 0));
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
    
    public HistoryDTO getHistoryDetail(String bookingID,String roomID) throws SQLException {
        HistoryDTO historyDetail = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_HISTORY_DETAIL);
                ptm.setString(1, bookingID);
                ptm.setString(2, roomID);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String status = rs.getString("Status");
                    String motelName = rs.getString("motelName");
                    String roomName = rs.getString("roomName");
                    String roomType = rs.getString("roomType");
                    String address = rs.getString("Address");
                    String district = rs.getString("districtName");
                    String city = rs.getString("cityName");
                    String date = rs.getString("BookingDate");
                    String payType  = rs.getString("PaymentTypeName");
                    int total = rs.getInt("Total");
                    int time = rs.getInt("Time");
                    historyDetail = new HistoryDTO(bookingID, motelName, address, district, city, roomName, status, date, payType, date, total);
                    historyDetail.setNumberService(time);
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
        return historyDetail;
    }
    
    public FeedbackDTO getFeedbackBooking(String bookingID) throws SQLException {
        FeedbackDTO feedBack = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_FEEDBACK);
                ptm.setString(1, bookingID);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int rating = rs.getInt("Ratings");
                    String desct = rs.getString("Desct");
                    feedBack = new FeedbackDTO("", "", desct, rating, "");
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
        return feedBack;
    }
    
    public UserDTO getUserBooking(String bookingID) throws SQLException {
        UserDTO user = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_USER_BOOKING);
                ptm.setString(1, bookingID);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String fullName = rs.getString("FullName");
                    String citizenNumber = rs.getString("CitizenNumber");
                    String address = rs.getString("Address");
                    String phone = rs.getString("Phone");
                    user = new UserDTO("", fullName, "", 1, "", citizenNumber, phone, "", address, "", "", 1);
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
        return user;
    }
    
    public int getNumberService(String bookingid) throws SQLException {
        int numberService = 0;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_NUMBER_SERVICE);
                ptm.setString(1, bookingid);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    numberService = rs.getInt("NumberService");    
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
        return numberService;
    }
    
    public String getPayType(String bookingid) throws SQLException {
        String payType = "";
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_PAYTYPE);
                ptm.setString(1, bookingid);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    payType = rs.getString("PaymentTypeName");    
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
        return payType;
    }
    
    public List<HistoryDTO> getListHistory(String ownerID) throws SQLException {
        List<HistoryDTO> listHistory = new ArrayList();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_HISTORY);
                ptm.setString(1, ownerID);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String bookingID = rs.getString("BookingID");
                    String motelID = rs.getString("MotelID");
                    String roomID = rs.getString("RoomID");
                    String userName = rs.getString("FullName");
                    String status = rs.getString("Status");
                    String date = rs.getString("BookingDate");
                    int totalPrice = rs.getInt("Total");
                    listHistory.add(new HistoryDTO(bookingID, motelID, roomID, ownerID, userName, status, 0, "", date, totalPrice));
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
        return listHistory;
    }

/*admin*/
  private static final String GET_USER_HISTORY="SELECT distinct b.BookingID,m.MotelID, m.Name, BookingDate, b.Total, b.Status\n" +
"						FROM tblBooking as b, tblBookingDetail as bd , tblPayment as p, tblRoom as r , tblRoomType as rt, tblMotel as m, tblUser as u\n" +
"						WHERE b.BookingID = bd.BookingID AND bd.RoomID = r.RoomID AND r.RoomTypeID=  rt.RoomTypeID AND rt.MotelID= m.MotelID AND b.UserID = u.UserID AND u.UserID = ?"
          + "                                   ORDER BY BookingDate desc";
 
    public List<HistoryDTO> getListUserBooking(String userID) throws SQLException {
     List<HistoryDTO> listHistory = new ArrayList();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_USER_HISTORY);
                ptm.setString(1, userID);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String bookingID = rs.getString("BookingID");
                    String motelID = rs.getString("MotelID");
                    String motelName = rs.getString("Name");
                    String status = rs.getString("Status");
                    String date = rs.getString("BookingDate");
                    int totalPrice = rs.getInt("Total");
                    listHistory.add(new HistoryDTO(bookingID, motelID, "", userID, motelName, status, 0, "", date, totalPrice));
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
        return listHistory;    
    }
}
