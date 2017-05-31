/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package py.gov.mec.estructura.eje;



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
public class EjeDAO  {
        
        Conexion conexion = new Conexion();
        Statement  statement ;
        ResultSet resultset;  
        Lista lista ;
        
    
    public EjeDAO ( ) throws IOException  {
        conexion.conectar();
        lista = new Lista();
    }

    
    public List<Map<String, Object>>  Lista ()
            throws Exception {
               
                statement = conexion.getConexion().createStatement();         
                
                String sql =  new EjeSQL().Lista();
                resultset = statement.executeQuery(sql);     
                
                return lista.resultsetToList(resultset ) ;
             
    }              


    public List<Map<String, Object>>  PresupuestoLista ()
            throws Exception {
               
                statement = conexion.getConexion().createStatement();         
                
                String sql =  new EjeSQL().PresupuestoLista();
                resultset = statement.executeQuery(sql);     
                
                return lista.resultsetToList(resultset ) ;
             
    }         
    
        
    
}
















