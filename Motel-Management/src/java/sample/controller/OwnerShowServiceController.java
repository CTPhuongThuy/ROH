/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package sample.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sample.motel.MotelDAO;
import sample.motel.MotelDTO;
import sample.service.ServiceDAO;
import sample.service.ServiceDTO;
import sample.users.UserDTO;

/**
 *
 * @author Bao
 */
@WebServlet(name = "OwnerShowServiceController", urlPatterns = {"/OwnerShowServiceController"})
public class OwnerShowServiceController extends HttpServlet {

    private static final String ERROR = "owner-service.jsp";
    private static final String SUCCESS = "owner-service.jsp";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url="ERROR";
        try {
            HttpSession session=request.getSession();
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            String ownerID = loginUser.getUserId();
            MotelDAO dao1 = new MotelDAO();
            List<MotelDTO> listMotel = dao1.searchMotel(ownerID);
            
            if (listMotel.size()>0){
                ServiceDAO dao2 = new ServiceDAO();
                List<ServiceDTO> listService = new ArrayList<>();
                for(MotelDTO motel : listMotel){                  
                   List<ServiceDTO> list = dao2.searchservice(motel.getMotelID());
                   listService.addAll(list);
                }
                if(listService.size() >0){
                request.setAttribute("LIST_SERVICE", listService);
                url=SUCCESS;
                }
            }
        } catch (Exception e) {
            log("Error at OwnerShowServiceController:"+e.toString());
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
