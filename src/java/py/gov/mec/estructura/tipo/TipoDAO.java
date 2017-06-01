/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package py.gov.mec.estructura.tipo;


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
public class TipoDAO  {
        
        Conexion conexion = new Conexion();
        Statement  statement ;
        ResultSet resultset;  
        Lista lista ;
        
    
    public TipoDAO ( ) throws IOException  {
        conexion.conectar();
        lista = new Lista();
    }

    
    public List<Map<String, Object>>  Lista ()
            throws Exception {
               
                statement = conexion.getConexion().createStatement();         
                
                String sql = " "+                        
                "   SELECT tipo, descripcion\n" +
                "  FROM estructura.tipos\n" +
                "  order by tipo   " ;
                        
                resultset = statement.executeQuery(sql);     
                
                return lista.resultsetToList(resultset ) ;
             
    }              

    
    

    public List<Map<String, Object>>  ListaSuma ()
            throws Exception {
               
                statement = conexion.getConexion().createStatement();         
                
                String sql =  new TipoSQL().ListaSuma();
                resultset = statement.executeQuery(sql);     
                
                return lista.resultsetToList(resultset ) ;
             
    }         
    
            
    
        
    
}
















