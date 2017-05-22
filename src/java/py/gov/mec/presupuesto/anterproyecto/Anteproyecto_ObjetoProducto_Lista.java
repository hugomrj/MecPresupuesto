
/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */



package py.gov.mec.presupuesto.anterproyecto;


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


@WebServlet(name = "Anteproyecto_ObjetoProducto_Lista", 
        urlPatterns = {"/Anteproyecto/ObjetoProducto/Lista"})


public class Anteproyecto_ObjetoProducto_Lista extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {
        
            response.setContentType("text/html;charset=UTF-8");
        
            AnteproyectoDAO dao = new AnteproyectoDAO();            
            
            
        Integer tp = 0;
        Integer pg = 0;
        Integer sp = 0;
        Integer py = 0;        
        Integer pr = 0;
        
        if (request.getParameter("tp") != null)
        {
            tp = Integer.parseInt( request.getParameter("tp"));       
        }
        
        if (request.getParameter("pg") != null)
        {
            pg = Integer.parseInt( request.getParameter("pg"));       
        }
        
        if (request.getParameter("sp") != null)
        {
            sp = Integer.parseInt( request.getParameter("sp"));       
        }
        
        if (request.getParameter("py") != null)
        {
            py = Integer.parseInt( request.getParameter("py"));       
        }
        
        if (request.getParameter("pr") != null)
        {
            pr = Integer.parseInt( request.getParameter("pr"));       
        }
                                    
            List<Map<String, Object>> rows = dao.ObjetoProductoLista(tp, pg, sp, py);
            request.setAttribute("lista", rows);                   
            request.getRequestDispatcher("/Anteproyecto/jspf/ObjetoProductoLista.jspx").include(request, response);        

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
            Logger.getLogger(Anteproyecto_ObjetoProducto_Lista.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(Anteproyecto_ObjetoProducto_Lista.class.getName()).log(Level.SEVERE, null, ex);
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








