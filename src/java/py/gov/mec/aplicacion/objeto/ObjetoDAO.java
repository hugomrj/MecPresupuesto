/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package py.gov.mec.aplicacion.objeto;



import java.io.IOException;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;
import java.util.Map;
import nebuleuse.ORM.Conexion;
import nebuleuse.util.Lista;


/**
 *
 * @author hugo
 */
public class ObjetoDAO {
    
        Conexion conexion = new Conexion();
        Statement  statement ;
        ResultSet resultset;  
        Lista lista ;


    
    public ObjetoDAO ( ) throws IOException  {
        conexion.conectar();
        lista = new Lista();
    }
        



    public List<Map<String, Object>>  RegistroId (Integer id)
            throws Exception {
               
                statement = conexion.getConexion().createStatement();         
                
                String sql =  new ObjetoSQL().RegistroId(id);
                resultset = statement.executeQuery(sql);     
                
                return lista.resultsetToList(resultset ) ;
                    

    }             
    
        
        
    
}
