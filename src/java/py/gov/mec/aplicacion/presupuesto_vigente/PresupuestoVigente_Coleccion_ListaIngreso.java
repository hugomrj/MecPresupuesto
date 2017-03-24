
/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */



package py.gov.mec.aplicacion.presupuesto_vigente;

import py.gov.mec.aplicacion.plan.*;
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


@WebServlet(name = "PresupuestoVigente_Coleccion_ListaIngreso", 
        urlPatterns = {"/PresupuestoVigente/Coleccion/ListaIngreso"})


public class PresupuestoVigente_Coleccion_ListaIngreso extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {
        
            response.setContentType("text/html;charset=UTF-8");
        
            PresupuestoVigenteDAO dao = new PresupuestoVigenteDAO();            
            
            List<Map<String, Object>> rows = dao.ListaIngresos();

            request.setAttribute("lista", rows);       
            
            request.getRequestDispatcher("/PresupuestoVigente/jspf/CollectionLista.jspx").include(request, response);        

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
            Logger.getLogger(PresupuestoVigente_Coleccion_ListaIngreso.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(PresupuestoVigente_Coleccion_ListaIngreso.class.getName()).log(Level.SEVERE, null, ex);
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








