/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package sample.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sample.motel.MotelDAO;
import sample.motel.MotelDTO;
import sample.owner.feedbackDAO;
import sample.owner.FeedbackDTO;
import sample.room.RoomDAO;
import sample.room.RoomTypeDTO;
import sample.room.TestDAO;
import sample.room.TestDTO;
import sample.service.ServiceDAO;
import sample.service.ServiceDTO;
import sample.users.UserDAO;
import sample.users.UserDTO;

/**
 *
 * @author cao thi phuong thuy
 */
@WebServlet(name = "ShowMotelBookingController", urlPatterns = {"/ShowMotelBookingController"})
public class ShowMotelBookingController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String SUCCESS = "user-booking.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = SUCCESS;
        try {

            String motelID = request.getParameter("motelID");
            MotelDAO motel = new MotelDAO();
            feedbackDAO feedback = new feedbackDAO();
            List<MotelDTO> listMotel = motel.getDetailMotel(motelID);
            List<MotelDTO> listMotel1 = motel.getListMotel();
            // List<RoomTypeDTO> listRoomType = roomtype.getRoomTypeTest(motelID);
            List<FeedbackDTO> listFeedback = feedback.getDetailFeedback(motelID);

            if (listMotel.size() > 0) {
                request.setAttribute("DETAIL_MOTEL", listMotel);
//                if (listRoomType.size() > 0) {
//                    request.setAttribute("LIST_ROOMTYPE", listRoomType);
//                }
                if (listFeedback.size() > 0) {
                    request.setAttribute("DETAIL_FEEDBACK", listFeedback);
                }
                if (listMotel1.size() > 0) {
                    request.setAttribute("LIST_MOTEL", listMotel1);
                }

                //======================
                TestDAO test = new TestDAO();
                String[] roomTypeID = request.getParameterValues("roomTypeID[]");
                String[] typeName = request.getParameterValues("typename[]");
                String[] price = request.getParameterValues("price[]");
                String[] countroom = request.getParameterValues("countroom[]");
                String[] counttime = request.getParameterValues("counttime[]");
                int total = 0;
                List<TestDTO> listTest = new ArrayList();
                for (int i = 0; i < roomTypeID.length; i++) {
                    String id = roomTypeID[i];
                    String name = typeName[i];
                    int p = Integer.parseInt(price[i]);
                    int cr = Integer.parseInt(countroom[i]);
                    int ct = Integer.parseInt(counttime[i]);
                    listTest.add(new TestDTO(id, name, p, ct, cr));
                    total += p * cr * ct;
                }
                request.setAttribute("listTest", listTest);
                request.setAttribute("total", total);

                //========
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
