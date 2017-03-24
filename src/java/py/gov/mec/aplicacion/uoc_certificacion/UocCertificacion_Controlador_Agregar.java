/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package py.gov.mec.aplicacion.uoc_certificacion;

import py.gov.mec.aplicacion.plandetalle.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import nebuleuse.ORM.Persistencia;



@WebServlet(name = "UocCertificacion_Controlador_Agregar", 
        urlPatterns = {"/UocCertificacion/Controlador/Agregar"})



public class UocCertificacion_Controlador_Agregar extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        
        
        try
        {
           
            UocCertificacion instancia = new UocCertificacion();
            Persistencia persistencia = new Persistencia();
            
            instancia = (UocCertificacion) persistencia.extraerRegistro(request, instancia);   
            instancia = (UocCertificacion) persistencia.insert(instancia, request);
          
            
          
        } catch (Exception ex) {
            Logger.getLogger(UocCertificacion_Controlador_Agregar.class.getName()).log(Level.SEVERE, null, ex);
            PrintWriter out = response.getWriter();  
            out.println(ex.getMessage());          
        }
        
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
        processRequest(request, response);
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
        processRequest(request, response);
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








