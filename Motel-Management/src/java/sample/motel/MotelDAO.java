/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.motel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;
import sample.owner.FeedbackDTO;
import sample.utils.DBUtils;

/**
 *
 * @author Bao
 */
public class MotelDAO {

    private static final String SHOW_MOTEL = "SELECT MotelID, tblMotel.Name, Phone,Desct,Image, Address,tblDistrict.Name AS DistrictName,tblCity.Name AS CityName,Ratings,OwnerID,Status FROM tblMotel,tblDistrict,tblCity WHERE OwnerID = ? AND tblMotel.DistrictID = tblDistrict.DistrictID AND tblDistrict.CityID = tblCity.CityID AND tblMotel.Status = 1";

    private static final String ADMIN_SHOW_MOTEL = "SELECT MotelID, tblMotel.Name, tblMotel.Phone,tblMotel.Image, tblMotel.Address,tblDistrict.Name AS DistrictName,tblCity.Name AS CityName,Ratings,tblUser.FullName AS FullName ,tblMotel.Status FROM tblMotel,tblDistrict,tblCity, tblUser WHERE tblMotel.OwnerID = tblUser.UserID AND tblMotel.DistrictID = tblDistrict.DistrictID AND tblDistrict.CityID = tblCity.CityID";
    
    private static final String GET_MOTEL_INCOME = "SELECT b.BookingID, b.Total FROM tblMotel as m , tblRoomType as rt, tblRoom as r , tblBookingDetail as bd, tblBooking as b\n" +
                                                   "WHERE m.MotelID =? AND m.MotelID = rt.MotelID AND rt.RoomTypeID = r.RoomTypeID AND r.RoomID = bd.RoomID AND bd.BookingID = b.BookingID  AND (b.Status = 1 OR b.Status = 2 )";
    private static final String GET_NUMBER_ROOMTYPE = "SELECT COUNT(*) as numberRoomType FROM tblMotel as m , tblRoomType as rt WHERE m.MotelID = ? AND m.MotelID = rt.MotelID GROUP BY m.MotelID";
    
    private static final String GET_NUMBER_ROOM = "SELECT COUNT(*) as numberRoom FROM tblMotel as m , tblRoomType as rt , tblRoom as r WHERE m.MotelID = ? AND m.MotelID = rt.MotelID AND rt.RoomTypeID = r.RoomTypeID AND (r.Status=1 OR r.Status=0) GROUP BY m.MotelID";
    private static final String CREATE_MOTEL = "INSERT [tblMotel] ([MotelID], [Name], [Desct], [Image], [Phone], [DistrictID], [Address],[OwnerID], [Status]) VALUES (?,?,?,?,?,?,?,?,?)";
    private static final String CHECK_MOTELID = "SELECT MotelID FROM tblMotel Where MotelID = ?";
    private static final String CHECK_EMPTY_ROOM = "SELECT * FROM tblMotel as m , tblRoomType as rt, tblRoom as r WHERE m.MotelID = rt.MotelID AND rt.RoomTypeID = r.RoomTypeID AND m.MotelID = ? AND r.Status = 1";
    
    public boolean updateMotelOwner2(MotelDTO motel) throws SQLException {
       boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " UPDATE tblMotel SET Name=?,Desct=?, Phone=?,Address=?, DistrictID=? WHERE MotelID=? ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, motel.getName());
                stm.setString(2, motel.getDesct());
                stm.setString(3, motel.getPhone());
                stm.setString(4, motel.getAddress());
                stm.setString(5, motel.getDistrict());
                stm.setString(6, motel.getMotelID());
                check = stm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }
    
    public boolean updateMotelOwner(MotelDTO motel) throws SQLException {
       boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " UPDATE tblMotel SET Name=?, Image=?,Desct=?,Phone=?,Address=?, DistrictID = ? WHERE MotelID=? ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, motel.getName());
                stm.setString(2, motel.getImage());
                stm.setString(3, motel.getDesct());
                stm.setString(4, motel.getPhone());
                stm.setString(5, motel.getAddress());
                stm.setString(6, motel.getDistrict());
                stm.setString(7, motel.getMotelID());
                check = stm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }
    
