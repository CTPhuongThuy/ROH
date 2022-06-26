
package sample.controller;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sample.users.UserDAO;
import sample.users.UserDTO;
import sample.users.UserError;
import java.io.IOException;
import javax.servlet.ServletException;

@WebServlet(name = "CreateUserController", urlPatterns = {"/CreateUserController"})
public class CreateUserController extends HttpServlet {

    private static final String ERROR = "signup.jsp";
    private static final String SUCCESS = "login.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        UserError userError = new UserError();
        try {
            String userId = request.getParameter("userId");
            String fullName = request.getParameter("fullName");
            String phone = request.getParameter("phone");
            String gmail = request.getParameter("gmail");
            String password = request.getParameter("password");
            String role = request.getParameter("role");
            String confirm = request.getParameter("confirm");
            int status = 1;
            UserDAO dao = new UserDAO();
            boolean check = true;
            if (userId.length() > 10 || userId.length() < 2) {
                userError.setUserIdError("UserID contains 2 - 10 characters!");
                check = false;
            }
            if (fullName.length() > 20 || fullName.length() < 5) {
                userError.setFullNameError("FullName Contains 5 - 20 characters!");
                check = false;
            }
            if (phone.length() < 9) {
                userError.setPhoneError("Phone number must at least 9 number");
                check = false;
            }
            if (!password.equals(confirm)) {
                userError.setConfirmpasswordError("Passwords are not the same!");
                check = false;
            }
            if(check == true){
                UserDTO user = new UserDTO(userId, fullName, phone, gmail, password, role, status);
                boolean checkInsert = dao.insertUserNew(user);
                if (checkInsert) {
                    url = SUCCESS;
                }
            } else {
                request.setAttribute("USER_ERROR", userError);
            }

        } catch (Exception e) {
            log("Error at CreateController: " + e.toString());
            if (e.toString().contains("duplicate")) {
                userError.setUserIdError("Duplicate UserID !!!");
                request.setAttribute("USER_ERROR", userError);
            }
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
