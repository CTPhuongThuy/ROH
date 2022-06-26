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
import sample.users.UserDTO;
import sample.utils.DBUtils;

/**
 *
 * @author Bao
 */
public class OverviewDAO {
    private static final String GET_NUMBER_ROOM = "SELECT COUNT(*) as NumberRoom FROM tblUser,tblMotel,tblRoomType,tblRoom \n" +
                                                  "WHERE tblUser.UserID = tblMotel.OwnerID AND tblMotel.MotelID = tblRoomType.MotelID AND tblRoomType.RoomTypeID = tblRoom.RoomTypeID AND UserID = ?";
    private static final String GET_NUMBER_SERVICE = "SELECT COUNT(*) as NumberService FROM tblUser,tblMotel,tblService\n" +
                                                     "WHERE tblUser.UserID = tblMotel.OwnerID AND tblMotel.MotelID = tblService.MotelID AND UserID = ?";
    private static final String GET_NUMBER_FEEDBACK = "SELECT COUNT(*) as NumberFeedback FROM  tblUser, tblMotel , tblFeedBack \n" +
                                                      "WHERE tblUser.UserID = tblMotel.OwnerID AND tblMotel.MotelID = tblFeedBack.MotelID AND tblUser.UserID = ?";
    private static final String GET_NUMBER_INCOME = "SELECT tblBooking.BookingID, tblBooking.Total\n" +
                                                    "FROM tblUser, tblMotel,tblRoomType, tblRoom, tblBookingDetail, tblBooking ,tblPayment\n" +
                                                    "WHERE tblUser.UserID = ? AND tblUser.UserID = tblMotel.OwnerID AND tblMotel.MotelID = tblRoomType.MotelID AND tblRoomType.RoomTypeID = tblRoom.RoomTypeID AND tblRoom.RoomID = tblBookingDetail.RoomID AND tblBookingDetail.BookingID =tblBooking.BookingID AND tblBooking.BookingID = tblPayment.PaymentID\n" +
                                                    "GROUP BY tblBooking.BookingID , tblBooking.Total";
    private static final String GET_NEWS = "SELECT tblUser.FullName, a.Price, a.Time, a.Name , a.Status \n" +
                                           "FROM (SELECT TOP 5 b.UserID, rt.Price, d.Time,b.BookingDate, b.Status, r.Name FROM tblUser as u, tblMotel as m,tblRoomType as rt, tblRoom as r, tblBookingDetail as d, tblBooking as b WHERE u.UserID = ? AND u.UserID = m.OwnerID AND m.MotelID = rt.MotelID AND rt.RoomTypeID = r.RoomTypeID AND r.RoomID = d.RoomID  AND d.BookingID = b.BookingID) a inner join tblUser on a.UserID = tblUser.UserID \n" +
                                           "ORDER BY a.BookingDate DESC";
    private static final String GET_OFEEDBACK ="SELECT tblUser.FullName,tblUser.Image, a.MotelID,a.FeedbackID,a.BookingDate,a.Desct,a.Ratings \n" +
                                               "FROM (SELECT TOP 5 tblBooking.UserID,tblMotel.MotelID,tblFeedBack.FeedbackID,tblBooking.BookingDate , tblFeedBack.Desct, tblFeedBack.Ratings \n" +
                                               "FROM tblUser, tblMotel, tblFeedBack, tblBooking\n" +
                                               "WHERE tblUser.UserID = ? AND tblUser.UserID = tblMotel.OwnerID AND tblMotel.MotelID = tblFeedBack.MotelID AND tblFeedBack.BookingID = tblBooking.BookingID) a inner join tblUser on tblUser.UserID = a.UserID ORDER BY a.BookingDate DESC";
    
    public List<FeedbackDTO> getListFeedback(String userID) throws SQLException {
        List<FeedbackDTO> listFeedback = new ArrayList();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_OFEEDBACK);
                ptm.setString(1, userID);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String feedBackID = rs.getString("FeedbackID");
                    String fullName = rs.getString("FullName");
                    int rating = rs.getInt("Ratings");
                    String desc = rs.getString("Desct");
                    String MotelID = rs.getString("MotelID");
                    String image = rs.getString("Image");
                    listFeedback.add(new FeedbackDTO(feedBackID, fullName, desc, rating, MotelID,image));
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
        return listFeedback;
    }
    
    public List<NewsDTO> getListNews(String userID) throws SQLException {
        List<NewsDTO> listNews = new ArrayList();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_NEWS);
                ptm.setString(1, userID);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String fullName = rs.getString("FullName");
                    int price = rs.getInt("Price");
                    int time = rs.getInt("Time");
                    String status = rs.getString("Status");
                    String roomName = rs.getString("Name");
                    int totalPrice = price * time;
                    listNews.add(new NewsDTO(fullName, totalPrice, roomName, status));
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
        return listNews;
    }
    
     public int getNumberIncome(String userID) throws SQLException {
        int income = 0;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_NUMBER_INCOME);
                ptm.setString(1, userID);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    income += rs.getInt("Total");    
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
        return income;
    }
    
    public int getNumberFeedback(String userID) throws SQLException {
        int numberFeedback = 0;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_NUMBER_FEEDBACK);
                ptm.setString(1, userID);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    numberFeedback = rs.getInt("NumberFeedback");    
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
        return numberFeedback;
    }
    
    public int getNumberService(String userID) throws SQLException {
        int numberService = 0;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_NUMBER_SERVICE);
                ptm.setString(1, userID);
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
    
    public int getNumberRoom(String userID) throws SQLException {
        int numberRoom = 0;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_NUMBER_ROOM);
                ptm.setString(1, userID);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    numberRoom = rs.getInt("NumberRoom");    
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
        return numberRoom;
    }
}
