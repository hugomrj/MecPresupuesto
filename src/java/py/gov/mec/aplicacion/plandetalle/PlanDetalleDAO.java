/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package py.gov.mec.aplicacion.plandetalle;


import py.gov.mec.aplicacion.plan.*;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import nebuleuse.ORM.Conexion;
import nebuleuse.ORM.RegistroMap;
import nebuleuse.util.Lista;

/**
 *
 * @author hugom_000
 */
public class PlanDetalleDAO  {
        
        Conexion conexion = new Conexion();
        Statement  statement ;
        ResultSet resultset;  
        Lista lista ;
        
    
    public PlanDetalleDAO ( ) throws IOException  {
        conexion.conectar();
        lista = new Lista();
    }

        
        
        public List<Map<String, Object>>  ListaFiltrada  ( Integer idreg)                
            throws Exception {
                
            
                statement = conexion.getConexion().createStatement();         
                
                
                String sql = " "
                        + "  SELECT id, plan_id, cc, llamado, proveedor, pac, monto, certificado, detalle_tipo\n" 
                        + "  FROM public.plan_detalle\n" 
                        + "  WHERE plan_id = " + idreg
                        + "  ";
                
                resultset = statement.executeQuery(sql);     
                
                return lista.resultsetToList(resultset ) ;
             
    }          
        
   
    
}
