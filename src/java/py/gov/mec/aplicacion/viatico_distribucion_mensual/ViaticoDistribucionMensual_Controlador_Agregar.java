/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package py.gov.mec.aplicacion.viatico_distribucion_mensual;

import py.gov.mec.aplicacion.uoc_certificacion.*;

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



@WebServlet(name = "ViaticoDistribucionMensual_Controlador_Agregar", 
        urlPatterns = {"/ViaticoDistribucionMensual/Controlador/Agregar"})



public class ViaticoDistribucionMensual_Controlador_Agregar extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        
        
        try
        {
           
            ViaticoDistribucionMensual instancia = new ViaticoDistribucionMensual();
            Persistencia persistencia = new Persistencia();
            
            instancia = (ViaticoDistribucionMensual) persistencia.extraerRegistro(request, instancia);   
            instancia = (ViaticoDistribucionMensual) persistencia.insert(instancia, request);
          
            
          
        } catch (Exception ex) {

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








