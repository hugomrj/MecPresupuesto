/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package py.gov.mec.aplicacion.cajachica_ejecucion;

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
public class CajaChicaEjecucionDAO  {
        
        Conexion conexion = new Conexion();
        Statement  statement ;
        ResultSet resultset;  
        Lista lista ;
        
    
    public CajaChicaEjecucionDAO ( ) throws IOException  {
        conexion.conectar();
        lista = new Lista();
    }




    
    
    public List<Map<String, Object>>  Registro  ( Integer idregistro)                
        throws Exception {

            statement = conexion.getConexion().createStatement();    
            String sql = 
            "                   SELECT id, uoc_id, ej1, ej2, ej3, ej4, ej5, ej6, ej7, ej8, ej9,  \n" +
            "                       ej10, ej11, ej12,  \n" +
            "                      (ej1+ej2+ej3+ej4+ej5+ej6+ej7+ej8+ej9+ej10+ej11+ej12) as suma \n" +
            "                  FROM public.cajachica_ejecucion \n" +
            "                  where uoc_id =   " + idregistro +
            " ";
              
            resultset = statement.executeQuery(sql);     

            return lista.resultsetToList(resultset ) ;

    }             



    public boolean  isRegistroExiste  ( Integer idregistro)                    
            throws Exception {
                            
                statement = conexion.getConexion().createStatement();         
                String sql = 
                    "  SELECT id, uoc_id, ej1, ej2, ej3, ej4, ej5, ej6, ej7, ej8, ej9, \n" +
                    "       ej10, ej11, ej12\n" +
                    "  FROM public.cajachica_ejecucion\n" +
                    "  where uoc_id = " + idregistro +
                    " ";
                
                resultset = statement.executeQuery(sql);     

                if(resultset.next()) 
                {    
                    return true;          
                }
                else{
                    return false;
                }                
             
    }           
    
    
}


