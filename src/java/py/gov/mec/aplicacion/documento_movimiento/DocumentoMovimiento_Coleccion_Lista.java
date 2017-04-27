/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package py.gov.mec.aplicacion.documento_movimiento;

import py.gov.mec.aplicacion.direccion.*;
import java.io.IOException;

import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import nebuleuse.ORM.Persistencia;
import nebuleuse.ORM.Secuencia;
import py.gov.mec.aplicacion.documento.Documento;

/**
 * @author hugo
 */


@WebServlet(name = "DocumentoMovimiento_Coleccion_Lista", 
        urlPatterns = {"/DocumentoMovimiento/Coleccion/Lista"})


public class DocumentoMovimiento_Coleccion_Lista extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {
        
        
        response.setContentType("text/html;charset=UTF-8");        
        
        /*
        // busqueda
        Integer strDoc = 0;
        strDoc = (Integer) request.getParameter("doc");        
               
        if (strBuscar == null)
        {
            strBuscar = "";        
        }
        */
        
        
        if ( request.getParameter("doc") != null)
        {
            
            String doc = request.getParameter("doc");
        
            Persistencia persistencia = new Persistencia();        
            Documento documento = new Documento();
            documento = (Documento) persistencia.filtrarId(documento, Integer.parseInt(doc));        


            Secuencia<DocumentoMovimiento> lista = new Secuencia<DocumentoMovimiento>();         
            List<DocumentoMovimiento> movimientos = new ArrayList<DocumentoMovimiento>();      

            movimientos = lista.listaSimpleSQL(new DocumentoMovimiento() , 
                     persistencia.selectSQL(new DocumentoMovimiento(), documento ));   

            request.setAttribute("lista", movimientos);
            //request.getRequestDispatcher("/DocumentoMovimiento/jspf/CollectionLista.jspx").include(request, response);                        
        
        
        }
        
        request.getRequestDispatcher("/DocumentoMovimiento/jspf/CollectionLista.jspx").include(request, response);                        

        
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
            Logger.getLogger(DocumentoMovimiento_Coleccion_Lista.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(DocumentoMovimiento_Coleccion_Lista.class.getName()).log(Level.SEVERE, null, ex);
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
