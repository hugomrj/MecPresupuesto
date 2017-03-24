/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package py.gov.mec.aplicacion.pais_ciudad;

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
public class PaisCiudadDAO {
    
        Conexion conexion = new Conexion();
        Statement  statement ;
        ResultSet resultset;  
        Lista lista ;

        
    
    public PaisCiudadDAO ( ) throws IOException  {
        conexion.conectar();
        lista = new Lista();
    }
        
    
    public List<Map<String, Object>>  RegistroID  ( Integer idregistro)                
            throws Exception {
                            
                statement = conexion.getConexion().createStatement();         
                                
                String sql = 
                    " SELECT id, pais, ciudad, c1, c2, c3, c4, c5\n" +
                    "  FROM public.pais_ciudad\n" +
                    "  where id =  "  + idregistro  ;                
                
                resultset = statement.executeQuery(sql);     
                
                return lista.resultsetToList(resultset ) ;
             
    }           

    
    public List<Map<String, Object>>  CostoDiario  ( Integer destino, Integer categoria_id  )                
            throws Exception {
                            
                statement = conexion.getConexion().createStatement();         
                                
                String sql = 
                    "  SELECT funcionario_categoria.id, destino.categoria, \n" +
                    " descripcion, destino.costo, pais, ciudad\n" +
                    "  FROM funcionario_categoria,\n" +
                    "  (\n" +
                    " SELECT id, pais, ciudad, c1 as costo, 1 as categoria\n" +
                    "  FROM pais_ciudad\n" +
                    "  where id = " + destino +
                    "  union\n" +
                    " SELECT id, pais, ciudad, c2 as costo, 2 as categoria\n" +
                    "  FROM pais_ciudad\n" +
                    "  where id = " + destino +
                    "  union\n" +
                    " SELECT id, pais, ciudad, c3 as costo, 3 as categoria\n" +
                    "  FROM pais_ciudad\n" +
                    "  where id = " + destino +
                    "  union\n" +
                    " SELECT id, pais, ciudad, c4 as costo, 4 as categoria\n" +
                    "  FROM pais_ciudad\n" +
                    "  where id =  " + destino +
                    "  union\n" +
                    " SELECT id, pais, ciudad, c5 as costo, 5 as categoria\n" +
                    "  FROM pais_ciudad\n" +
                    "  where id =  " + destino +
                    "  ) destino\n" +
                    "  where destino.categoria = funcionario_categoria.categoria\n" +
                    "  and funcionario_categoria.id = " + categoria_id ;                
                
                resultset = statement.executeQuery(sql);     
                
                return lista.resultsetToList(resultset ) ;
             
    }           
    
    
    

}
