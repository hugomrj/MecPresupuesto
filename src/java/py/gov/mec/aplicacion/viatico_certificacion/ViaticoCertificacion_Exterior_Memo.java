/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package py.gov.mec.aplicacion.viatico_certificacion;



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



@WebServlet(name = "ViaticoCertificacion_Exterior_Memo", 
        urlPatterns = {"/ViaticoCertificacion/Exterior/Memo"})


public class ViaticoCertificacion_Exterior_Memo extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {
        
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


            Integer planf = 0;
            if (request.getParameter("planf") != null){
                try {
                    planf = Integer.parseInt(request.getParameter("planf")) ;     
                } catch (java.lang.NumberFormatException e) {
                    planf = 0;
                }            
            }            


            Integer nroid = 0;
            if (request.getParameter("nroid") != null){
                try {
                    nroid = Integer.parseInt(request.getParameter("nroid")) ;     
                } catch (java.lang.NumberFormatException e) {
                    nroid = 0;
                }            
            }      
            
                
                ViaticoCertificacionDAO dao = new ViaticoCertificacionDAO();                
                List<Map<String, Object>> rows = dao.ExteriorMemo(planf, mes, nroid);
                request.setAttribute("lista", rows);     
                request.getRequestDispatcher("/ViaticoCertificacion/jspf/exteriorMemo.jspx").include(request, response);        


                
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
            Logger.getLogger(ViaticoCertificacion_Exterior_Memo.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(ViaticoCertificacion_Exterior_Memo.class.getName()).log(Level.SEVERE, null, ex);
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








