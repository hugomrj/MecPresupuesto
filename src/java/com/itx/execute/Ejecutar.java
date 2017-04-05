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
import py.gov.mec.aplicacion.cajachica_certificacion.CajaChicaCertificacionDAO;
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
   
         
     //CajaChicaCertificacionDAO  dao = new CajaChicaCertificacionDAO();
     
     
     //dao.actualizarSaldo(20, 3);
     
     
                ViaticoCertificacionDAO dao = new ViaticoCertificacionDAO();                
                List<Map<String, Object>> rows = dao.ExteriorMemo(29, 4, 40);
     
    

                
                
                
     }

}
