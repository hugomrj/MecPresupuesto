/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package py.gov.mec.sistema.usuario;




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

public class UsuarioDAO  {
        
        Conexion conexion = new Conexion();
        Statement  statement ;
        ResultSet resultset;  
        Lista lista ;
        
    
    public UsuarioDAO ( ) throws IOException  {
        conexion.conectar();
        lista = new Lista();
    }

        
        public List<Map<String, Object>>  ListaSimple  ( )                
            throws Exception {
                
                statement = conexion.getConexion().createStatement();         
         
                
                String sql = 
                        " SELECT usuario, cuenta " +
                        "  FROM sistema.usuarios " +
                        "  order by usuario;" +
                        "   " ;
                
                resultset = statement.executeQuery(sql);     
                
                return lista.resultsetToList(resultset ) ;
             
    }          
        

        public List<Map<String, Object>>  RegistroID  ( Integer idregistro)                
            throws Exception {
                
            
                statement = conexion.getConexion().createStatement();         
                
                
                String sql = 
                        " SELECT usuario, cuenta " +
                        "  FROM sistema.usuarios " +
                        "  where usuario = " + idregistro +
                        "   " ;                
                
                resultset = statement.executeQuery(sql);     
                
                return lista.resultsetToList(resultset ) ;
             
    }            

    
}
