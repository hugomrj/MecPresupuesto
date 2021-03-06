/*
* To change this license header, choose License Headers in Project Properties.
* To change this template file, choose Tools | Templates
* and open the template in the editor.
*/

package py.gov.mec.estructura.item;

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
import nebuleuse.GUI.web.HttpRequest;
import nebuleuse.ORM.Secuencia;


/**
 * @author hugom_000
 */

@WebServlet(name = "ItemActionSubConsulta",
        urlPatterns = {"/Item/SubConsulta.do"})


public class ItemActionSubConsulta extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {
        
        
        response.setContentType("text/html;charset=UTF-8");        
        response.setCharacterEncoding("UTF-8");
        
        
        HttpRequest httpRequest = new HttpRequest();
        Integer pagina = httpRequest.getPage(request);
        String strBuscar = httpRequest.getBuscar(request);

        
        
        Secuencia<Item> lista = new Secuencia<Item>();         
        List<Item> SessionLista = new ArrayList<Item>();
                
        
        lista.subLineas = 12;
        SessionLista = lista.listaColeccion( new Item(), null, strBuscar, pagina );   

        
        
        request.getSession().setAttribute("session_consulta", SessionLista );            
       // request.setAttribute("session_consulta", SessionLista );            
        
        request.setAttribute("Pagina", pagina);      
        request.setAttribute("Lineas", lista.subLineas);
        request.setAttribute("TotalRegistros", lista.TotalRegistros(new Item(), strBuscar) );         
        
        request.setAttribute("Buscar", (strBuscar == null) ? "" : strBuscar );
        
        if  ( httpRequest.getJSPorigen(request) == null ) 
        { System.out.println("no existe jsp origen para consulta"); }   
        else  { request.setAttribute("jsp", httpRequest.getJSPorigen(request));  }        
        
        
        request.getRequestDispatcher("/Item/Sub/Consulta.jspx").include(request, response);

        
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
            Logger.getLogger(ItemActionSubConsulta.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(ItemActionSubConsulta.class.getName()).log(Level.SEVERE, null, ex);
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
