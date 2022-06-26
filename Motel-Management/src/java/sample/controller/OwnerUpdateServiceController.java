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
import sample.service.ServiceDAO;
import sample.service.ServiceDTO;
import sample.service.ServiceErrorDTO;

/**
 *
 * @author Bao
 */
@WebServlet(name = "OwnerUpdateServiceController", urlPatterns = {"/OwnerUpdateServiceController"})
public class OwnerUpdateServiceController extends HttpServlet {

    private static final String ERROR ="OwnerShowServiceController";
    private static final String SUCCESS ="OwnerShowServiceController";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String serviceID = request.getParameter("serviceID");
            String serviceName = request.getParameter("serviceName");
            String price = request.getParameter("price");
            boolean checkValidation = true;
            ServiceErrorDTO serviceError = new ServiceErrorDTO();
            
            if(serviceName.length()<2 || serviceName.length() > 30){
                serviceError.setNameError("tên không vượt quá 30 và nhỏ hơn 2!");
                checkValidation = false;
            }
            
            if(!price.matches("^[0-9]{3,15}$")){
                serviceError.setNameError("giá tiền nhập sai!");
                checkValidation = false;
            }
            
            if(checkValidation){
                int priceService = Integer.parseInt(price);
                ServiceDTO service = new ServiceDTO(serviceID, serviceName, priceService, 0, 0);
                ServiceDAO dao = new ServiceDAO();
                boolean checkUpdate = dao.updateService(service);
                if(checkUpdate){
                    request.setAttribute("MESSAGE", "Update Success!");
                    url = SUCCESS;
                }else{
                    request.setAttribute("MESSAGE", "ERROR");
                }
            }else{
                request.setAttribute("SERVICE_ERROR", serviceError );
            }
        } catch (Exception e) {
            log("Error at OwnerUpdateServiceController:" +e.toString());
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