    public boolean checkEmptyRoom(String motelID) throws SQLException {
        boolean check = true;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CHECK_EMPTY_ROOM);
                ptm.setString(1, motelID);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    check = false;
                }
            }
        } catch (Exception e) {
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

        return check;
    }
    
    public boolean createMotel(MotelDTO motel) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CREATE_MOTEL);
                ptm.setString(1, motel.getMotelID());
                ptm.setString(2, motel.getName());
                ptm.setString(3, motel.getDesct());
                ptm.setString(4, motel.getImage());
                ptm.setString(5, motel.getPhone());
                ptm.setString(6, motel.getDistrict());
                ptm.setString(7, motel.getAddress());
                ptm.setString(8, motel.getOwnerId());
                ptm.setInt(9, 1);
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
    
    public boolean checkMotelID(String motelID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CHECK_MOTELID);
                ptm.setString(1, motelID);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    check = true;
                }
            }
        } catch (Exception e) {
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

        return check;
    }
    
    public int getNumberRoom(String motelID) throws SQLException {
        int numberRoom = 0;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_NUMBER_ROOM);
                ptm.setString(1, motelID);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    numberRoom = rs.getInt("numberRoom");    
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
    
    public int getNumberRoomtype(String motelID) throws SQLException {
        int numberRoomType = 0;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_NUMBER_ROOMTYPE);
                ptm.setString(1, motelID);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    numberRoomType = rs.getInt("numberRoomType");    
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
        return numberRoomType;
    }
    
    public int getMotelIncome(String motelID) throws SQLException {
        int income = 0;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_MOTEL_INCOME);
                ptm.setString(1, motelID);
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
    
    public List<MotelDTO> searchMotel(String ownerID) throws SQLException {
        List<MotelDTO> listMotel = new ArrayList();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SHOW_MOTEL);
                ptm.setString(1, ownerID);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String motelID = rs.getString("MotelID");
                    String name = rs.getString("Name");
                    String image = rs.getString("Image");
                    String phone = rs.getString("Phone");
                    String desct = rs.getString("Desct");
                    String address = rs.getString("Address");
                    String districtName = rs.getString("DistrictName");
                    String cityName = rs.getString("CityName");
                    double rating = rs.getDouble("Ratings");
                    String adminID = rs.getString("OwnerID");
                    int status = rs.getInt("Status");
                    listMotel.add(new MotelDTO(motelID, name, image, phone, desct, address, districtName, cityName, rating, adminID, status));
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
        return listMotel;
    }

    public List<MotelDTO> adminShowMotel() throws SQLException {
        List<MotelDTO> adminMotel = new ArrayList();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(ADMIN_SHOW_MOTEL);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String motelID = rs.getString("MotelID");
                    String name = rs.getString("Name");
                    String image = rs.getString("Image");
                    String phone = rs.getString("Phone");
                    String address = rs.getString("Address");
                    String districtName = rs.getString("DistrictName");
                    String cityName = rs.getString("CityName");
                    double rating = rs.getDouble("Ratings");
                    String ownerName = rs.getString("FullName");
                    int status = rs.getInt("Status");
                    adminMotel.add(new MotelDTO(motelID, name, image, phone, address, districtName, cityName,ownerName,rating,  status));
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
        return adminMotel;

    }
private static final String SHOWLIST_MOTEL = "SELECT tblMotel.MotelID,tblMotel.Name, tblMotel.image, tblMotel.phone, tblMotel.desct, tblMotel.address, tblDistrict.Name AS DistrictName,tblCity.Name AS CityName,Ratings,tblUser.FullName AS FullName,tblMotel.Status ,tblRoomType.Price , tblRoomType.TypeName FROM tblMotel,tblDistrict,tblCity, tblUser,tblRoomType WHERE tblMotel.MotelID = tblRoomType.MotelID AND tblMotel.DistrictID = tblDistrict.DistrictID AND tblDistrict.CityID = tblCity.CityID AND tblMotel.OwnerID= tblUser.UserID AND tblMotel.Status = 1";
public List<MotelDTO> getListMotel() throws SQLException {
         List<MotelDTO> listMotel = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SHOWLIST_MOTEL);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String motelID = rs.getString("MotelID");
                    String image = rs.getString("image");
                    String name = rs.getString("name");
                    String phone = rs.getString("phone");
                    String desct = rs.getString("desct");
                    String address = rs.getString("address");
                    String district = rs.getString("DistrictName");
                    String city = rs.getString("CityName");
                    double rating = rs.getDouble("Ratings");
                    String typename = rs.getString("TypeName");
                    double price = rs.getDouble("Price");
                    int status = rs.getInt("status");
                    listMotel.add(new MotelDTO(motelID, name, image, phone, desct, address, district, city, rating, typename ,price, status));
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
        return listMotel;
    
    }
