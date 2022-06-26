/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package sample.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sample.motel.MotelDAO;
import sample.motel.MotelDTO;

/**
 *
 * @author cao thi phuong thuy
 */
@WebServlet(name = "AdminUpdateMotel", urlPatterns = {"/AdminUpdateMotel"})
public class AdminUpdateMotel extends HttpServlet {

     
    private static final String ERROR = "error.jsp";
    private static final String SUCCESS = "AdminShowMotel";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
       try{
           String motelID = request.getParameter("motelID");
            String name = request.getParameter("name");
            String image = request.getParameter("image");
            String phone = request.getParameter("phone");
            String Desct = request.getParameter("Desct");
            double rating = Double.parseDouble(request.getParameter("rating"));
            int status = Integer.parseInt(request.getParameter("status"));
            MotelDTO motel = new MotelDTO(motelID, name, image, phone, Desct, rating, status);
             MotelDAO dao = new MotelDAO();
            boolean check = dao.updateMotel(motel);
            if (check) {
                    request.setAttribute("MESSAGE", "Update successfully");
                    url = SUCCESS;
                } else {
                    request.setAttribute("ERROR_MESSAGE", "Update fail");
                    url = ERROR;
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
