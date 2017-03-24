/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.itx.execute;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import nebuleuse.ORM.Persistencia;
import nebuleuse.ORM.Secuencia;
import py.gov.mec.aplicacion.cajachica_certificacion.CajaChicaCertificacion;
import py.gov.mec.aplicacion.cdp.Cdp;

import py.gov.mec.aplicacion.distribucion_ingreso.DistribucionIngresoDAO;
import py.gov.mec.aplicacion.ingreso_certificacion.IngresoCertificacionDAO;
import py.gov.mec.aplicacion.ingreso_ejecucion.IngresoEjecucionDAO;
import py.gov.mec.aplicacion.persona.Persona;
import py.gov.mec.aplicacion.pais_ciudad.PaisCiudad;
import py.gov.mec.aplicacion.plan_financiero.PlanFinanciero;
import py.gov.mec.aplicacion.uoc_certificacion.UocCertificacion;
import py.gov.mec.aplicacion.viatico_certificacion.ViaticoCertificacion;
import py.gov.mec.aplicacion.viatico_certificacion.ViaticoCertificacionDAO;



/**
 * @author hugo
 */

public class Ejecutar {

     public static  void main(String[] args) throws Exception   {
   
         
         
    /*                 
        PlanDAO p = new PlanDAO();
        Gson gson = new Gson ();
        String formatoJSON = gson.toJson(p.RegistroId(1));
        System.out.println(formatoJSON);  
         

        IngresoEjecucionDAO dao = new  IngresoEjecucionDAO();
        System.out.println( dao.SaldoMes(2, 67,  1)  );  
         
         
         


        Secuencia<PaisCiudad> lista = new Secuencia<PaisCiudad>();         
        List<PaisCiudad> SessionLista = new ArrayList<PaisCiudad>();
               
        
        lista.subLineas = 10;
        SessionLista = lista.listaColeccion( new PaisCiudad(), null, "", 1 );   

       */
    
    
        Cdp cdp = new Cdp();
        Persistencia persistencia = new Persistencia();
        
        
        cdp.setCc("cccc");
        
        persistencia.insert(cdp);
        
    
    
    
        
    
     }

}
