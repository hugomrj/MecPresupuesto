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
import py.gov.mec.aplicacion.cajachica_distribucion.CajaChicaDistribucion;
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
   
         
     CajaChicaCertificacionDAO  dao = new CajaChicaCertificacionDAO();
                
     CajaChicaDistribucion instancia = new CajaChicaDistribucion();
     Persistencia persistencia = new Persistencia();     
     instancia = (CajaChicaDistribucion) persistencia.filtrarId(instancia, 3);
     
     
     instancia.setPf4(10L);
     
             
     System.out.println(  dao.actualizarSaldo(instancia ) );
     
     //dao.ReCalcular(20,4, 100000L);
     
     
     
                
     }

}
