/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package sample.controller;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sample.motel.MotelDAO;
import sample.motel.MotelDTO;
import sample.owner.feedbackDAO;
import sample.owner.FeedbackDTO;
import sample.room.RoomDAO;
import sample.room.RoomTypeDTO;

/**
 *
 * @author cao thi phuong thuy
 */
@WebServlet(name = "ShowMotelDetailController", urlPatterns = {"/ShowMotelDetailController"})
public class ShowMotelDetailController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String SUCCESS = "user-motel-detail.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String motelID = request.getParameter("motelID");
            MotelDAO motel = new MotelDAO();
            feedbackDAO feedback = new feedbackDAO();
            RoomDAO roomtype = new RoomDAO();
            List<MotelDTO> listMotel = motel.getDetailMotel(motelID);
            List<MotelDTO> listMotel1 = motel.getListMotel();
           List<RoomTypeDTO> listRoomType = roomtype.getRoomType(motelID);
            List<FeedbackDTO> listFeedback = feedback.getDetailFeedback(motelID);
            if (listMotel.size() > 0) {
                request.setAttribute("DETAIL_MOTEL", listMotel);
                if (listRoomType.size() > 0) {
                    request.setAttribute("LIST_ROOMTYPE", listRoomType);
                }
                if (listFeedback.size() > 0) {
                    request.setAttribute("DETAIL_FEEDBACK", listFeedback);
                } else{
                    request.setAttribute("MESSAGE_FEEDBACK", " Chưa có đánh giá nào về motel này.");
                }
                if (listMotel1.size() > 0) {
                request.setAttribute("LIST_MOTEL", listMotel1);
                }
                url = SUCCESS;
            }
            
        } catch (Exception e) {
            log("Error at showlistcontroller: " + e.toString());
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
