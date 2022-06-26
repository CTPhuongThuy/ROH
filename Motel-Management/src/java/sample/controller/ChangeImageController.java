/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package sample.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Path;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import sample.users.UserDAO;

/**
 *
 * @author Bao
 */
@MultipartConfig()
@WebServlet(name = "ChangeImageController", urlPatterns = {"/ChangeImageController"})
public class ChangeImageController extends HttpServlet {

    
    private static final String ERROR = "error.jsp";
    private static final String SUCCESS = "ShowProfileController";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {             
            Part part = request.getPart("photo");
            String realPath = request.getServletContext().getRealPath("/images");
            String filename = Path.of(part.getSubmittedFileName()).getFileName().toString();
            String pathImage = "C:\\Users\\Bao\\OneDrive\\Documents\\GitHub\\SWP391_1\\Motel-Management\\web\\images";
            
            if (!Files.exists(Path.of(pathImage))) {
                Files.createDirectories(Path.of(pathImage));
            }
            
            part.write(pathImage + "/" + filename);
            
            String image = "images/" + filename;
            String userID = request.getParameter("userID");
            UserDAO dao = new UserDAO();
            boolean check = dao.changeImage(userID,image);
            if(check){
                url = SUCCESS;
            }
        } catch (Exception e) {
            e.printStackTrace();
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