private static final String SHOWALLLIST_MOTEL = "SELECT tblMotel.MotelID,tblMotel.Name, tblMotel.image, tblMotel.phone, tblMotel.desct, tblMotel.address, tblDistrict.Name AS DistrictName,tblCity.Name AS CityName,Ratings,tblUser.FullName AS FullName,tblMotel.Status ,tblRoomType.Price , tblRoomType.TypeName FROM tblMotel,tblDistrict,tblCity, tblUser,tblRoomType WHERE tblMotel.MotelID = tblRoomType.MotelID  AND tblMotel.DistrictID = tblDistrict.DistrictID AND tblDistrict.CityID = tblCity.CityID AND tblMotel.OwnerID= tblUser.UserID AND tblMotel.Status = 1";
public List<MotelDTO> getAllListMotel() throws SQLException {
         List<MotelDTO> listAllMotel = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SHOWALLLIST_MOTEL);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String motelID = rs.getString("MotelID");
                    String image = rs.getString("image");
                    String name = rs.getString("name");
                    String phone = rs.getString("phone");
                    String desct = rs.getString("Desct");
                    String address = rs.getString("address");
                    String district = rs.getString("DistrictName");
                    String city = rs.getString("CityName");
                    double rating = rs.getDouble("Ratings");
                    String typename = rs.getString("TypeName");
                    double price = rs.getDouble("Price");
                    int status = rs.getInt("status");
                    listAllMotel.add(new MotelDTO(motelID, name, image, phone, desct, address, district, city, rating,typename ,price, status));
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
        return listAllMotel;
    
    }

 public boolean insertMotelNew(MotelDTO motel) throws SQLException, ClassNotFoundException, NamingException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "INSERT INTO tblMotel(name,address) AND tblBooking(bookingDate,bookingID) AND tblPayment(paymentType)"
                        + " VALUES(?,?) AND VALUES(?,?) AND VALUES(?)";
                stm = conn.prepareStatement(sql);
                stm.setString(1, motel.getName());
                stm.setString(2, motel.getAddress());
                stm.setDate(3, motel.getBookingDate());
                stm.setString(4, motel.getBookingID());
                stm.setString(5, motel.getPaymentType());
                check = stm.executeUpdate() > 0;
            }
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }
private static final String SHOWDETAIL_MOTEL = "SELECT tblMotel.Name, tblMotel.image, tblMotel.phone,tblMotel.desct, tblMotel.address, tblDistrict.Name AS DistrictName,tblCity.Name AS CityName,Ratings,tblMotel.Status, tblUser.FullName as fullName , tblUser.Phone \n" +
"FROM tblMotel,tblDistrict,tblCity , tblUser\n" +
"WHERE  tblMotel.DistrictID = tblDistrict.DistrictID AND tblDistrict.CityID = tblCity.CityID  AND tblMotel.OwnerID = tblUser.UserID AND tblMotel.Status = 1 AND tblMotel.MotelID = ?";
public List<MotelDTO> getDetailMotel(String motelID) throws SQLException {
         List<MotelDTO> listMotel = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SHOWDETAIL_MOTEL);
                ptm.setString(1,motelID);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String image = rs.getString("image");
                    String name = rs.getString("name");
                    String phone = rs.getString("phone");
                    String desct = rs.getString("Desct");
                    String address = rs.getString("address");
                    String district = rs.getString("DistrictName");
                    String city = rs.getString("CityName");
                    double rating = rs.getDouble("Ratings");
                    int status = rs.getInt("status");
                    String ownerName = rs.getString("fullName");
                    listMotel.add(new MotelDTO(motelID, name, image, phone, desct, address, district, city, rating, ownerName, status));
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
        return listMotel;
    
    }
