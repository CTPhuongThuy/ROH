/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.room;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;
import sample.utils.DBUtils;

/**
 *
 * @author Bao
 */
public class RoomDAO {
    private static final String SHOW_ROOM = "SELECT RoomID, Name, tblRoomType.TypeName, Price, Desct, tblRoom.Status, MotelID FROM tblRoom, tblRoomType WHERE MotelID = ? and tblRoom.RoomTypeID = tblRoomType.RoomTypeID AND (tblRoom.Status = 0 OR tblRoom.Status = 1 ) ";
    private static final String CHECK_ROOMID = "SELECT RoomID FROM tblRoom Where RoomID = ? ";
    private static final String CHECK_ROOMTYPEID = "SELECT RoomTypeID FROM tblRoomType Where RoomTypeID = ?";
    private static final String CREATE = "INSERT [tblRoom] ([RoomID], [Name], [Status], [RoomTypeID]) VALUES(?,?,?,?)";
    private static final String CREATE_ROOMTYPE = "INSERT [tblRoomType] ([RoomTypeID], [TypeName], [Price], [Image], [Desct], [MotelID], [Status]) VALUES(?,?,?,?,?,?,?)";
    private static final String DELETE_ROOM = "UPDATE tblRoom SET Status = 2 WHERE RoomID = ?";
    private static final String UPDATE_ROOM = "UPDATE tblRoom SET Name = ?, RoomTypeID = ? WHERE RoomID = ?";
    private static final String GET_ROOMTYPE = "select rt.RoomTypeID ,rt.TypeName, rt.Image, rt.Price, rt.Desct \n"
            + "from tblRoomType as rt, tblMotel as m \n"
            + "WHERE m.MotelID = rt.MotelID AND rt.Status = 1 AND m.MotelID= ? ";
    private static final String SEARCH_ROOM = "SELECT RoomID, Name, tblRoomType.TypeName, Price, Desct, tblRoom.Status, MotelID FROM tblRoom, tblRoomType WHERE MotelID = ? and tblRoom.RoomTypeID = tblRoomType.RoomTypeID AND tblRoom.Name like ? AND(tblRoom.Status = 0 OR tblRoom.Status = 1 ) ";
    
    public List<RoomDTO> searchRoomByName(String ownerID,String search) throws SQLException {
        List<RoomDTO> listRoom = new ArrayList();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SEARCH_ROOM);
                ptm.setString(1, ownerID);
                ptm.setString(2, "%" + search + "%");
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String roomID = rs.getString("RoomID");
                    String name = rs.getString("Name");
                    String typeName = rs.getString("TypeName");
                    int price = rs.getInt("Price");
                    String desct = rs.getNString("Desct");
                    String motelID = rs.getString("MotelID");
                    int status = rs.getInt("Status");
                    listRoom.add(new RoomDTO(roomID, name, typeName, price, desct, motelID, status));
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
        return listRoom;
    }
    
    public boolean updateRoom(String roomID, String Name, String roomTypeID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATE_ROOM);
                ptm.setString(1, Name);
                ptm.setString(2, roomTypeID);
                ptm.setString(3, roomID);
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

    public boolean insertRoomNew(RoomTypeDTO room) throws SQLException, ClassNotFoundException, NamingException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "INSERT INTO tblBookingDetail(countTime) AND tblRoomType(typeName) "
                        + " VALUES(?) AND VALUES(?)";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, room.getCountTime());
                stm.setString(2, room.getTypeName());
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
    
    public boolean deleteRoom(String roomID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(DELETE_ROOM);
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

    public boolean createRoomType(String roomTypeID, String typeName, int price, String image, String desct, String motelID, int status) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CREATE_ROOMTYPE);
                ptm.setString(1, roomTypeID);
                ptm.setString(2, typeName);
                ptm.setInt(3, price);
                ptm.setString(4, image);
                ptm.setString(5, desct);
                ptm.setString(6, motelID);
                ptm.setInt(7, status);
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

    public boolean createRoom(RoomDTO room) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CREATE);
                ptm.setString(1, room.getRoomId());
                ptm.setString(2, room.getName());
                ptm.setInt(3, room.getStatus());
                ptm.setString(4, room.getRoomType());
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

    public boolean checkRoomID(String roomID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CHECK_ROOMID);
                ptm.setString(1, roomID);
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

    public boolean checkRoomTypeID(String roomTypeID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CHECK_ROOMTYPEID);
                ptm.setString(1, roomTypeID);
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

    public List<RoomDTO> searchRoom(String ownerID) throws SQLException {
        List<RoomDTO> listRoom = new ArrayList();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SHOW_ROOM);
                ptm.setString(1, ownerID);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String roomID = rs.getString("RoomID");
                    String name = rs.getString("Name");
                    String typeName = rs.getString("TypeName");
                    int price = rs.getInt("Price");
                    String desct = rs.getNString("Desct");
                    String motelID = rs.getString("MotelID");
                    int status = rs.getInt("Status");
                    listRoom.add(new RoomDTO(roomID, name, typeName, price, desct, motelID, status));
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
        return listRoom;
    }
    private static final String GET_ROOM_TYPE = "select rt.RoomTypeID ,rt.TypeName, rt.Image, rt.Price, rt.Desct , rt.RoomTypeID, count(r.RoomID) as countRoom\n" +
"	from tblRoomType as rt, tblMotel as m, tblRoom as r\n" +
"	WHERE m.MotelID = rt.MotelID AND rt.Status = 1 AND rt.RoomTypeID=r.RoomTypeID AND m.MotelID= ? AND r.Status=0\n" +
"	GROUP BY rt.RoomTypeID ,rt.TypeName, rt.Image, rt.Price, rt.Desct ,rt.RoomTypeID ";

    public List<RoomTypeDTO> getRoomType(String motelID) throws SQLException {
        List<RoomTypeDTO> listService = new ArrayList();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_ROOM_TYPE);
                ptm.setString(1, motelID);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String roomTypeID = rs.getString("RoomTypeID");
                    String typeName = rs.getString("TypeName");
                    String image = rs.getString("Image");
                    String desct = rs.getString("Desct");
                    int price = rs.getInt("Price");
                    int countRoom = rs.getInt("countRoom");
                    listService.add(new RoomTypeDTO(roomTypeID, typeName, price, motelID, image, desct,countRoom));
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
    //----------- booking insert detail set room----------
    private static final String UPDATE_ROOM_BOOK = "UPDATE tblRoom SET Status = 1 WHERE roomID = ?";

    public boolean updateRoomBT(String roomId) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATE_ROOM_BOOK);
            ptm.setString(1, roomId);
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
    private static final String TOP_ROOM = "SELECT TOP 1 tblRoom.roomID as room  FROM tblRoom, tblRoomType WHERE tblRoom.RoomTypeID= tblRoomType.RoomTypeID AND  tblRoom.Status=0  AND tblRoomType.RoomTypeID = ?";

    public List<RoomDTO> findtoprooom(String id, int cr) throws SQLException {
        List<RoomDTO> listroom = new ArrayList();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(TOP_ROOM);
                //  ptm.setInt(1, cr);
                ptm.setString(1, id);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String roomID = rs.getString("room");
                    listroom.add(new RoomDTO(roomID, 0));
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
        return listroom;

    }
}
