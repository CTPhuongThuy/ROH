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
import javax.servlet.http.HttpSession;
import sample.owner.HistoryDAO;
import sample.owner.HistoryDTO;
import sample.users.UserDTO;

/**
 *
 * @author Bao
 */
@WebServlet(name = "OwnerShowHistoryController", urlPatterns = {"/OwnerShowHistoryController"})
public class OwnerShowHistoryController extends HttpServlet {

    private static final String ERROR = "error,jsp";
    private static final String SUCCESS = "owner-history-room.jsp";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        HistoryDAO dao = new HistoryDAO();
        String status = "1";
        try {
            HttpSession session=request.getSession();
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            String ownerID= loginUser.getUserId();
            List<HistoryDTO> listHistory = dao.getListHistory(ownerID);
            if (listHistory != null){
                for (HistoryDTO history : listHistory){
                    if(status.equals(history.getStatus())){
                        String payType = dao.getPayType(history.getBookingID());
                        history.setPayType(payType);
                    }
                    int numberService = dao.getNumberService(history.getBookingID());
                    history.setNumberService(numberService);
                }
                request.setAttribute("LIST_HISTORY", listHistory);
                url = SUCCESS;
            }   
        } catch (Exception e) {
            log("Error at OwnerShowHistoryController:"+e.toString());
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
