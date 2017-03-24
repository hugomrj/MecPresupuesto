/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package py.gov.mec.aplicacion.direccion;

import py.gov.mec.aplicacion.persona.*;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import nebuleuse.ORM.Persistencia;


@WebServlet(name = "Direccion_Controlador_Editar",
        urlPatterns = {"/Direccion/Controlador/Editar"})


public class Direccion_Controlador_Editar extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
            response.setContentType("text/html;charset=UTF-8");        

        try
        {

            Direccion  instancia = new Direccion();
            Persistencia persistencia = new Persistencia();
            instancia = (Direccion) persistencia.extraerRegistro(request, instancia);
            
            instancia =  (Direccion) persistencia.update(instancia, request);
              
        }
        
        catch (Exception ex) {
            //Logger.getLogger(Persona_Controlador_Agregar.class.getName()).log(Level.SEVERE, null, ex);
            
            PrintWriter out = response.getWriter();
            out.println(ex.getMessage());      
            
        }
        
        /*
        catch (SQLException sqlEx)
        {            
            Mensaje mensaje = new Mensaje();                             
            mensaje.setMensajeBase(sqlEx.getMessage());            
            request.getSession().setAttribute("SessionMensajes", mensaje);
            
        } 
        */
        

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
