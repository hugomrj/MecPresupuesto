/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package py.gov.mec.aplicacion.distribucion_ingreso;

import py.gov.mec.aplicacion.plandetalle.*;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "DistribucionIngreso_Coleccion_Estructura", 
        urlPatterns = {"/DistribucionIngreso/Coleccion/Estructura"})



public class DistribucionIngreso_Coleccion_Estructura extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {
        
        response.setContentType("text/html;charset=UTF-8");

        
        // plan
        Integer idreg;
        if (request.getParameter("idreg") != null){
            try {
                idreg = Integer.parseInt(request.getParameter("idreg")) ;     
            } catch (java.lang.NumberFormatException e) {
                idreg = 0;
            }            
        }
        else{ 
            idreg = 0;  
        }     
        
        
        
            DistribucionIngresoDAO dao = new DistribucionIngresoDAO();
         
            List<Map<String, Object>> rows = dao.ListaPlan(idreg);
                
            request.setAttribute("lista", rows);

        
          request.getRequestDispatcher("/DistribucionIngreso/jspf/estructura.jspx").include(request, response);        


    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(DistribucionIngreso_Coleccion_Estructura.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(DistribucionIngreso_Coleccion_Estructura.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}








