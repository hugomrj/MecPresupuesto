/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package py.gov.mec.aplicacion.direccion;

import py.gov.mec.aplicacion.persona.*;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import nebuleuse.ORM.Secuencia;

/**
 * @author hugo
 */


@WebServlet(name = "Direccion_Coleccion_Lista", 
        urlPatterns = {"/Direccion/Coleccion/Lista"})


public class Direccion_Coleccion_Lista extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {
        
        
        response.setContentType("text/html;charset=UTF-8");        
        
        
        // busqueda
        String strBuscar = "";
        strBuscar = (String) request.getParameter("buscar");        
               
        if (strBuscar == null)
        {
            strBuscar = "";        
        }
        

        Secuencia<Direccion> lista = new Secuencia<Direccion>();         
        List<Direccion> direcciones = new ArrayList<Direccion>();       
        
        direcciones = lista.buscarTodos(new Direccion(), strBuscar);

        request.setAttribute("lista", direcciones);
        request.getRequestDispatcher("/Direccion/jspf/CollectionLista.jspx").include(request, response);                
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
            Logger.getLogger(Direccion_Coleccion_Lista.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(Direccion_Coleccion_Lista.class.getName()).log(Level.SEVERE, null, ex);
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
