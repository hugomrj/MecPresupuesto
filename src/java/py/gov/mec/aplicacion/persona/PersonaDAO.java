/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package py.gov.mec.aplicacion.persona;

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
public class PersonaDAO  {
        
        Conexion conexion = new Conexion();
        Statement  statement ;
        ResultSet resultset;  
        Lista lista ;
        
    
    public PersonaDAO ( ) throws IOException  {
        conexion.conectar();
        lista = new Lista();
    }


    
    public List<Map<String, Object>>  ListaCedula ( Integer cedula )
            throws Exception {
            
                statement = conexion.getConexion().createStatement();         
                
                String sql = " "+                        
                    "  SELECT persona, cedula, nombres\n" +
                    "  FROM public.personas\n" +
                    "  where cedula = " + cedula;                      
                        
                resultset = statement.executeQuery(sql);     
                
                return lista.resultsetToList(resultset ) ;
             
    }          
    
    

    
        
    
}


