/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package py.gov.mec.presupuesto.DistribucionSubcomponente;

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
public class DistribucionSubcomponenteDAO  {
        
        Conexion conexion = new Conexion();
        Statement  statement ;
        ResultSet resultset;  
        Lista lista ;
        
    
    public DistribucionSubcomponenteDAO ( ) throws IOException  {
        conexion.conectar();
        lista = new Lista();
    }

    
    
    public List<Map<String, Object>>  Lista (Integer presupuesto)
            throws Exception {
               
                statement = conexion.getConexion().createStatement();         
                
                String sql =  new DistribucionSubcomponenteSQL().Lista( presupuesto );
                resultset = statement.executeQuery(sql);     
                
                return lista.resultsetToList(resultset ) ;
             
    }              


    public List<Map<String, Object>>  PresupuestoSuma (Integer presupuesto)
            throws Exception {
               
                statement = conexion.getConexion().createStatement();         
                
                String sql =  new DistribucionSubcomponenteSQL().PresupuestoSuma(presupuesto );
                resultset = statement.executeQuery(sql);     
                
                return lista.resultsetToList(resultset ) ;
             
    }              


    public List<Map<String, Object>>  LineaCompleta (Integer presupuesto)
            throws Exception {
               
                statement = conexion.getConexion().createStatement();         
                
                String sql =  new DistribucionSubcomponenteSQL().LineaCompleta(presupuesto );
                resultset = statement.executeQuery(sql);     
                
                return lista.resultsetToList(resultset ) ;
             
    }              

    
        
    
}
















