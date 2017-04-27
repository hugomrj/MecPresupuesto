/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package py.gov.mec.sistema.permiso;



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
import py.gov.mec.sistema.usuario.Usuario;


@WebServlet(name = "Permiso_Coleccion_Lista", 
        urlPatterns = {"/Permiso/Coleccion/Lista"})

public class Permiso_Coleccion_Lista extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {
        
        response.setContentType("text/html;charset=UTF-8");

               
            // recuperar usuario logueado
            Usuario usuario = new Usuario();
            usuario = (Usuario) request.getSession().getAttribute("SessionUsuario");
        
            if (usuario == null){            
                //System.out.println("es nulo usuario");
            }
            else
            {
                PermisoDAO dao = new PermisoDAO();
                List<Map<String, Object>> rows = dao.Lista(usuario);
                //request.setAttribute("lista", rows);
                
                request.setAttribute("lista", rows);
                
                request.getRequestDispatcher("/Permiso/jspf/lista.jspx").include(request, response);     
                
                //System.out.println(usuario.getCuenta());
            
            }
            
            
        
        /*
            
         
            
                
            
        */
            
            
              


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
            Logger.getLogger(Permiso_Coleccion_Lista.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(Permiso_Coleccion_Lista.class.getName()).log(Level.SEVERE, null, ex);
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








