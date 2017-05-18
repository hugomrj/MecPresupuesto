/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.itx.execute;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import nebuleuse.ORM.Persistencia;
import nebuleuse.ORM.Secuencia;
import nebuleuse.util.Cadena;
import nebuleuse.util.Datetime;
import py.gov.mec.aplicacion.cajachica_certificacion.CajaChicaCertificacionDAO;
import py.gov.mec.aplicacion.cajachica_distribucion.CajaChicaDistribucion;
import py.gov.mec.aplicacion.cajachica_distribucion.CajaChicaDistribucionDAO;
import py.gov.mec.aplicacion.cajachica_ejecucion.CajaChicaEjecucionDAO;
import py.gov.mec.aplicacion.documento.Documento;
import py.gov.mec.aplicacion.estructura.EstructuraDAO;
import py.gov.mec.estructura.programa.Programa;
import py.gov.mec.estructura.programa.ProgramaDAO;
import py.gov.mec.presupuesto.anterproyecto.Anteproyecto;

/**
 *
 * @author hugo
 */
public class NewMain {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws Exception {
        // TODO code application logic here
        
    
            
        
            Anteproyecto ante = new Anteproyecto();
            Persistencia p = new Persistencia();
            
            ante = (Anteproyecto) p.filtrarId(ante, 621);
            p.delete(ante);
            
            //ante.setIdeal(108L);            
            //p.insert(ante);
   
    }
    
}
