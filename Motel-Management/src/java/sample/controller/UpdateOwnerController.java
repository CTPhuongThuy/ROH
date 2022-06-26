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
import javax.servlet.http.HttpSession;
import sample.users.UserDAO;
import sample.users.UserDTO;
import sample.users.UserError;

/**
 *
 * @author Bao
 */
@WebServlet(name = "UpdateOwnerController", urlPatterns = {"/UpdateOwnerController"})
public class UpdateOwnerController extends HttpServlet {

    private static final String ERROR= "ShowProfileController";
    private static final String SUCCESS = "ShowProfileController";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        UserError userError = new UserError();
        try {
            String userID = request.getParameter("userID");
            String fullName = request.getParameter("name");
            String CitizenNumber = request.getParameter("citizenNumber");
            String address = request.getParameter("address");
            String birthday = request.getParameter("birthDay");
            String phone = request.getParameter("phone");
            String email = request.getParameter("gmail");
            int gender = Integer.parseInt(request.getParameter("gender"));
            boolean checkValidation = true;

            if (fullName.length() < 5 || fullName.length() > 20) {
                userError.setFullNameError("full Name must be in 5-20");
                checkValidation = false;
            }
            if (phone.length() < 10 || phone.length() > 15) {
                userError.setPhoneError("phone number must be in 10-15");
                checkValidation = false;
            }
            if (CitizenNumber.length() < 7 || CitizenNumber.length() > 12){
                userError.setCitizenNumberError("CitizenNumber must be in range 8-11");
                checkValidation = false;
            }           
            
            
            if (checkValidation) {
                UserDAO dao = new UserDAO();             
                UserDTO user = new UserDTO(userID, fullName, "", gender, birthday, CitizenNumber, phone, email, address, "", "", 1);
                boolean checkUpdate = dao.update(user);
                if (checkUpdate) {
                    HttpSession session = request.getSession();
                    UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
                    if (loginUser != null) {
                        if (loginUser.getUserId().equals(userID)) {
                            if (!loginUser.getFullName().equals(fullName)) {
                                loginUser.setFullName(fullName);
                                session.setAttribute("LOGIN_USER", loginUser);
                            }
                        }
                    }
                    request.setAttribute("SUCCESS", "UPDATE SUCCESSFULLY!");
                    url = SUCCESS;
                }
            }else{
                request.setAttribute("USER_ERROR", userError);
            }
        } catch (Exception e) {
            log("Error at ShowProfile Controller: " + e.toString());
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
