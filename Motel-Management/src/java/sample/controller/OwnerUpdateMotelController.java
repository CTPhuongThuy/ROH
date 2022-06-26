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
import sample.motel.MotelDAO;
import sample.motel.MotelDTO;
import sample.motel.MotelError;

/**
 *
 * @author Bao
 */
@MultipartConfig()
@WebServlet(name = "OwnerUpdateMotelController", urlPatterns = {"/OwnerUpdateMotelController"})
public class OwnerUpdateMotelController extends HttpServlet {

    private static final String ERROR = "OwnerShowMotelController";
    private static final String SUCCESS = "OwnerShowMotelController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String motelID = request.getParameter("motelID");
            String motelName = request.getParameter("motelName");
            String phone = request.getParameter("phone");
            String address = request.getParameter("address");
            String districtID = request.getParameter("districtID");
            String desc = request.getParameter("desct");
            Part part = request.getPart("photo");
            String realPath = request.getServletContext().getRealPath("/images");
            String filename = Path.of(part.getSubmittedFileName()).getFileName().toString();
            String pathImage = "C:\\Users\\Bao\\OneDrive\\Documents\\GitHub\\SWP391_1\\Motel-Management\\web\\images";
            boolean checkValidation = true;
            MotelError motelError = new MotelError();
            
            if (!Files.exists(Path.of(pathImage))) {
                Files.createDirectories(Path.of(pathImage));
            }
            
            if(motelName.length()<2 || motelName.length() > 30){
                motelError.setNameError("tên không vượt quá 30 và nhỏ hơn 2!");
                checkValidation = false;
            }
            
            if(!phone.matches("^[0-9]{3,15}$")){
                motelError.setNameError("số điện thoại sai!");
                checkValidation = false;
            }
            
            if(address.length()<2 || address.length() > 35){
                motelError.setNameError("địa chỉ không vượt quá 15 và nhỏ hơn 25!");
                checkValidation = false;
            }
            
            if (checkValidation) {
                if (filename != "") {
                    String image = "images/" + filename;  
                    MotelDAO dao = new MotelDAO();
                    MotelDTO motel = new MotelDTO(motelID,motelName, image, phone,desc, address, districtID, "", 0, "", 0, 0);
                    boolean checkUpdate = dao.updateMotelOwner(motel);
                    if(checkUpdate){
                        request.setAttribute("MESSAGE", "Update Motel Success! ");
                        part.write(pathImage + "/" + filename); 
                        url = SUCCESS;
                    }
                } else {
                    MotelDAO dao = new MotelDAO();
                    MotelDTO motel = new MotelDTO(motelID,motelName, "", phone,desc, address, districtID, "", 0, "", 0, 0);
                    boolean checkUpdate = dao.updateMotelOwner2(motel);
                    if(checkUpdate){
                        request.setAttribute("MESSAGE", "Update Motel Success! ");
                        url = SUCCESS;
                    }
                }
            }else{
                request.setAttribute("MOTEL_ERROR", motelError );
            }

        } catch (Exception e) {
            log("Error at OwnerUpdateMotelController:" + e.toString());
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
