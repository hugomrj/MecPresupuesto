/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package py.gov.mec.aplicacion.documento;


import java.io.IOException;
import java.io.PrintWriter;
 import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import nebuleuse.ORM.Persistencia;
import py.gov.mec.aplicacion.documento_movimiento.DocumentoMovimiento;
import py.gov.mec.aplicacion.documento_movimiento_estado.DocumentoMovimientoEstado;
import py.gov.mec.sistema.usuario.Usuario;


@WebServlet(name = "Documento_Controlador_Agregar",
        urlPatterns = {"/Documento/Controlador/Agregar"})


public class Documento_Controlador_Agregar extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
            response.setContentType("text/html;charset=UTF-8");        
            response.setCharacterEncoding("UTF-8");
  
            
            // aca hay que controlar si esta logueado            
//            UsuarioSession us = new UsuarioSession();
//            us.ControlSession(request, response);
            

/*
            if ( request.getSession().getAttribute("SessionUsuario") == null)
            {        
                //response.sendRedirect("../login.jspx");
                response.sendRedirect("/MecPresupuesto");
            }
            else            
            {
   */         
            PrintWriter out = response.getWriter();            
            
                try
                {

                    Documento  instancia = new Documento();
                    Persistencia persistencia = new Persistencia();
                    instancia = (Documento) persistencia.extraerRegistro(request, instancia);            
                    instancia =  (Documento) persistencia.insert(instancia, request);

                    // guarda moviemiento en documentos con estado Entrada
                    Usuario usuario = new Usuario();

                    
                    
                    
                    DocumentoMovimiento doc_movimiento = new DocumentoMovimiento();
                    doc_movimiento.setUsuario(usuario.getSession(request));
                    doc_movimiento.setDocumento(instancia);

                    
                    DocumentoMovimientoEstado estadoDocumento = new DocumentoMovimientoEstado();
                    
                    Integer estado = Integer.parseInt(request.getParameter("estado")) ;                                           
                     
                    estadoDocumento.setId(estado);

                    doc_movimiento.setEstado(estadoDocumento);
                    persistencia.insert(doc_movimiento);            

                    out.println(instancia.getId());      

                }

                catch (Exception ex) {
                    //Logger.getLogger(Persona_Controlador_Agregar.class.getName()).log(Level.SEVERE, null, ex);            
                    System.out.println(ex.getMessage());            
                    out.println(ex.getMessage());                  
                }
    /*
            }
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
