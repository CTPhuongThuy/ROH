/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package sample.controller;

import java.io.IOException;
import java.util.List;
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
@WebServlet(name = "FilterMotelController", urlPatterns = {"/FilterMotelController"})
public class FilterMotelController extends HttpServlet {

      private static final String ERROR = "error.jsp";
    private static final String SUCCESS = "user-motel-list.jsp";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String teaString = request.getParameter("price");
            String tmp[]= teaString.split("--");
            String price1 = tmp[0];
            String price2 = tmp[1];
            String district = request.getParameter("district");
            MotelDAO motel1 = new MotelDAO();
            List<MotelDTO> listMotel1 = motel1.getFilterMotel(price1,price2,district);
                if (listMotel1.size() >0) {
                    request.setAttribute("LIST_MOTEL", listMotel1);
                    url = SUCCESS;
                } else {
                    request.setAttribute("MESSAGE", "Không có nhà nghỉ phù hợp, bạn hãy tham khảo các nhà nghỉ khác.");
                    url = SUCCESS;
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
