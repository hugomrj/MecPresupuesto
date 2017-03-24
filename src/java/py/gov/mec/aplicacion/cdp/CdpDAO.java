/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package py.gov.mec.aplicacion.cdp;



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
public class CdpDAO  {
        
        Conexion conexion = new Conexion();
        Statement  statement ;
        ResultSet resultset;  
        Lista lista ;
        
    
    public CdpDAO ( ) throws IOException  {
        conexion.conectar();
        lista = new Lista();
    }
                

    public List<Map<String, Object>>  Lista  ( Integer estructura )
            throws Exception {
            
                statement = conexion.getConexion().createStatement();         
                
                String sql = " " +
                " SELECT id, estructura_id, unr, pac_numero, cc, descripcion, certificacion_actual, \n" +
                "       fecha, cdp_numero\n" +
                "  FROM public.cdp\n" +
                "  where estructura_id =  " + estructura ;
                
                resultset = statement.executeQuery(sql);     
                
                return lista.resultsetToList(resultset ) ;
             
    }          
           

        
    
}
