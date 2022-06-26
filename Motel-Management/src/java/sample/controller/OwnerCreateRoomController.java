/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package sample.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import sample.room.RoomDAO;
import sample.room.RoomDTO;
import sample.room.RoomErrorDTO;
import sample.users.UserDAO;

/**
 *
 * @author Bao
 */
@MultipartConfig()
@WebServlet(name = "OwnerCreateRoomController", urlPatterns = {"/OwnerCreateRoomController"})
public class OwnerCreateRoomController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String SUCCESS = "ShowRoomController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        RoomErrorDTO roomError = new RoomErrorDTO();
        RoomDAO dao = new RoomDAO();
        Random generator = new Random();
        try {
            String motelID = request.getParameter("motelID");
            String roomName = request.getParameter("roomName");
            String roomType = request.getParameter("typeofRoom");
            boolean checkValidation = true;

            if (roomName.length() < 1 || roomName.length() > 10) {
                roomError.setNameError("length of roomName must be in 2-10");
                checkValidation = false;
            }

            if (checkValidation) {
                String roomID = "";
                boolean checkID = false;
                boolean checkCreateRoomtype = true;
                if (roomType.equals("custom")) {
                    String roomTypeID = "";
                    do {
                        roomTypeID = String.valueOf(generator.nextInt(9999999));
                        checkID = dao.checkRoomTypeID(roomTypeID);
                    } while (checkID = false);
                    Part part = request.getPart("photo");
                    String realPath = request.getServletContext().getRealPath("/images");
                    String filename = Path.of(part.getSubmittedFileName()).getFileName().toString();
                    String pathImage = "C:\\Users\\Bao\\OneDrive\\Documents\\GitHub\\SWP391_1\\Motel-Management\\web\\images";

                    if (!Files.exists(Path.of(realPath))) {
                        Files.createDirectories(Path.of(realPath));
                    }

                    String image = "images/" + filename;
                    String roomTypeName = request.getParameter("roomType");
                    String desct = request.getParameter("roomTypeDesct");
                    String checkPrice = request.getParameter("price");
                    if (checkPrice.matches("[0-9]{2,10}")) {
                        int price = Integer.parseInt(checkPrice);
                        part.write(pathImage + "/" + filename);                       
                        boolean check = dao.createRoomType(roomTypeID, roomTypeName, price, image, desct, motelID,1);
                        if (check) {
                            roomType = roomTypeID;
                        } else {
                            checkCreateRoomtype = false;
                        }
                    } else {
                        request.setAttribute("ERROR", "price is not character! 2-10");
                        checkCreateRoomtype = false;
                    }
                }

                if (checkCreateRoomtype) {
                    do {
                        roomID = String.valueOf(generator.nextInt(9999999));
                        checkID = dao.checkRoomID(roomID);
                    } while (checkID = false);
                    RoomDTO newRoom = new RoomDTO(roomID, roomName, "", roomType, 0, motelID);
                    boolean checkCreate = dao.createRoom(newRoom);
                    if (checkCreate) {
                        url = SUCCESS;
                        request.setAttribute("MESSAGE", "Create Room Successfully!");
                    }
                }
            }

        } catch (Exception e) {
            log("Error at OwnerCreateRoomController:" + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
