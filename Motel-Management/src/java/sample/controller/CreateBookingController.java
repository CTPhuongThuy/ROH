package sample.controller;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sample.users.UserDAO;
import sample.users.UserDTO;
import sample.motel.MotelDAO;
import sample.motel.MotelDTO;
import sample.room.RoomDAO;
import sample.room.RoomTypeDTO;
import sample.users.UserError;
import java.io.IOException;
import java.sql.Date;
import java.util.Random;
import javax.servlet.ServletException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;

@WebServlet(name = "CreateBookingController", urlPatterns = {"/CreateBookingController"})
public class CreateBookingController extends HttpServlet {

    private static final String ERROR = "signup.jsp";
    private static final String SUCCESS = "user-booking.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        UserError userError = new UserError();
        Random generator = new Random();
        Date date = new Date(0);
        try {
            Date bookingDate = Date.valueOf(LocalDate.now());
            String paymentType = request.getParameter("payment");
            String fullName = request.getParameter("fullName");
            String phone = request.getParameter("phone");
            String gmail = request.getParameter("gmail");
            String name = request.getParameter("name");
            String address = request.getParameter("address");
            int countTime = Integer.parseInt(request.getParameter("counttime"));
            String typeName = request.getParameter("typename");
            UserDAO dao = new UserDAO();
            MotelDAO dao1 = new MotelDAO();
            RoomDAO dao2 = new RoomDAO();
            boolean check = true;
            if (check) {
                boolean checkID = false;
                String userId = String.valueOf(generator.nextInt(9999999));
                checkID = dao.checkUserID(userId);
                UserDTO user = new UserDTO(userId, fullName, "", 0, "", "", phone, gmail, "", "", "", 1);
                boolean checkInsert = dao.insertUserNew(user);
                if (checkInsert) {
                    url = SUCCESS;
                }
            } else {
                request.setAttribute("BOOKING_ERROR", userError);
            }
            if (check) {
                boolean checkID = false;
                String motelID = request.getParameter("motelID");
                String bookingID = String.valueOf(generator.nextInt(9999999));
                checkID = dao1.checkMotelID(motelID);
                MotelDTO motel = new MotelDTO("", name, "", "", address, "", "", 0, bookingDate, "", 0, "", "", 1, bookingID, paymentType);
                boolean checkInsert1 = dao1.insertMotelNew(motel);
                if (checkInsert1) {
                    url = SUCCESS;
                }
            } else {
                request.setAttribute("BOOKING_ERROR1", userError);
            }
            if (check) {
                RoomTypeDTO room = new RoomTypeDTO(typeName, countTime);
                boolean checkInsert2 = dao2.insertRoomNew(room);
                if (checkInsert2) {
                    url = SUCCESS;
                }
            } else {
                request.setAttribute("BOOKING_ERROR2", userError);
            }
        } catch (Exception e) {
            log("Error at CreateController: " + e.toString());
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
