/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package sample.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sample.owner.FeedbackDTO;
import sample.owner.NewsDTO;
import sample.owner.OverviewDAO;
import sample.owner.OverviewDTO;
import sample.users.UserDTO;

/**
 *
 * @author Bao
 */
@WebServlet(name = "OwnerShowOverview", urlPatterns = {"/OwnerShowOverview"})
public class OwnerShowOverview extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String SUCCESS = "owner-index.jsp";
 
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            OverviewDAO dao = new OverviewDAO();
            HttpSession session=request.getSession();
            OverviewDTO overview = new OverviewDTO(); 
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser != null){
                String userID = loginUser.getUserId();
                int numberRoom = dao.getNumberRoom(userID);
                int numberService = dao.getNumberService(userID);
                int numberFeedback = dao.getNumberFeedback(userID);
                int totalIncome = dao.getNumberIncome(userID);
                overview = new OverviewDTO(numberRoom, numberService, numberFeedback, totalIncome);
                if (overview != null){
                    request.setAttribute("OVERVIEW", overview);
                    List<NewsDTO> listNews = dao.getListNews(userID);   
                    if( listNews != null ){
                        request.setAttribute("LIST_NEWS", listNews);
                        List<FeedbackDTO> listFeedback = dao.getListFeedback(userID);
                        if(listFeedback != null ){
                            request.setAttribute("LIST_FEEDBACK", listFeedback);
                            url = SUCCESS;
                        }
                    }
                }
            }
        } catch (Exception e) {
            log("Error at OwnerShowOverview: "+e.toString());
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