private static final String FILTER_MOTEL = "SELECT tblMotel.MotelID,tblMotel.Name, tblMotel.image, tblMotel.phone, tblMotel.desct, tblMotel.address, tblDistrict.Name AS DistrictName,tblCity.Name AS CityName,Ratings,tblUser.FullName AS FullName,tblMotel.Status ,tblRoomType.Price , tblRoomType.TypeName \n" +
"FROM tblMotel,tblDistrict,tblCity, tblUser,tblRoomType \n" +
"WHERE tblMotel.MotelID = tblRoomType.MotelID AND tblMotel.DistrictID = tblDistrict.DistrictID AND tblDistrict.CityID = tblCity.CityID AND tblMotel.OwnerID= tblUser.UserID AND tblMotel.Status = 1 AND ( tblDistrict.DistrictID = ? OR tblRoomType.Price BETWEEN ? AND ?)";
public List<MotelDTO> getFilterMotel(String price1,String price2, String district) throws SQLException {
         List<MotelDTO> listMotel = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(FILTER_MOTEL);
                ptm.setString(1, district);
                ptm.setString(2, price1);
                ptm.setString(3, price2);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String motelID = rs.getString("MotelID");
                    String image = rs.getString("image");
                    String name = rs.getString("name");
                    String phone = rs.getString("phone");
                    String desct = rs.getString("desct");
                    String address = rs.getString("address");
                    String city = rs.getString("CityName");
                    double rating = rs.getDouble("Ratings");
                    int price = rs.getInt("price");
                    String typename = rs.getString("TypeName"); 
                    int status = rs.getInt("status");
                    listMotel.add(new MotelDTO(motelID, name, image, phone, desct, address, district, city, rating, typename ,price, status));
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
        return listMotel;
    
    }
    /*admin*/
    public boolean updateMotel(MotelDTO motel) throws SQLException {
       boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " UPDATE tblMotel SET name=?, image=?,desct=?, phone=?,ratings=?, status=? WHERE motelID=? ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, motel.getName());
                stm.setString(2, motel.getImage());
                stm.setString(3, motel.getDesct());
                stm.setString(4, motel.getPhone());
                stm.setDouble(5, motel.getRating());
                stm.setInt(6, motel.getStatus());
                stm.setString(7, motel.getMotelID());
                check = stm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }
    
    /*==========*/
       private static final String INFO_MOTEL = "SELECT MotelID,tblMotel.Name, tblMotel.image, tblMotel.phone, desct, tblMotel.address, tblDistrict.Name AS DistrictName,tblCity.Name AS CityName,Ratings,tblUser.FullName AS FullName,tblMotel.Status FROM tblMotel,tblDistrict,tblCity, tblUser WHERE MOTELID = ? AND tblMotel.DistrictID = tblDistrict.DistrictID AND tblDistrict.CityID = tblCity.CityID AND tblMotel.OwnerID= tblUser.UserID";
     
    public List<MotelDTO> getInfo(String motelID) throws SQLException {
         List<MotelDTO> listMotel = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(INFO_MOTEL);
                ptm.setString(1, motelID);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String image = rs.getString("image");
                    String name = rs.getString("name");
                    String phone = rs.getString("phone");
                    String Desct = rs.getString("Desct");
                    String address = rs.getString("address");
                    String district = rs.getString("DistrictName");
                    String city = rs.getString("CityName");
                    double rating = rs.getDouble("Ratings");
                    String ownerId = rs.getString("FullName");
                    int status = rs.getInt("status");
                    listMotel.add(new MotelDTO(motelID, name, image, phone, Desct, address, district, city, rating, ownerId, status));
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
        return listMotel;
    
    }
    
