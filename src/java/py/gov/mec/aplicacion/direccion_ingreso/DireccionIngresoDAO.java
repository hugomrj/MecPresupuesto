/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package py.gov.mec.aplicacion.direccion_ingreso;


import java.io.IOException;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;
import java.util.Map;
import nebuleuse.ORM.Conexion;
import nebuleuse.util.Lista;

/**
 *
 * @author hugom_000
 */

public class DireccionIngresoDAO  {
        
        Conexion conexion = new Conexion();
        Statement  statement ;
        ResultSet resultset;  
        Lista lista ;
        
    
    public DireccionIngresoDAO ( ) throws IOException  {
        conexion.conectar();
        lista = new Lista();
    }

        
        public List<Map<String, Object>>  ListaSimple  ( )                
            throws Exception {
                
                statement = conexion.getConexion().createStatement();         
                
                String sql = 
                        " SELECT direccion, descripcion " +
                        "  FROM public.direcciones_ingresos " +
                        "  order by direccion;" +
                        "   " ;
                
                resultset = statement.executeQuery(sql);     
                
                return lista.resultsetToList(resultset ) ;
             
    }          
        
        
        public List<Map<String, Object>>  RegistroID  ( Integer idregistro)                
            throws Exception {
                
            
                statement = conexion.getConexion().createStatement();         
                
                
                String sql = 
                        " SELECT direccion, descripcion " +
                        "  FROM public.direcciones_ingresos " +
                        "  where direccion = " + idregistro +
                        "   " ;                
                
                resultset = statement.executeQuery(sql);     
                
                return lista.resultsetToList(resultset ) ;
             
    }            
   
    
}
