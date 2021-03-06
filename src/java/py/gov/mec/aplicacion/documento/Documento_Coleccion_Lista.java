/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


package py.gov.mec.aplicacion.documento;

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

/**
 * @author hugo
 */


@WebServlet(name = "Documento_Coleccion_Lista", 
        urlPatterns = {"/Documento/Coleccion/Lista"})


public class Documento_Coleccion_Lista extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {
                
        response.setContentType("text/html;charset=UTF-8");        



        // pagina        
        Integer page = 1;
        try {            
            if (request.getParameter("page") != null){
                page = Integer.parseInt( request.getParameter("page") );
            }
        } catch (NumberFormatException nfe){
          page =  1;
        }        
        


        
        // busqueda
        String strBuscar = "";
        strBuscar = (String) request.getParameter("buscar");        
               
        if (strBuscar == null){
            strBuscar = "";        
        }
        strBuscar = strBuscar.toString().trim();

        
        /*
        // año        
        Integer aaaa = 0;
        try {            
            if (request.getParameter("aa") != null){
                aaaa = Integer.parseInt( request.getParameter("aa") );
            }
        } catch (NumberFormatException nfe){
          aaaa =  0;
        }        
           */     
        
        
        
        
        
        /*        
        Secuencia<Documento> lista = new Secuencia<Documento>();         
        List<Documento> direcciones = new ArrayList<Documento>();  
        direcciones = lista.buscarTodos(new Documento(), strBuscar);        
        */

        Usuario usuario = new Usuario();
        usuario = usuario.getSession(request);
        
        
        if (usuario != null){
            
            DocumentoDAO documentos = new DocumentoDAO();   
            List<Map<String, Object>> rows = documentos.ListaEstado(strBuscar.toString().trim(),
                    usuario.getUsuario(), page );        
          
            request.setAttribute("lista", rows);            
            request.setAttribute("totalRegistros", documentos.totalRegistros);
            
        }
        
        request.getRequestDispatcher("/Documento/jspf/CollectionLista.jspx").include(request, response);                
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
            Logger.getLogger(Documento_Coleccion_Lista.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(Documento_Coleccion_Lista.class.getName()).log(Level.SEVERE, null, ex);
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
