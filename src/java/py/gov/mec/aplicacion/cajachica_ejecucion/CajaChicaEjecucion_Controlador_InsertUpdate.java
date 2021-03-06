/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package py.gov.mec.aplicacion.cajachica_ejecucion;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import nebuleuse.ORM.Persistencia;


@WebServlet(name = "CajaChicaEjecucion_Controlador_InsertUpdate", 
        urlPatterns = {"/CajaChicaEjecucion/Controlador/InsertUpdate"})


public class CajaChicaEjecucion_Controlador_InsertUpdate extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();        

        
        try
        {

            Integer registro = 0;
            if ( request.getParameter("uoc_id") != null)
            {
                registro = Integer.parseInt(request.getParameter("uoc_id")) ;                  
            }

            
            CajaChicaEjecucion instancia = new CajaChicaEjecucion();
            Persistencia persistencia = new Persistencia();
            //  CajaChicaEjecucionDAO ejecucionDAO = new  CajaChicaDistribucionDAO(); 
            CajaChicaEjecucionDAO  ejecucionDAO = new CajaChicaEjecucionDAO();                

            
            // update
            if (ejecucionDAO.isRegistroExiste(registro)) 
            {
                
                
                instancia = (CajaChicaEjecucion) persistencia.extraerRegistro(request, instancia);
                instancia.setId(  Integer.parseInt(request.getParameter("id_eje_tabla")) );
                persistencia.update(instancia, request);
      
/*                
                
                boolean control;
                control = Certificaciondao.actualizarSaldo(instancia );
         
                if (control == true){
                    persistencia.update(instancia, request);
                }
                else
                {
                    throw new Exception("No se puede actualizar");
                }

   */             

            }
            // insert
            else
            {
                
                
System.out.println("entra en insert");                
                
                instancia = (CajaChicaEjecucion) persistencia.extraerRegistro(request, instancia);
                instancia = (CajaChicaEjecucion) persistencia.insert(instancia, request);
                
            }
            //out.println( registro );


                    
        } catch (Exception ex) {
            //Logger.getLogger(CajaChicaDistribucion_Controlador_InsertUpdate.class.getName()).log(Level.SEVERE, null, ex);
            
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








