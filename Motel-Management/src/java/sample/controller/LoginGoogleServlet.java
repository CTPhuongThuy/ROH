/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package sample.controller;

import java.io.IOException;
import java.util.Random;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sample.users.UserDAO;
import sample.users.UserDTO;
import sample.users.UserGoogleDTO;

@WebServlet("/LoginGoogleServlet")
public class LoginGoogleServlet extends HttpServlet {

    private static final String ERROR = "login.jsp";
    private static final String US = "US";
    private static final String USER_PAGE = "ShowMotelController";
    private static final long serialVersionUID = 1L;

    public LoginGoogleServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String url = ERROR;
        try{
        String code = request.getParameter("code");
        if (code == null || code.isEmpty()) {
            RequestDispatcher dis = request.getRequestDispatcher("login.jsp");
            dis.forward(request, response);
        } else {
            String accessToken = GoogleUtils.getToken(code);
            UserGoogleDTO googlePojo = GoogleUtils.getUserInfo(accessToken);
            request.setAttribute("id", googlePojo.getId());
            request.setAttribute("name", googlePojo.getName());
            request.setAttribute("email", googlePojo.getEmail());
            request.setAttribute("picture", googlePojo.getPicture());
            String id = request.getAttribute("id").toString();
            String name = request.getAttribute("name").toString();
            String email = request.getAttribute("email").toString();
            String image = request.getAttribute("picture").toString();
            UserDAO dao = new UserDAO();
            UserDTO checkemail = dao.checkEmail(email);
            if (checkemail != null) {
                HttpSession session = request.getSession();
                session.setAttribute("LOGIN_USER", checkemail);
                UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
                session.setAttribute("userId", loginUser.getUserId());
                url = USER_PAGE;
            } else {
                Random generator = new Random();
                String userId = String.valueOf(generator.nextInt(9999999));
                String password = "***";
                String role = "US";
                int status = 1;
                UserDTO usergoogle = new UserDTO(userId, name, image, 0, "", "", "", email, "", role, status);
               
                boolean checkInsert = dao.insertUserGoogle(usergoogle);
                if (checkInsert) {
                    HttpSession session = request.getSession();
                    session.setAttribute("LOGIN_USER", usergoogle);
                session.setAttribute("userId", userId);
                    url = USER_PAGE;
                }
            }
//            RequestDispatcher dis = request.getRequestDispatcher("ShowMotelController");
//            dis.forward(request, response);
        }
        }catch (Exception e) {
            log("Error at LoginController: " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
