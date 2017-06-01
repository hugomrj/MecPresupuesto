/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package py.gov.mec.estructura.proyecto;


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
public class ProyectoDAO {
    
        Conexion conexion = new Conexion();
        Statement  statement ;
        ResultSet resultset;  
        Lista lista ;


    
    public ProyectoDAO ( ) throws IOException  {
        conexion.conectar();
        lista = new Lista();
    }
        

    public List<Proyecto>  Lista (Integer subprograma)
            throws Exception {
        
        Secuencia<Proyecto> lista = new Secuencia<Proyecto>();         
        
        
        String sql = " "+                        
                " SELECT id, subprograma, tp, pg, sp, py, descripcion\n" +
                "  FROM estructura.proyectos\n" +
                "  where subprograma = \n" + subprograma +
                "  order by tp, pg, sp, py   " ;        
        
        return lista.listaSimpleSQL(new Proyecto(), sql );        

    }             


    

    public List<Map<String, Object>>  ListaSuma (Integer subprograma)
            throws Exception {
               
                statement = conexion.getConexion().createStatement();         
                
                String sql =  new ProyectoSQL().ListaSuma(subprograma);
                resultset = statement.executeQuery(sql);     
                
                return lista.resultsetToList(resultset ) ;
             
    }         
            
    
    
        
    
}
