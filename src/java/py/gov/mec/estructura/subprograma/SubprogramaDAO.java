/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package py.gov.mec.estructura.subprograma;



import java.io.IOException;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import nebuleuse.ORM.Conexion;
import nebuleuse.ORM.Secuencia;
import nebuleuse.util.Lista;


/**
 *
 * @author hugo
 */
public class SubprogramaDAO {
    
        Conexion conexion = new Conexion();
        Statement  statement ;
        ResultSet resultset;  
        Lista lista ;


    
    public SubprogramaDAO ( ) throws IOException  {
        conexion.conectar();
        lista = new Lista();
    }
        

    public List<Subprograma>  Lista (Integer programa)
            throws Exception {
        
        Secuencia<Subprograma> lista = new Secuencia<Subprograma>();         
        
        
        String sql = " "+                        
                " SELECT id, tp, pg, sp, programa, descripcion\n" +
                "  FROM estructura.subprogramas\n" +
                "  where programa = \n" + programa +
                "  order by tp, pg, sp   " ;        
        
        return lista.listaSimpleSQL(new Subprograma(), sql );        

    }             



    public List<Map<String, Object>>  ListaSuma (Integer programa)
            throws Exception {
               
                statement = conexion.getConexion().createStatement();         
                
                String sql =  new SubprogramaSQL().ListaSuma(programa);
                resultset = statement.executeQuery(sql);     
                
                return lista.resultsetToList(resultset ) ;
             
    }         
        
        
    
    
        
    
}
