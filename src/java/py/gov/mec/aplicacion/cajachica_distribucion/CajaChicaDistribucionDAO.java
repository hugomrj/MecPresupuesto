/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package py.gov.mec.aplicacion.cajachica_distribucion;


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
public class CajaChicaDistribucionDAO  {
        
        Conexion conexion = new Conexion();
        Statement  statement ;
        ResultSet resultset;  
        Lista lista ;
        
    
    public CajaChicaDistribucionDAO ( ) throws IOException  {
        conexion.conectar();
        lista = new Lista();
    }

    
    
    public List<Map<String, Object>>  Registro  ( Integer idregistro)                
        throws Exception {

            statement = conexion.getConexion().createStatement();         

            String sql = 
            "                   SELECT id, uoc_id, pf1, pf2, pf3, pf4, pf5, pf6, pf7, pf8, pf9,  \n" +
            "                       pf10, pf11, pf12,  \n" +
            "                      (pf1+pf2+pf3+pf4+pf5+pf6+pf7+pf8+pf9+pf10+pf11+pf12) as suma \n" +
            "                  FROM public.cajachica_distribucion \n" +
            "                  where uoc_id =   " + idregistro +
            " ";
              
            resultset = statement.executeQuery(sql);     

            return lista.resultsetToList(resultset ) ;

    }          
    


    public boolean  isRegistroExiste  ( Integer idregistro)                    
            throws Exception {
                            
                statement = conexion.getConexion().createStatement();         
                
                String sql = 
                    "  SELECT id, uoc_id, pf1, pf2, pf3, pf4, pf5, pf6, pf7, pf8, pf9, \n" +
                    "       pf10, pf11, pf12\n" +
                    "  FROM public.cajachica_distribucion\n" +
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


