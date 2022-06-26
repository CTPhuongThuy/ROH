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
@WebServlet(name = "MotelManager", urlPatterns = {"/MotelManager"})
public class MotelManager extends HttpServlet {

    
    private static final String ERROR = "error.jsp";
    private static final String MOTEL_LIST = "all";
    private static final String MOTEL_LIST_CONTROLLER = "AdminShowMotel";
    
    private static final String UPDATE_LIST = "update";
    private static final String UPDATE_LIST_CONTROLLER = "AdminUpdateMotel";
    
   private static final String DETAIL_LIST = "detail";
  private static final String DETAIL_LIST_CONTROLLER = "AdminDetailMotel";
  
    private static final String DELETE_LIST = "delete";
    private static final String DELETE_LIST_CONTROLLER = "AdminDeleteMotel";
    
    private static final String REPORT_LIST = "reportmanager";
    private static final String REPORT_LIST_CONTROLLER = "AdminReport";
    private static final String SEARCH_LIST = "search";
    private static final String SEARCH_LIST_CONTROLLER = "SearchController";
    private static final String FILTER_LIST = "filter";
    private static final String FILTER_LIST_CONTROLLER = "FilterMotelController";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
         String url = ERROR;
        try {
            String action = request.getParameter("action");
            if(MOTEL_LIST.equals(action)){
                url = MOTEL_LIST_CONTROLLER;
            }else if (UPDATE_LIST.equals(action)){
                url = UPDATE_LIST_CONTROLLER;
            }else if (DELETE_LIST.equals(action)){
                url = DELETE_LIST_CONTROLLER;
            }else if (DETAIL_LIST.equals(action)){
                url = DETAIL_LIST_CONTROLLER;
            }else if (REPORT_LIST.equals(action)){
                url = REPORT_LIST_CONTROLLER;
            }else if (SEARCH_LIST.equals(action)){
                url = SEARCH_LIST_CONTROLLER;
            }else if (FILTER_LIST.equals(action)){
                url = FILTER_LIST_CONTROLLER;
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
