/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package py.gov.mec.aplicacion.cajachica;

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



@WebServlet(name = "CajaChica_Cabecera_Linea", 
        urlPatterns = {"/CajaChica/Cabecera/Linea"})


public class CajaChica_Cabecera_Linea extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {
        
        response.setContentType("text/html;charset=UTF-8");

            
            Integer codigo = 0;                
            if ( request.getParameter("registro") != null) 
            {  
                codigo = Integer.parseInt(request.getParameter("registro")) ;    
            }
                
                CajaChicaDAO dao = new CajaChicaDAO();
                List<Map<String, Object>> rows = dao.RegistroID(codigo);
                request.setAttribute("lista", rows);

            request.getRequestDispatcher("/Cajachica/jspf/CabeceraLinea.jspx").include(request, response);        


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
            Logger.getLogger(CajaChica_Cabecera_Linea.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(CajaChica_Cabecera_Linea.class.getName()).log(Level.SEVERE, null, ex);
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








