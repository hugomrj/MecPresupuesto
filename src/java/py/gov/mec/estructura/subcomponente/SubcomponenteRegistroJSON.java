/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package py.gov.mec.estructura.subcomponente;


import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 *
 * @author hugo
 */
@WebServlet(name = "SubcomponenteRegistroJSON", 
        urlPatterns = {"/Subcomponente/Registro.json"})



public class SubcomponenteRegistroJSON extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {
        
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        
                
        PrintWriter out = response.getWriter();
        try 
        {


            Integer subcom = 0;
            if (request.getParameter("subcom") != null){
                try {
                    subcom = Integer.parseInt(request.getParameter("subcom")) ;     
                } catch (java.lang.NumberFormatException e) {
                    subcom = 0;
                }            
            }

            SubcomponenteDAO dao = new SubcomponenteDAO();

            
            Gson gson = new Gson ();
            String formatoJSON = gson.toJson( dao.RegistroId(subcom) );
            
            out.println(formatoJSON);            

       
        } 
        finally 
        {
            out.close();
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
            Logger.getLogger(SubcomponenteRegistroJSON.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(SubcomponenteRegistroJSON.class.getName()).log(Level.SEVERE, null, ex);
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
