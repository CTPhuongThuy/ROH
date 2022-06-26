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
import sample.utils.DBUtils;

/**
 *
 * @author Bao
 */
public class feedbackDAO {
private static final String GET_FEEDBACK = "SELECT  f.Desct, f.Status  FROM tblMotel as m, tblFeedback as f WHERE f.MotelID = m.MotelID AND f.Status = 1 AND m.MotelID =?";
    public List<FeedbackDTO> searchfeedback(String motelID) throws SQLException {
        List<FeedbackDTO> listService = new ArrayList();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_FEEDBACK);
                ptm.setString(1,motelID);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String serviceName = rs.getString("ServiceName");
                    int status = rs.getInt("Status");
                    listService.add(new FeedbackDTO(serviceName,status));
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
/**/
    private static final String GET_FEEDBACK_DETAIL = "SELECT tblUser.FullName, tblUser.Image, tblFeedBack.Ratings ,tblFeedBack.Desct  FROM tblUser ,tblFeedBack, tblMotel, tblBooking WHERE tblMotel.MotelID =tblFeedBack.MotelID AND tblFeedBack.BookingID=tblBooking.BookingID AND tblBooking.UserID=tblUser.UserID AND tblMotel.MotelID=?";
    public List<FeedbackDTO> getDetailFeedback(String motelID) throws SQLException {
        List<FeedbackDTO> listService = new ArrayList();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_FEEDBACK_DETAIL);
                ptm.setString(1,motelID);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String fullName = rs.getString("FullName");
                     String image = rs.getString("Image");
                      String desct = rs.getString("Desct");
                    int ratings = rs.getInt("Ratings");
                    listService.add(new FeedbackDTO(fullName, desct, ratings, image));
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

