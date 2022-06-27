/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package sample.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sample.motel.MotelDAO;
import sample.room.RoomDAO;
import sample.room.RoomDTO;

/**
 *
 * @author cao thi phuong thuy
 */
@WebServlet(name = "UserCancelRoom", urlPatterns = {"/UserCancelRoom"})
public class UserCancelRoom extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String SUCCESS = "userhistorybooking";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        MotelDAO dao = new MotelDAO();
        try {
            RoomDAO roomdao1 = new RoomDAO();
            String bookingID = request.getParameter("bookingID");
            String roomID = request.getParameter("motelID");
            boolean checkCancel = dao.cancelBooking(bookingID);
            boolean checkBT = false;
            if (checkCancel) {
                List<RoomDTO> findroom = roomdao1.findrooom(bookingID);
                for (RoomDTO roomDTO : findroom) {
                    checkBT = roomdao1.cancelRoom(roomDTO.getRoomId());
                }
                if (checkBT) {
                        url = SUCCESS;
                        request.setAttribute("MESSAGE", "Successfully");
                        request.setAttribute("SUCCESS", "Cập nhật thành công");
                    }
            }
        } catch (Exception e) {
            log("Error at OwnerCreateMotelController:" + e.toString());
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
