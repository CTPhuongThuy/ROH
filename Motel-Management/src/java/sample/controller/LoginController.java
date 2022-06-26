/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
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

/**
 *
 * @author Bao
 */
@WebServlet(name = "LoginController", urlPatterns = {"/LoginController"})
public class LoginController extends HttpServlet {

    private static final String ERROR="login.jsp";
    private static final String AD="AD";
    private static final String ADMIN_PAGE="AdminShowOverview";
    private static final String US="US";
    private static final String USER_PAGE="ShowMotelController";
    private static final String OWNER="OW";
    private static final String OWNER_PAGE="OwnerShowOverview";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String userId=request.getParameter("userId");
            String password=request.getParameter("password");
            UserDAO dao=new UserDAO();
            UserDTO loginUser= dao.checkLogin(userId, password);
            HttpSession session=request.getSession();           
            if(loginUser!=null){
                session.setAttribute("LOGIN_USER", loginUser);
                session.setAttribute("userId", userId);
                String role=loginUser.getRole();
                if(AD.equals(role)){
                    url=ADMIN_PAGE;
                }else if(US.equals(role)){
                    url=USER_PAGE;
                }else if(OWNER.equals(role)){
                    url=OWNER_PAGE;
                }else{
                    request.setAttribute("ERROR", "Tài khoản của bạn không được được phép");
                }
            }else{
                request.setAttribute("ERROR","Sai tên đăng nhập , mật khẩu");
            }
            
        } catch (Exception e) {
            log("ERROR at loginController: " +e.toString());
        } finally{
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
