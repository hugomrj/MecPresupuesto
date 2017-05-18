/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package py.gov.mec.aplicacion.estructura;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import py.gov.mec.aplicacion.estructura.EstructuraDAO;

/**
 *
 * @author hugo
 */
@WebServlet(name = "EstructuraCabecera", 
        urlPatterns = {"/Estructura/Cabecera"})




public class EstructuraCabecera extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {
        
        
            response.setContentType("text/html;charset=UTF-8");
        
        
            PrintWriter out = response.getWriter();
            
            EstructuraDAO estructura = new  EstructuraDAO();
            List<Map <String, Object>> rows = new ArrayList<Map <String, Object>>();

            
            
            Integer tp = null;
            Integer pg = null;
            Integer sp = null;
            Integer py = null;            
            Integer pr = null;            
            
            // cargar las variables            
            if (request.getParameter("tp") != null){  
                tp = Integer.parseInt(request.getParameter("tp")) ;     
            }
            if (request.getParameter("pg") != null){  
                pg = Integer.parseInt(request.getParameter("pg")) ;     
            }            
            if (request.getParameter("sp") != null){  
                sp = Integer.parseInt(request.getParameter("sp")) ;     
            }            
            if (request.getParameter("py") != null){  
                py = Integer.parseInt(request.getParameter("py")) ;     
            }            
            if (request.getParameter("pr") != null){  
                pr = Integer.parseInt(request.getParameter("pr")) ;     
            }            
                        
            
                      
            // llamada a funciones 
            if (request.getParameter("tp") != null
                    && request.getParameter("pg") != null 
                    && request.getParameter("sp") != null 
                    && request.getParameter("py") != null 
                    && request.getParameter("pr") != null 
                    )
            {
                rows = estructura.Cabecera(tp, pg, sp, py, pr);                
            }
            else
            {
            
                if (request.getParameter("tp") != null
                        && request.getParameter("pg") != null 
                        && request.getParameter("sp") != null 
                        && request.getParameter("py") != null 
                        )
                {
                    rows = estructura.Cabecera(tp, pg, sp, py);
                }
                else
                {
                    if (request.getParameter("tp") != null
                            && request.getParameter("pg") != null 
                            && request.getParameter("sp") != null 
                            )
                    {
                        rows = estructura.Cabecera(tp, pg, sp);
                    }
                    else
                    {
                        if (request.getParameter("tp") != null
                                && request.getParameter("pg") != null                       
                                )
                        {
                            rows = estructura.Cabecera(tp, pg);
                        }
                        else
                        {
                            if (request.getParameter("tp") != null)
                            {
                                rows = estructura.Cabecera(tp);
                            }
                            else
                            {
                            }
                        }
                    }
                }
            }

            
            String bordercss = "";
            
            out.println("<div class=\"tabla\">");            
                       
            for (Map<String, Object> map : rows) {
                
                // darle borde en producto
               if (Integer.parseInt(map.get("orden").toString().trim()) == 5 ){
                   bordercss = " border-top-style:solid; ";
               }
               else{
                   bordercss = "";
               }
                
                
               out.println("<div class=\"fila\">");   

                out.println("<div class=\"col\" style=\"width:100px;"+bordercss+"\">"
                        +map.get("titulo")+"</div>");
                out.println("<div class=\"col\" style=\"width:50px;"+bordercss+"\">"
                        +map.get("cod")+"</div>");
                out.println("<div class=\"col\" style=\"width:500px;"+bordercss+"\">"
                        +map.get("descripcion")+"</div>");
                    
               out.println("</div>");
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
            Logger.getLogger(EstructuraCabecera.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(EstructuraCabecera.class.getName()).log(Level.SEVERE, null, ex);
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
