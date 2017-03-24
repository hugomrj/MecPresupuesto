/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package py.gov.mec.aplicacion.cajachica_certificacion;


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


@WebServlet(name = "CajaChicaCertificacion_Coleccion_ListaMes", 
        urlPatterns = {"/CajaChicaCertificacion/Coleccion/ListaMes"})


public class CajaChicaCertificacion_Coleccion_ListaMes extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {
        
        response.setContentType("text/html;charset=UTF-8");

        
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
        
        
        CajaChicaCertificacionDAO dao = new CajaChicaCertificacionDAO();
        
        List<Map<String, Object>> rows = dao.ListaMes(uoc_id, mes);
        
        request.setAttribute("lista", rows);
                       
        request.getRequestDispatcher("/CajachicaCertificacion/jspf/CollectionListaMes.jspx").include(request, response);        


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
            Logger.getLogger(CajaChicaCertificacion_Coleccion_ListaMes.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(CajaChicaCertificacion_Coleccion_ListaMes.class.getName()).log(Level.SEVERE, null, ex);
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








