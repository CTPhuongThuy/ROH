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
import sample.users.UserDAO;
import sample.users.UserDTO;
import sample.users.UserError;

/**
 *
 * @author Bao
 */
@WebServlet(name = "ChangePassWordController", urlPatterns = {"/ChangePassWordController"})
public class ChangePassWordController extends HttpServlet {

    private static final String ERROR = "ShowProfileController";
    private static final String SUCCESS = "ShowProfileController";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        UserError userError = new UserError();
        try {
            String userID = request.getParameter("userID");
            String oldPassword = request.getParameter("oldpassword");
            String newPassword = request.getParameter("newpassword");
            String ConfirmPassword = request.getParameter("confirmpassword");
            UserDAO dao = new UserDAO();
            if (newPassword.length() > 5 && newPassword.length() < 15) {
                UserDTO user = dao.checkLogin(userID, oldPassword);
                if (user != null) {
                    if (newPassword.equals(ConfirmPassword)) {
                        boolean check = dao.changePassword(userID, newPassword);
                        if (check) {
                            request.setAttribute("SUCCESS", "Change Password successfully !");
                            url = SUCCESS;
                        }
                    } else {
                        userError.setConfirmpasswordError("confirm password is not same !");
                        request.setAttribute("USER_ERROR", userError);
                    }
                } else {
                    userError.setPasswordError("Your old password is wrong!");
                    request.setAttribute("USER_ERROR", userError);
                }
            } else{
                request.setAttribute("ERROR", "password >5 and pasword <15");
            }
        } catch (Exception e) {
            log("Error at ChangePasswordController: " + e.toString());
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
