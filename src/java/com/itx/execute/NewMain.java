/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.itx.execute;

import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;
import nebuleuse.ORM.Persistencia;
import nebuleuse.util.Cadena;
import nebuleuse.util.Datetime;
import py.gov.mec.aplicacion.cajachica_certificacion.CajaChicaCertificacionDAO;
import py.gov.mec.aplicacion.cajachica_distribucion.CajaChicaDistribucion;
import py.gov.mec.aplicacion.cajachica_distribucion.CajaChicaDistribucionDAO;
import py.gov.mec.aplicacion.cajachica_ejecucion.CajaChicaEjecucionDAO;
import py.gov.mec.aplicacion.documento.Documento;

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
        
    /*  
        CajaChicaEjecucionDAO dao = new CajaChicaEjecucionDAO();
        
        
        List<Map<String, Object>> list =  dao.SaldoMesAnterior(20,4);
        //dao.SaldoMesAnterior(20,13);
        

        
        for (Map<String, Object> map : list) {
            for (Map.Entry<String, Object> entry : map.entrySet()) 
            {
                if (entry.getKey().trim().equals("saldo_anterior") )
                {
                    System.out.println(entry.getValue());
                }
            }
        }
        */
        
        
            CajaChicaDistribucion instancia = new CajaChicaDistribucion();
            Persistencia persistencia = new Persistencia();
                    
            CajaChicaCertificacionDAO  certificacionDAO = new CajaChicaCertificacionDAO();  
            

            
                // se extrae el registro del plan financiero con sus valores pasados por formulario
                
                instancia = (CajaChicaDistribucion) persistencia.filtrarId(instancia, 3);
                instancia.setPf4(15000666L);
                
      
                
                
                boolean control;
                control = certificacionDAO.actualizarSaldo(instancia );
         
                
                
                if (control == true){
                    persistencia.update(instancia);
                }
                else
                {
                    throw new Exception("No se puede actualizar");
                }

                

        
        
        
    }
    
}
