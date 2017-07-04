/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package py.gov.mec.aplicacion.estructura;


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


@WebServlet(name = "Estructura_Coleccion_Lista", 
        urlPatterns = {"/Estructura/Coleccion/Lista"})


public class Estructura_Coleccion_Lista extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {
        
        response.setContentType("text/html;charset=UTF-8");

        
        Integer tipo1;
        if (request.getParameter("tipo1") != null){
            try {
                tipo1 = Integer.parseInt(request.getParameter("tipo1")) ;     
            } catch (java.lang.NumberFormatException e) {
                tipo1 = 0;
            }            
        }
        else{
            tipo1 = 0;  
        }     
               
        
        Integer pg1;
        if (request.getParameter("pg1") != null){
            try {
                pg1 = Integer.parseInt(request.getParameter("pg1")) ;     
            } catch (java.lang.NumberFormatException e) {
                pg1 = 0;
            }            
        }
        else{ 
            pg1 = 0;  
        }        
      


        Integer sp1;
        if (request.getParameter("sp1") != null){
            try {
                sp1 = Integer.parseInt(request.getParameter("sp1")) ;     
            } catch (java.lang.NumberFormatException e) {
                sp1 = 0;
            }            
        }
        else{ 
            sp1 = 0;  
        }        
    

        // proyecto
        Integer py1;
        if (request.getParameter("py1") != null){
            try {
                py1 = Integer.parseInt(request.getParameter("py1")) ;     
            } catch (java.lang.NumberFormatException e) {
                py1 = 0;
            }            
        }
        else{ 
            py1 = 0;  
        }        



        // objeto
        Integer obj1;
        if (request.getParameter("obj1") != null){
            try {
                obj1 = Integer.parseInt(request.getParameter("obj1")) ;     
            } catch (java.lang.NumberFormatException e) {
                obj1 = 0;
            }            
        }
        else{ 
            obj1 = 0;  
        }        


        
        // fuente
        Integer ff1;
        if (request.getParameter("ff1") != null){
            try {
                ff1 = Integer.parseInt(request.getParameter("ff1")) ;     
            } catch (java.lang.NumberFormatException e) {
                ff1 = 0;
            }            
        }
        else{ 
            ff1 = 0;  
        }        


        
        // organismo financiador
        Integer of1;
        if (request.getParameter("of1") != null){
            try {
                of1 = Integer.parseInt(request.getParameter("of1")) ;     
            } catch (java.lang.NumberFormatException e) {
                of1 = 0;
            }            
        }
        else{ 
            of1 = 0;  
        }        

        
        
        // departamento
        Integer dpt1;
        if (request.getParameter("dpt1") != null){
            try {
                dpt1 = Integer.parseInt(request.getParameter("dpt1")) ;     
            } catch (java.lang.NumberFormatException e) {
                dpt1 = 0;
            }            
        }
        else{ 
            dpt1 = 0;  
        }        


        
        // producto
        Integer prd1;
        if (request.getParameter("prd1") != null){
            try {
                prd1 = Integer.parseInt(request.getParameter("prd1")) ;     
            } catch (java.lang.NumberFormatException e) {
                prd1 = 0;
            }            
        }
        else{ 
            prd1 = 0;  
        }        
    


        
            EstructuraDAO dao = new EstructuraDAO();
         
            List<Map<String, Object>> rows = dao.Lista(tipo1, 
                    pg1, 
                    sp1, 
                    py1, 
                    obj1,
                    ff1, 
                    of1,
                    dpt1, 
                    prd1
            );
        
                                    
            request.setAttribute("lista", rows);
                       
            request.getRequestDispatcher("/Estructura/jspf/CollectionLista.jspx").include(request, response);        


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
            Logger.getLogger(Estructura_Coleccion_Lista.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(Estructura_Coleccion_Lista.class.getName()).log(Level.SEVERE, null, ex);
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








