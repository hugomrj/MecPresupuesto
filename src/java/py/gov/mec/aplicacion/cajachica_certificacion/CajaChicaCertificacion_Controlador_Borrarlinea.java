/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


package py.gov.mec.aplicacion.cajachica_certificacion;


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


@WebServlet(name = "CajaChicaCertificacion_Controlador_Borrarlinea", 
        urlPatterns = {"/CajaChicaCertificacion/Controlador/Borrarlinea"})



public class CajaChicaCertificacion_Controlador_Borrarlinea extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {


            response.setContentType("text/html;charset=UTF-8");        
            response.setCharacterEncoding("UTF-8");      
            

        Integer mes = 0;
        if (request.getParameter("mes") != null){
            try {
                mes = Integer.parseInt(request.getParameter("mes")) ;     
            } catch (java.lang.NumberFormatException e) {
                mes = 0;
            }            
        }

        
        Integer uoc_id = 0;
        if (request.getParameter("uoc_id") != null){
            try {
                uoc_id = Integer.parseInt(request.getParameter("uoc_id")) ;     
            } catch (java.lang.NumberFormatException e) {
                uoc_id = 0;
            }            
        }
                    
                      
            
            
        try
        {
           Integer codigoid = 0;
            
            CajaChicaCertificacionDAO dao = new CajaChicaCertificacionDAO();
            codigoid = dao.UltimaLinea(uoc_id, mes);
            
            CajaChicaCertificacion cajachica = new CajaChicaCertificacion();
            Persistencia persistencia = new Persistencia();
            
            cajachica = (CajaChicaCertificacion) persistencia.filtrarId(cajachica, codigoid);
            if (cajachica != null){
                cajachica = (CajaChicaCertificacion) persistencia.delete(cajachica);
            }
            
            
            
          
        } catch (Exception ex) {
            Logger.getLogger(CajaChicaCertificacion_Controlador_Borrarlinea.class.getName()).log(Level.SEVERE, null, ex);
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








