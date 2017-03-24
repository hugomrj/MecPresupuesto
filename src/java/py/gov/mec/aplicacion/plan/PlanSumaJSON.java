/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package py.gov.mec.aplicacion.plan;

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
import nebuleuse.ORM.Persistencia;

/**
 *
 * @author hugo
 */
@WebServlet(name = "PlanSumaJSON", 
        urlPatterns = {"/Plan/Suma.json"})



public class PlanSumaJSON extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {
        
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        
                
        PrintWriter out = response.getWriter();
        try 
        {


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
            Integer tipo2;
            if (request.getParameter("tipo2") != null){
                try {
                    tipo2 = Integer.parseInt(request.getParameter("tipo2")) ;     
                } catch (java.lang.NumberFormatException e) {
                    tipo2 = 0;
                }            
            }
            else{
                tipo2 = 0;  
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
            Integer pg2;
            if (request.getParameter("pg2") != null){
                try {
                    pg2 = Integer.parseInt(request.getParameter("pg2")) ;     
                } catch (java.lang.NumberFormatException e) {
                    pg2 = 0;
                }            
            }
            else{
                pg2 = 0;  
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
            Integer sp2;
            if (request.getParameter("sp2") != null){
                try {
                    sp2 = Integer.parseInt(request.getParameter("sp2")) ;     
                } catch (java.lang.NumberFormatException e) {
                    sp2 = 0;
                }            
            }
            else{
                sp2 = 0;  
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
            Integer py2;
            if (request.getParameter("py2") != null){
                try {
                    py2 = Integer.parseInt(request.getParameter("py2")) ;     
                } catch (java.lang.NumberFormatException e) {
                    py2 = 0;
                }            
            }
            else{
                py2 = 0;  
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
            Integer obj2;
            if (request.getParameter("obj2") != null){
                try {
                    obj2 = Integer.parseInt(request.getParameter("obj2")) ;     
                } catch (java.lang.NumberFormatException e) {
                    obj2 = 0;
                }            
            }
            else{
                obj2 = 0;  
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
            Integer ff2;
            if (request.getParameter("ff2") != null){
                try {
                    ff2 = Integer.parseInt(request.getParameter("ff2")) ;     
                } catch (java.lang.NumberFormatException e) {
                    ff2 = 0;
                }            
            }
            else{
                ff2 = 0;  
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
            Integer of2;
            if (request.getParameter("ff2") != null){
                try {
                    of2 = Integer.parseInt(request.getParameter("of2")) ;     
                } catch (java.lang.NumberFormatException e) {
                    of2 = 0;
                }            
            }
            else{
                of2 = 0;  
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
            Integer dpt2;
            if (request.getParameter("dpt2") != null){
                try {
                    dpt2 = Integer.parseInt(request.getParameter("dpt2")) ;     
                } catch (java.lang.NumberFormatException e) {
                    dpt2 = 0;
                }            
            }
            else{
                dpt2 = 0;  
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
            Integer prd2;
            if (request.getParameter("prd2") != null){
                try {
                    prd2 = Integer.parseInt(request.getParameter("prd2")) ;     
                } catch (java.lang.NumberFormatException e) {
                    prd2 = 0;
                }            
            }
            else{
                prd2 = 0;  
            }           
            

            PlanDAO dao = new PlanDAO();

            Gson gson = new Gson ();
            String formatoJSON = gson.toJson(
                                    dao.SumaPlan(tipo1, tipo2, pg1, pg2, sp1, sp2, 
                                            py1, py2, obj1, obj2, ff1, ff2, of1, of2, 
                                            dpt1, dpt2, prd1, prd2));
            
            
            
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
            Logger.getLogger(PlanSumaJSON.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(PlanSumaJSON.class.getName()).log(Level.SEVERE, null, ex);
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
