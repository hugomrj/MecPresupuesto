/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package py.gov.mec.presupuesto.distribucion_componente;

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
public class DistribucionComponenteDAO  {
        
        Conexion conexion = new Conexion();
        Statement  statement ;
        ResultSet resultset;  
        Lista lista ;
        
    
    public DistribucionComponenteDAO ( ) throws IOException  {
        conexion.conectar();
        lista = new Lista();
    }

    
    
    public List<Map<String, Object>>  Lista (Integer presupuesto)
            throws Exception {
               
                statement = conexion.getConexion().createStatement();         
                
                String sql =  new DistribucionComponenteSQL().Lista( presupuesto );
                resultset = statement.executeQuery(sql);     
                
                return lista.resultsetToList(resultset ) ;
             
    }              


    public List<Map<String, Object>>  PresupuestoSuma (Integer presupuesto)
            throws Exception {
               
                statement = conexion.getConexion().createStatement();         
                
                String sql =  new DistribucionComponenteSQL().PresupuestoSuma(presupuesto );
                resultset = statement.executeQuery(sql);     
                
                return lista.resultsetToList(resultset ) ;
             
    }              


    public List<Map<String, Object>>  LineaCompleta (Integer presupuesto)
            throws Exception {
               
                statement = conexion.getConexion().createStatement();         
                
                String sql =  new DistribucionComponenteSQL().LineaCompleta(presupuesto );
                resultset = statement.executeQuery(sql);     
                
                return lista.resultsetToList(resultset ) ;
             
    }              

    
        
    
}
















