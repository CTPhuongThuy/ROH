/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package sample.controller;

import java.io.IOException;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sample.owner.FeedbackDTO;
import sample.users.UserDAO;

/**
 *
 * @author cao thi phuong thuy
 */
@WebServlet(name = "UserFeedbackController", urlPatterns = {"/UserFeedbackController"})
public class UserFeedbackController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String SUCCESS = "userhistorybooking";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
         String url = ERROR;
        UserDAO dao = new UserDAO();
        Random generator = new Random();
        try { 
           String bookingID = request.getParameter("bookingID");
          String feedbackID = String.valueOf(generator.nextInt(9999999));
            String userID = request.getParameter("userID");
            int rating = Integer.parseInt(request.getParameter("rating"));
            String desct = request.getParameter("desct");
            String motelID = request.getParameter("motelID");
            int status = 1;
             FeedbackDTO feedback = new FeedbackDTO(userID, feedbackID, desct, rating, motelID, status, bookingID);
            boolean checkInsert = dao.insertFeedback(feedback);
                if (checkInsert) {
                request.setAttribute("MESSAGE", "Successfully");
                    url = SUCCESS;
                }
        } catch (Exception e) {
            log("Error at OwnerCreateMotelController:"+e.toString());
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
