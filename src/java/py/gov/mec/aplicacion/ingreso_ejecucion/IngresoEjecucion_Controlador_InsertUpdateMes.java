/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package py.gov.mec.aplicacion.ingreso_ejecucion;

import py.gov.mec.aplicacion.ingreso_certificacion.*;
import java.io.IOException;
import java.io.PrintWriter;

import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "IngresoEjecucion_Controlador_InsertUpdateMes", 
        urlPatterns = {"/IngresoEjecucion/Controlador/InsertUpdateMes"})



public class IngresoEjecucion_Controlador_InsertUpdateMes extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        try
        {
           
            // tengo que capturar los parametros
            if (
                    ( request.getParameter("idreg") != null) &&
                    ( request.getParameter("dire") != null) &&
                    ( request.getParameter("mes") != null) &&
                    ( request.getParameter("monto") != null) 
                )                    
            {
            
                
                Integer plan_id = Integer.parseInt(request.getParameter("idreg")) ;       
                Integer direccion = Integer.parseInt(request.getParameter("dire")) ;
                Integer mes = Integer.parseInt(request.getParameter("mes")) ;       
                Long monto = Long.parseLong(request.getParameter("monto")) ;       
                
                
                
                IngresoEjecucionDAO dao = new  IngresoEjecucionDAO();
                //System.out.println( dao.isRegistroExiste(plan_id, direccion));
            
                // update 
                if (dao.isRegistroExiste(plan_id, direccion)) { 
                    dao.UpdateMes(plan_id, direccion, mes, monto);                    
                }
                // insert
                else
                {
                    dao.InsertMes(plan_id, direccion, mes, monto);
                }
                out.println( plan_id );            
            }
            
          
        } catch (Exception ex) {
            Logger.getLogger(IngresoEjecucion_Controlador_InsertUpdateMes.class.getName()).log(Level.SEVERE, null, ex);
            out.println( "0");            
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








