/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package sample.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.Random;
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
@WebServlet(name = "OwnerCreateMotelController", urlPatterns = {"/OwnerCreateMotelController"})
public class OwnerCreateMotelController extends HttpServlet {

    private static final String ERROR = "OwnerShowMotelController";
    private static final String SUCCESS = "OwnerShowMotelController";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        MotelError motelError = new MotelError();
        MotelDAO dao = new MotelDAO();
        Random generator = new Random();
        try {
            Part part = request.getPart("photo");          
            String realPath = request.getServletContext().getRealPath("/images");
            String filename = Path.of(part.getSubmittedFileName()).getFileName().toString();
            String pathImage = "C:\\Users\\Bao\\OneDrive\\Documents\\GitHub\\SWP391_1\\Motel-Management\\web\\images";
            
            if(!Files.exists(Path.of(realPath))){
                Files.createDirectories(Path.of(realPath));
            }
            
            String image = "images/" + filename;           
            String ownerID = request.getParameter("ownerID");
            String motelName = request.getParameter("motelName");
            String Phone = request.getParameter("phone");
            String desc = request.getParameter("desct");
            String address = request.getParameter("address");
            String DistrictID = request.getParameter("districtID");
            boolean checkValidation = true;

            if (motelName.length() < 1 || motelName.length() > 30) {
                motelError.setNameError("length of motel must be in 2-30");
                checkValidation = false;
            }
            
            if (Phone.length() < 7 || Phone.length() > 15) {
                motelError.setPhoneError("length of phone number must be in 7-15");
                checkValidation = false;
            }
                      
            
            if (!Phone.matches("[0-9]{2,15}")) {
                motelError.setPhoneError("phone is number");
                checkValidation = false;
            }
            
            if(checkValidation){
                String motelID = "";
                boolean checkID = false;
                    do {
                        motelID = String.valueOf(generator.nextInt(9999999));
                        checkID = dao.checkMotelID(motelID);
                    } while (checkID = false);
                    MotelDTO motel = new MotelDTO(motelID, motelName, image, Phone, desc, address, DistrictID, "", 0, ownerID, 1);
                    boolean checkCreate = dao.createMotel(motel);
                    if(checkCreate){
                        request.setAttribute("MESSAGE", "Create Motel Success! ");
                        part.write(pathImage + "/" + filename); 
                        url = SUCCESS;
                    }
            }
                      
        } catch (Exception e) {
            log("Error at OwnerCreateMotelController:"+e.toString());
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