//     public boolean detailUser(MotelDTO motel) throws SQLException {
//        boolean check = false;
//        Connection conn = null;
//        PreparedStatement stm = null;
//        try {
//            conn = DBUtils.getConnection();
//            if (conn != null) {
//                String sql = " UPDATE tblUser SET fullname=?, image=?, DateOfBirth=?, citizenNumber=?, phone=?, gmail=?, address=?, role=?, status=?, gender=? WHERE userId=?";
//                stm = conn.prepareStatement(sql);
//                stm.setString(1, motel.getName());
//                stm.setString(2, motel.getImage());
//                stm.setString(3, motel.getAddress());
//                stm.setString(4, motel.getCity());
//                stm.setString(5, motel.getDistrict());
//                stm.setString(6, motel.getDesct());
//                stm.setString(7, motel.getPhone());
//                stm.setInt(8, motel.getStatus());
//                stm.setString(9, motel.getMotelID());
//                check = stm.executeUpdate() > 0 ? true : false;
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        } finally {
//            if (stm != null) {
//                stm.close();
//            }
//            if (conn != null) {
//                conn.close();
//            }
//        }
//        return check;
//    }
     
    public boolean deleteMotel(String motelID) throws SQLException {
         boolean result = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "UPDATE tblMotel SET status = '0' WHERE motelID = ? ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, motelID);
                result = stm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return result;
    
    }
    

private static final String CANCEL_BOOKING = "UPDATE tblBooking SET Status = 3 WHERE bookingID =?";
    public boolean cancelBooking(String bookingID) throws SQLException {
      boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CANCEL_BOOKING);
                ptm.setString(1, bookingID);
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

private static final String CANCEL_ROOM = "UPDATE tblRoom SET Status = 0 WHERE roomID =?";
    public boolean cancelRoom(String roomID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CANCEL_ROOM);
                ptm.setString(1, roomID);
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
private static final String SHOWLIST_MOTEL_HOT = "SELECT tblMotel.MotelID,tblMotel.Name, tblMotel.image, tblMotel.phone, tblMotel.desct, tblMotel.address, tblDistrict.Name AS DistrictName,tblCity.Name AS CityName,Ratings,tblUser.FullName AS FullName,tblMotel.Status ,tblRoomType.Price , tblRoomType.TypeName FROM tblMotel,tblDistrict,tblCity, tblUser,tblRoomType WHERE tblMotel.MotelID = tblRoomType.MotelID AND tblMotel.DistrictID = tblDistrict.DistrictID AND tblDistrict.CityID = tblCity.CityID AND tblMotel.OwnerID= tblUser.UserID AND tblMotel.Status = 1 AND tblMotel.Ratings >=4.4";

    public List<MotelDTO> getListMotelHot() throws SQLException {
     List<MotelDTO> listMotel = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SHOWLIST_MOTEL_HOT);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String motelID = rs.getString("MotelID");
                    String image = rs.getString("image");
                    String name = rs.getString("name");
                    String phone = rs.getString("phone");
                    String desct = rs.getString("desct");
                    String address = rs.getString("address");
                    String district = rs.getString("DistrictName");
                    String city = rs.getString("CityName");
                    double rating = rs.getDouble("Ratings");
                    String typename = rs.getString("TypeName");
                    double price = rs.getDouble("Price");
                    int status = rs.getInt("status");
                    listMotel.add(new MotelDTO(motelID, name, image, phone, desct, address, district, city, rating, typename ,price, status));
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
        return listMotel;    
    }
 /*search user*/
    private static final String SEARCH_MOTEL = "SELECT tblMotel.MotelID,tblMotel.Name, tblMotel.image, tblMotel.phone, tblMotel.desct, tblMotel.address, tblDistrict.Name AS DistrictName,tblCity.Name AS CityName,Ratings,tblUser.FullName AS FullName,tblMotel.Status ,tblRoomType.Price , tblRoomType.TypeName \n" +
"FROM tblMotel,tblDistrict,tblCity, tblUser,tblRoomType \n" +
"WHERE tblMotel.MotelID = tblRoomType.MotelID AND tblMotel.DistrictID = tblDistrict.DistrictID AND tblDistrict.CityID = tblCity.CityID AND tblMotel.OwnerID= tblUser.UserID AND tblMotel.Status = 1 AND tblDistrict.DistrictID =?";

    public List<MotelDTO> getListMotel(String districtID) throws SQLException {
        List<MotelDTO> listMotel = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SEARCH_MOTEL);
                ptm.setString(1, districtID);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String motelID = rs.getString("MotelID");
                    String image = rs.getString("image");
                    String name = rs.getString("name");
                    String phone = rs.getString("phone");
                    String desct = rs.getString("desct");
                    String address = rs.getString("address");
                    String district = rs.getString("DistrictName");
                    String city = rs.getString("CityName");
                    double rating = rs.getDouble("Ratings");
                    String typename = rs.getString("TypeName");
                    double price = rs.getDouble("Price");
                    int status = rs.getInt("status");
                    listMotel.add(new MotelDTO(motelID, name, image, phone, desct, address, district, city, rating, typename, price, status));
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
        return listMotel;

    }

}
