/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package py.gov.mec.estructura.programa;

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
public class ProgramaDAO {
    
        Conexion conexion = new Conexion();
        Statement  statement ;
        ResultSet resultset;  
        Lista lista ;


    
    public ProgramaDAO ( ) throws IOException  {
        conexion.conectar();
        lista = new Lista();
    }
        

    public List<Programa>  Lista (Integer tp)
            throws Exception {
        
        Secuencia<Programa> lista = new Secuencia<Programa>();         
        /*List<Programa> rows = new ArrayList<Programa>();  */
        
        String sql = " "+                        
                "  SELECT id, tp, pg, descripcion \n" +
                "  FROM estructura.programas\n" +
                "  WHERE tp = \n" + tp +                                        
                "  order by tp, pg   " ;        
        
        return lista.listaSimpleSQL(new Programa(), sql );        

    }             


    public List<Map<String, Object>>  ListaSuma (Integer tp)
            throws Exception {
               
                statement = conexion.getConexion().createStatement();         
                
                String sql =  new ProgramaSQL().ListaSuma(tp);
                resultset = statement.executeQuery(sql);     
                
                return lista.resultsetToList(resultset ) ;
             
    }         
        
    
    
        
    
}
