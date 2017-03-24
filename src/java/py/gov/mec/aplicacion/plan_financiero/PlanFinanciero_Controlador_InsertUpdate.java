/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package py.gov.mec.aplicacion.plan_financiero;

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



@WebServlet(name = "PlanFinanciero_Controlador_InsertUpdate", 
        urlPatterns = {"/PlanFinanciero/Controlador/InsertUpdate"})



public class PlanFinanciero_Controlador_InsertUpdate extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();        
            
        try
        {
          

            Integer registro = 0;
            if ( request.getParameter("presupuesto_id") != null){
                registro = Integer.parseInt(request.getParameter("presupuesto_id")) ;                  
            }

            
            PlanFinanciero instancia = new PlanFinanciero();
            Persistencia persistencia = new Persistencia();
            

            PlanFinancieroDAO dao = new  PlanFinancieroDAO();

            
            
            // update
            if (dao.isRegistroExiste(registro)) {
            
                instancia = (PlanFinanciero) persistencia.extraerRegistro(request, instancia);
                instancia.setId(  Integer.parseInt(request.getParameter("id_tabla")) );
                persistencia.update(instancia, request);

            }
            // insert
            else
            {
                instancia = (PlanFinanciero) persistencia.extraerRegistro(request, instancia);
                instancia = (PlanFinanciero) persistencia.insert(instancia, request);
                
            }
            //out.println( registro );


                    
        } catch (Exception ex) {
            Logger.getLogger(PlanFinanciero_Controlador_InsertUpdate.class.getName()).log(Level.SEVERE, null, ex);
            
            //PrintWriter out = response.getWriter();
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








