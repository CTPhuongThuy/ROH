
package sample.users;

import java.sql.Connection;
import java.sql.Date;
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
public class UserDAO {
    private static final String LOGIN = "SELECT UserID, FullName, Role FROM tblUser WHERE UserID=? AND Password=? AND Status = 1";
    private static final String UPLOAD_PROFILE = "SELECT UserID, FullName, Image, DateOfBirth, CitizenNumber, Gender, Address, Phone, Gmail FROM tblUser WHERE UserID = ?";
    private static final String UPDATE_USER = "UPDATE tblUser SET FullName= ?, Address= ?, DateOfBirth=?, Phone=?,Gmail= ?, CitizenNumber = ?, Gender=? WHERE userID=?";
    private static final String CHANGE_PASSWORD = "UPDATE tblUser SET Password = ? WHERE UserID = ? ";
    private static final String CHANGE_IMAGE = "UPDATE tblUser SET Image = ? WHERE UserID = ? ";
    private static final String CHECK_USERID = "SELECT UserID FROM tblUser Where UserID = ?";
    public boolean changeImage(String userID, String image) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CHANGE_IMAGE);
                ptm.setString(1, image);
                ptm.setString(2, userID);
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
    
    public boolean checkUserID(String userID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CHECK_USERID);
                ptm.setString(1, userID);
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
    
    public boolean changePassword(String userID, String passWord) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CHANGE_PASSWORD);
                ptm.setString(1, passWord);
                ptm.setString(2, userID);
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
    
    public UserDTO getUserProfile(String userID) throws SQLException {
        UserDTO user = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPLOAD_PROFILE);
                ptm.setString(1, userID);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String fullName = rs.getString("FullName");
                    String image = rs.getString("Image");
                    String DateOfBirth = rs.getString("DateOfBirth");
                    String citizenNumber = rs.getString("CitizenNumber");
                    int gender = rs.getInt("Gender");
                    String address = rs.getString("Address");
                    String phone = rs.getString("Phone");
                    String gmail = rs.getString("Gmail");
                    user = new UserDTO(userID, fullName, image, gender, DateOfBirth, citizenNumber, phone, gmail, address, "", "", 1);
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
    
    public boolean update(UserDTO user) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATE_USER);
                ptm.setString(1, user.getFullName());
                ptm.setString(2, user.getAddress());
                ptm.setString(3, user.getDateOfBirth());
                ptm.setString(4, user.getPhone());
                ptm.setString(5, user.getGmail());
                ptm.setString(6, user.getCitizenNumber());
                ptm.setInt(7, user.getGender());
                ptm.setString(8, user.getUserId());
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
    
    public UserDTO checkLogin(String userId, String password) throws SQLException {
        UserDTO user = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(LOGIN);
                ptm.setString(1, userId);
                ptm.setString(2, password);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    String fullName = rs.getString("FullName");
                    String role = rs.getString("Role");
                    user = new UserDTO(userId, fullName, password, role);
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


public UserDTO checkRole(String userId) throws SQLException {
        UserDTO user = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            String sql = "SELECT ROLE FROM tblUsers "
                    + " WHERE USERID=? ";
            stm = conn.prepareStatement(sql);
            stm.setString(1, userId);
            rs = stm.executeQuery();
            if (rs.next()) {
                String role = rs.getString("ROLE");
                user = new UserDTO(userId, "", role, "");
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return user;
    }

public List<UserDTO> getListUser(String search) throws SQLException {
        List<UserDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT USERID, FULLNAME, IMAGE, GENDER, BIRTHDAY,CITIZEN NUMBER, PHONE, GMAIL, ADDRESS, PASSWORD, ROLE, STATUS FROM tblUsers "
                        + " WHERE FULLNAME LIKE ? ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, "%" + search + "%");
                rs = stm.executeQuery();
                while (rs.next()) {
                    String userId = rs.getString("userID");
                    String fullName = rs.getString("fullName");
                    String image = rs.getString("image");
                    int gender = rs.getInt("gender");
                    String birthDay = rs.getString("birthDay");
                    String citizenNumber = rs.getString("citizenNumber");
                    String phone = rs.getString("phone");
                    String gmail = rs.getString("gmail");
                    String address = rs.getString("address");
                    String password = rs.getString("password");
                    String role = rs.getString("role");
                    int status = rs.getInt("status");
                    list.add(new UserDTO(userId, fullName, image, gender, birthDay, citizenNumber, phone, gmail, address, password, role, status));
                }
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }

public boolean deleteUser(String userID) throws SQLException {
        boolean result = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "UPDATE tblUser SET Status = 0 WHERE UserID = ? ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, userID);
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

public boolean updateUser(UserDTO user) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " UPDATE tblUsers "
                        + " SET fullname=?, image=?, gender=?, DateOfBirth=?, citizenNumber=?, phone=?, gmail=?, address=?, password=?, role=?, status=? "
                        + " WHERE userId=?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, user.getFullName());
                stm.setString(2, user.getImage());
                stm.setInt(3, user.getGender());
                stm.setString(4, user.getDateOfBirth());
                stm.setString(5, user.getCitizenNumber());
                stm.setString(6, user.getPhone());
                stm.setString(7, user.getGmail());
                stm.setString(8, user.getAddress());
                stm.setString(9, user.getPassword());
                stm.setString(10, user.getRole());
                stm.setInt(11, user.getStatus());
                stm.setString(12, user.getUserId());
                check = stm.executeUpdate() > 0;
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
public boolean checkDuplcate(String userId) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT USERID FROM tblUsers "
                        + " WHERE userID=?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, userId);
                rs = stm.executeQuery();
                if (rs.next()) {
                    check = true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }
 public boolean insertUser(UserDTO user) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "INSERT INTO tblUsers(USERID, FULLNAME, ROLE, PASSWORD) "
                        + " VALUES(?, ?, ?, ?)";
                stm = conn.prepareStatement(sql);
                stm.setString(1, user.getUserId());
                stm.setString(2, user.getFullName());
                stm.setString(3, user.getRole());
                stm.setString(4, user.getPassword());
                check = stm.executeUpdate() > 0;
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

    public boolean insertUserNew(UserDTO user) throws SQLException, ClassNotFoundException, NamingException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "INSERT INTO tblUser(userId, fullName, phone, gmail, status) "
                        + " VALUES(?,?,?,?,?,?,?)";
                stm = conn.prepareStatement(sql);
                stm.setString(1, user.getUserId());
                stm.setString(2, user.getFullName());
                stm.setString(3, user.getPhone());
                stm.setString(4, user.getGmail());
                stm.setInt(5, user.getStatus());
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
    
    
    
    /*admin*/
    private static final String LIST_ACC = "SELECT USERID, FULLNAME, IMAGE, GENDER, DateOfBirth,CitizenNumber, PHONE, GMAIL, ADDRESS, PASSWORD, ROLE, STATUS FROM tblUser";
    
    public List<UserDTO> getListAcc() throws SQLException {
         List<UserDTO> listAcc = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(LIST_ACC);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String userId = rs.getString("userID");
                    String fullName = rs.getString("fullName");
                    String image = rs.getString("image");
                    int gender = rs.getInt("gender");
                    String DateOfBirth = rs.getString("DateOfBirth");
                    String citizenNumber = rs.getString("citizenNumber");
                    String phone = rs.getString("phone");
                    String gmail = rs.getString("gmail");
                    String address = rs.getString("address");
                    String role = rs.getString("role");
                    int status = rs.getInt("status");
                    listAcc.add(new UserDTO(userId, fullName, image, gender, DateOfBirth, citizenNumber, phone, gmail, address, role, status));
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
        return listAcc;
    
    }
       private static final String INFO_USER = "SELECT USERID, FULLNAME, IMAGE, GENDER, DateOfBirth,CitizenNumber, PHONE, GMAIL, ADDRESS, ROLE, STATUS FROM tblUser WHERE USERID=?";
     
    public List<UserDTO> getInfo(String userId) throws SQLException {
         List<UserDTO> listAcc = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(INFO_USER);
                ptm.setString(1, userId);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String role = rs.getString("role");
                    String fullName = rs.getString("fullName");
                    String image = rs.getString("image");
                    int gender = rs.getInt("gender");
                    String DateOfBirth = rs.getString("DateOfBirth");
                    String citizenNumber = rs.getString("citizenNumber");
                    String phone = rs.getString("phone");
                    String gmail = rs.getString("gmail");
                    String address = rs.getString("address");
                    int status = rs.getInt("status");
                    listAcc.add(new UserDTO(userId, fullName, image, gender, DateOfBirth, citizenNumber, phone, gmail, address, role, status));
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
        return listAcc;
    
    }
    /*===*/
    public boolean detailUser(UserDTO user) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " UPDATE tblUser SET fullname=?, image=?, DateOfBirth=?, citizenNumber=?, phone=?, gmail=?, address=?, role=?, status=?, gender=? WHERE userId=?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, user.getFullName());
                stm.setString(2, user.getImage());
                stm.setString(3, user.getDateOfBirth());
                stm.setString(4, user.getCitizenNumber());
                stm.setString(5, user.getPhone());
                stm.setString(6, user.getGmail());
                stm.setString(7, user.getAddress());
                stm.setString(8, user.getRole());
                stm.setInt(9, user.getStatus());
                stm.setInt(10, user.getGender());
                stm.setString(11, user.getUserId());
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
    
    /*admin*/
 private static final String FILTER_ROLE = "SELECT USERID, FULLNAME, IMAGE, GENDER, DateOfBirth,CitizenNumber, PHONE, GMAIL, ADDRESS, ROLE, STATUS FROM tblUser WHERE ROLE=?";
     
    public List<UserDTO> getFilterRole(String role) throws SQLException {
       List<UserDTO> listAcc = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(FILTER_ROLE);
                ptm.setString(1, role);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String userId = rs.getString("userId");
                    String fullName = rs.getString("fullName");
                    String image = rs.getString("image");
                    int gender = rs.getInt("gender");
                    String DateOfBirth = rs.getString("DateOfBirth");
                    String citizenNumber = rs.getString("citizenNumber");
                    String phone = rs.getString("phone");
                    String gmail = rs.getString("gmail");
                    String address = rs.getString("address");
                    int status = rs.getInt("status");
                    listAcc.add(new UserDTO(userId, fullName, image, gender, DateOfBirth, citizenNumber, phone, gmail, address, role, status));
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
        return listAcc; 
    
    }

    public boolean insertFeedback(FeedbackDTO feedback) throws SQLException, ClassNotFoundException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "INSERT INTO tblFeedback(feedbackID, desct, ratings, motelID, bookingID, status) "
                        + " VALUES(?,?,?,?,?,?)";
                stm = conn.prepareStatement(sql);
                stm.setString(1, feedback.getFeedbackID());
                stm.setString(2, feedback.getDesc());
                stm.setInt(3, feedback.getRating());
                stm.setString(4, feedback.getMotelID());
                stm.setString(5, feedback.getBookingID());
                stm.setInt(6, feedback.getStatus());
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
    /*search*/
     private static final String DISTRICT_LIST = "SELECT districtID, name, cityID FROM tblDistrict";
  
    public List<DistrictDTO> getListDistrict() throws SQLException {
        List<DistrictDTO> listDis = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(DISTRICT_LIST);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String districtID = rs.getString("districtID");
                    String name = rs.getString("name");
                    String cityID = rs.getString("cityID");
                    listDis.add(new DistrictDTO(districtID, name, cityID));
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
        return listDis;
    
    }
}


