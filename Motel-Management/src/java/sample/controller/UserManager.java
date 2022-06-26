/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package sample.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author cao thi phuong thuy
 */
@WebServlet(name = "UserManager", urlPatterns = {"/UserManager"})
public class UserManager extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String USER_LIST = "all";
    private static final String USER_LIST_CONTROLLER = "AdminListUser";
    
   private static final String DETAIL_LIST = "detail";
  private static final String DETAIL_LIST_CONTROLLER = "AdminDetailUser";
    
    private static final String DELETE_LIST = "delete";
    private static final String DELETE_LIST_CONTROLLER = "AdminDeleteUser"; 
    private static final String UPDATE_LIST = "update";
    private static final String UPDATE_LIST_CONTROLLER = "AdminUpdateUser"; 
    
    private static final String FEEDBACK_LIST = "feedback";
    private static final String FEEDBACK_LIST_CONTROLLER = "UserFeedbackController";
    private static final String FILTER_LIST = "filter";
    private static final String FILTER_LIST_CONTROLLER = "AdminFilterRole";
    private static final String CANCEL_ROOM = "cancel";
    private static final String CANCEL_ROOM_CONTROLLER = "UserCancelRoom";
    private static final String REPORT_ROOM = "report";
    private static final String REPORT_ROOM_CONTROLLER = "UserReport";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String action = request.getParameter("action");
            if(USER_LIST.equals(action)){
                url = USER_LIST_CONTROLLER;
            }else if (UPDATE_LIST.equals(action)){
                url = UPDATE_LIST_CONTROLLER;
            }else if (DETAIL_LIST.equals(action)){
                url = DETAIL_LIST_CONTROLLER;
            }else if (DELETE_LIST.equals(action)){
                url = DELETE_LIST_CONTROLLER;
            }else if (FILTER_LIST.equals(action)){
                url = FILTER_LIST_CONTROLLER;
            }else if (FEEDBACK_LIST.equals(action)){
                url = FEEDBACK_LIST_CONTROLLER;
            }else if (CANCEL_ROOM.equals(action)){
                url = CANCEL_ROOM_CONTROLLER;
            }else if (REPORT_ROOM.equals(action)){
                url = REPORT_ROOM_CONTROLLER;
            }
        } catch (Exception e) {
            log("Error at MainController: "+e.toString());
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
