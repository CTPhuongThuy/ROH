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
import sample.address.addressDAO;
import sample.address.cityDTO;
import sample.address.districtDTO;
import sample.motel.MotelDAO;
import sample.motel.MotelDTO;
import sample.users.UserDTO;

/**
 *
 * @author Bao
 */
@WebServlet(name = "OwnerShowMotelController", urlPatterns = {"/OwnerShowMotelController"})
public class OwnerShowMotelController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String SUCCESS = "owner-motel.jsp";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            HttpSession session=request.getSession();
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            String ownerID = loginUser.getUserId();
            MotelDAO dao = new MotelDAO();
            List<MotelDTO> listMotel = dao.searchMotel(ownerID);
            if(listMotel.size()>0){              
                for(MotelDTO motel : listMotel){                  
                   int income = dao.getMotelIncome(motel.getMotelID());
                   motel.setMotelprice(income);
                   int numberRoomtype = dao.getNumberRoomtype(motel.getMotelID());
                   motel.setNumberRoomType(numberRoomtype);
                   int numberRoom = dao.getNumberRoom(motel.getMotelID());
                   motel.setNumberRoom(numberRoom);
                }
                request.setAttribute("LIST_MOTEL", listMotel);
                url = SUCCESS;
            }
            addressDAO dao2 = new addressDAO();
            List<cityDTO> listCity = dao2.getListCity();
            List<districtDTO> listDistrict = dao2.getListDistrict();
            if(listCity.size()>0){
                request.setAttribute("LIST_CITY", listCity);
            }
            if(listDistrict.size() >0){
                request.setAttribute("LIST_DISTRICT", listDistrict);
            }
        } catch (Exception e) {
            log("Error at OwnerShowMotelController:"+e.toString());
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
