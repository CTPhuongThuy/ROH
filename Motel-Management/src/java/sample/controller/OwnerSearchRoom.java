/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package sample.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sample.motel.MotelDAO;
import sample.motel.MotelDTO;
import sample.room.RoomDAO;
import sample.room.RoomDTO;
import sample.room.RoomTypeDTO;

/**
 *
 * @author Bao
 */
@WebServlet(name = "OwnerSearchRoom", urlPatterns = {"/OwnerSearchRoom"})
public class OwnerSearchRoom extends HttpServlet {

    private static final String ERROR = "owner-room-list.jsp";
    private static final String SUCCESS = "owner-room-list.jsp";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url =  ERROR;
        try {
            String search = request.getParameter("search");
            String ownerID = request.getParameter("ownerID");
            MotelDAO dao1 = new MotelDAO();
            List<MotelDTO> listMotel = dao1.searchMotel(ownerID);
            List<RoomDTO> listRoom = new ArrayList<>();
            List<RoomTypeDTO> listRoomType = new ArrayList<>();
            if (listMotel.size()>0){
                request.setAttribute("LIST_MOTEL", listMotel);
                RoomDAO dao2 = new RoomDAO();
                for(MotelDTO motel : listMotel){                  
                   List<RoomDTO> list = dao2.searchRoomByName(motel.getMotelID(),search);
                   List<RoomTypeDTO> list2 = dao2.getRoomType(motel.getMotelID());
                   listRoom.addAll(list);
                   listRoomType.addAll(list2);
                }
                request.setAttribute("LIST_ROOM", listRoom);
                request.setAttribute("LIST_ROOMTYPE", listRoomType);
                url=SUCCESS;
            }
            
        } catch (Exception e) {
            log("Error at showlistcontroller: "+e.toString());
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
