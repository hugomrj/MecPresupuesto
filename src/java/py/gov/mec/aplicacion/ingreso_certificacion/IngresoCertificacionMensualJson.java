/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package py.gov.mec.aplicacion.ingreso_certificacion;

import py.gov.mec.aplicacion.distribucion_ingreso.*;
import com.google.gson.Gson;
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

/**
 *
 * @author hugo
 */
@WebServlet(name = "IngresoCertificacionMensualJson", 
        urlPatterns = {"/IngresoCertificacion/Mensual.json"})



public class IngresoCertificacionMensualJson extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {
        
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        
                
        PrintWriter out = response.getWriter();
        try 
        {
            
            if (
                    ( request.getParameter("idreg") != null) &&
                    ( request.getParameter("dire") != null) &&
                    ( request.getParameter("mes") != null) 
                )
                    
            {

                
                Integer id = Integer.parseInt(request.getParameter("idreg")) ;       
                Integer direccion = Integer.parseInt(request.getParameter("dire")) ;       
                Integer mes = Integer.parseInt(request.getParameter("mes")) ;       
                
                
                IngresoCertificacionDAO dao = new IngresoCertificacionDAO();
               
                
                Gson gson = new Gson ();
                String formatoJSON = gson.toJson(dao.DistribucionMes(id, direccion, mes)  );
                out.println(formatoJSON);            

            }            
        } 
        finally 
        {
            out.close();
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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(IngresoCertificacionMensualJson.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(IngresoCertificacionMensualJson.class.getName()).log(Level.SEVERE, null, ex);
        }
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
