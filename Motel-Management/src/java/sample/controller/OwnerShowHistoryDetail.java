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
import sample.owner.FeedbackDTO;
import sample.owner.HistoryDAO;
import sample.owner.HistoryDTO;
import sample.service.ServiceDTO;
import sample.users.UserDTO;

/**
 *
 * @author Bao
 */
@WebServlet(name = "OwnerShowHistoryDetail", urlPatterns = {"/OwnerShowHistoryDetail"})
public class OwnerShowHistoryDetail extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String SUCCESS = "owner-history-detail.jsp";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String bookingID=request.getParameter("bookingID");
            String roomID = request.getParameter("roomID");
            HistoryDAO dao = new HistoryDAO();
            UserDTO userBooking = dao.getUserBooking(bookingID);
            if(userBooking != null){
                request.setAttribute("USER_BOOKING", userBooking);
            }
            FeedbackDTO feedbackBooking = dao.getFeedbackBooking(bookingID);
            if(feedbackBooking != null){
                request.setAttribute("FEEDBACK_BOOKING", feedbackBooking);
            }
            List<ServiceDTO> listService = dao.getListService(bookingID);
            if(listService != null){
                request.setAttribute("LIST_SERVICE", listService);
            }
            HistoryDTO historyDetail = dao.getHistoryDetail(bookingID, roomID);
            if(historyDetail != null){
                request.setAttribute("HISTORY_DETAIL", historyDetail);
                url = SUCCESS;
            }
            
        } catch (Exception e) {
            log("Error at OwnerShowHistoryDetail:"+e.toString());
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
