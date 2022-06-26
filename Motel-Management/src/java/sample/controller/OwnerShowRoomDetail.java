/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package sample.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sample.owner.RoomDetailDAO;
import sample.owner.RoomDetailDTO;
import sample.room.RoomTypeDTO;
import sample.service.ServiceDAO;
import sample.service.ServiceDTO;
import sample.users.UserDAO;
import sample.users.UserDTO;

/**
 *
 * @author Bao
 */
@WebServlet(name = "OwnerShowRoomDetail", urlPatterns = {"/OwnerShowRoomDetail"})
public class OwnerShowRoomDetail extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String SUCCESS = "owner-room-list-details.jsp";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        RoomDetailDAO Rdao =new RoomDetailDAO();
        UserDAO Udao = new UserDAO();
        ServiceDAO Sdao = new ServiceDAO();
        try {
            String roomID = request.getParameter("roomID");
            int status = Integer.parseInt(request.getParameter("status"));
            if(status == 1){
                RoomDetailDTO roomDetail = Rdao.getRoomDetail(roomID);
                if(roomDetail != null){
                    request.setAttribute("ROOM_DETAIL", roomDetail);
                    UserDTO userProfile = Udao.getUserProfile(roomDetail.getUserID());
                    if(userProfile != null){
                        request.setAttribute("USER_PROFILE", userProfile);
                        List<ServiceDTO> servicelist = Sdao.getServiceBooking(roomDetail.getBookingID());
                        url = SUCCESS;
                        if(servicelist != null){
                            request.setAttribute("SERVICE_LIST", servicelist);
                            int totalRoom = Rdao.getBookingPrice(roomDetail.getBookingID());
                            request.setAttribute("TOTAL_ROOM", totalRoom);
                        }
                    }        
                }
            }else{
                RoomDetailDTO roomDetail = Rdao.getRoomDetailNull(roomID);
                if(roomDetail != null){
                    request.setAttribute("ROOM_DETAIL", roomDetail);
                    request.setAttribute("TOTAL_ROOM", 0);
                    List<RoomTypeDTO> listRoomtype = Rdao.getRoomType(roomDetail.getMotelID());
                    if (listRoomtype != null){
                        request.setAttribute("LIST_ROOMTYPE", listRoomtype);
                        url = SUCCESS;
                    }
                }
            }
            
        } catch (Exception e) {
            log("Error at OwnerShowRoomDetail: "+e.toString());
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
