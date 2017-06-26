/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package py.gov.mec.aplicacion.viatico_distribucion_mensual;


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
public class ViaticoDistribucionMensualDAO {
    
        Conexion conexion = new Conexion();
        Statement  statement ;
        ResultSet resultset;  
        Lista lista ;


    
    public ViaticoDistribucionMensualDAO ( ) throws IOException  {
        conexion.conectar();
        lista = new Lista();
    }
        

    

    public List<Map<String, Object>>  ListaMes (Integer mes)
            throws Exception {
               
                statement = conexion.getConexion().createStatement();         
                
                String sql =  new ViaticoDistribucionMensualSQL().ListaMes(mes);
                resultset = statement.executeQuery(sql);     
                
                return lista.resultsetToList(resultset ) ;
             
    }         
            
    
    
        
    
}
