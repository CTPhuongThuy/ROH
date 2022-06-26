/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package sample.booking;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;
import sample.motel.MotelDAO;
import sample.motel.MotelDTO;
import sample.utils.DBUtils;

/**
 *
 * @author cao thi phuong thuy
 */
public class BookingDAO {

    private static final String BOOKING_SUB = "INSERT [tblBooking] ([BookingID], [BookingDate], [Desct], [UserID], [Status], [Total]) VALUES (?,?,?,?,?,?)";

    public boolean insertBooking(BookingDTO book) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(BOOKING_SUB);
                ptm.setString(1, book.getBookingID());
                ptm.setString(2, book.getDate());
                ptm.setString(3, book.getDesct());
                ptm.setString(4, book.getUserId());
                ptm.setInt(5, book.getStatus());
                ptm.setInt(6, book.getTotal());
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
}
