/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package py.gov.mec.aplicacion.documento_movimiento;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import py.gov.mec.sistema.usuario.Usuario;

/**
 *
 * @author hugo
 */
@WebServlet(name = "DocumentoMovimiento_HTML_Estado", 
        urlPatterns = {"/DocumentoMovimiento/HTML/Estado"})


public class DocumentoMovimiento_HTML_Estado extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            

            Usuario usuario = new Usuario ();
            usuario = usuario.getSession(request);
                                                
            if (usuario != null) {
                
                // codigo de documento 
                Integer doc = 0;
                if ( request.getParameter("doc") != null)
                {
                    doc =  Integer.parseInt( request.getParameter("doc"))  ;
                                        
                    DocumentoMovimientoDAO dao = new DocumentoMovimientoDAO ();
                    DocumentoMovimiento docMovimiento = new DocumentoMovimiento();
                    
                    docMovimiento = dao.UsuarioEstado(doc);            
                    

                    // si el documento estado es distinto a salida o archivado
                    // 3 y 4
                    

                    if (docMovimiento.getEstado().getId() != 3 && docMovimiento.getEstado().getId() != 4  )
                    {
                        if (docMovimiento.getUsuario().getUsuario() == usuario.getUsuario())
                        {
                                out.println("<article class = \"botones-footer\">");

                                out.println("   <div class =\"commandbutton\">");
                                out.println("       <a href=\"javascript:void(0);\"");
                                out.println("       id = \"dmhe_transpaso\"");
                                out.println("       class=\"botonEnlace2\">Transpaso</a>");
                                out.println("   </div>");

                                out.println("   <div class =\"commandbutton\">");
                                out.println("       <a href=\"javascript:void(0);\"");
                                out.println("       id = \"dmhe_salida\"");
                                out.println("       class=\"botonEnlace2\">dar Salida</a>");
                                out.println("   </div>");

                                out.println("   <div class =\"commandbutton\">");
                                out.println("       <a href=\"javascript:void(0);\"");
                                out.println("       id = \"dmhe_archivar\"");
                                out.println("       class=\"botonEnlace2\">Archivar</a>");
                                out.println("   </div>");                            

                                out.println("</article>");      
                        }                        
                    
                    }
                }                
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
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
            Logger.getLogger(DocumentoMovimiento_HTML_Estado.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
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
            Logger.getLogger(DocumentoMovimiento_HTML_Estado.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
