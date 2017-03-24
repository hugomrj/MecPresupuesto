/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package py.gov.mec.aplicacion.plan_financiero;



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
public class PlanFinancieroDAO  {
        
        Conexion conexion = new Conexion();
        Statement  statement ;
        ResultSet resultset;  
        Lista lista ;
        
    
    public PlanFinancieroDAO ( ) throws IOException  {
        conexion.conectar();
        lista = new Lista();
    }


    public List<Map<String, Object>>  RegistroID  ( Integer registro)                
        throws Exception {

                statement = conexion.getConexion().createStatement();         

     
                
            String sql = 
                "  SELECT id, presupuesto_id, pf1, pf2, pf3, pf4, pf5, pf6, pf7, pf8, pf9, \n" +
                "       pf10, pf11, pf12, \n" +
                "      (pf1+pf2+pf3+pf4+pf5+pf6+pf7+pf8+pf9+pf10+pf11+pf12) as suma" +
                "  FROM public.plan_financiero\n" +
                "  where id = " + registro +
                " ";                
                
                resultset = statement.executeQuery(sql);     
                
                return lista.resultsetToList(resultset ) ;
             
    }          
                
    
    
    
    
    
    
    public List<Map<String, Object>>  RegistroPresupuesto  ( Integer idregistro)                
        throws Exception {

            statement = conexion.getConexion().createStatement();         

            String sql = 
                "  SELECT id, presupuesto_id, pf1, pf2, pf3, pf4, pf5, pf6, pf7, pf8, pf9, \n" +
                "       pf10, pf11, pf12, \n" +
                "      (pf1+pf2+pf3+pf4+pf5+pf6+pf7+pf8+pf9+pf10+pf11+pf12) as suma" +
                "  FROM public.plan_financiero\n" +
                "  where presupuesto_id = " + idregistro +
                " ";
              
            resultset = statement.executeQuery(sql);     

            return lista.resultsetToList(resultset ) ;

    }          
    


    public boolean  isRegistroExiste  ( Integer idregistro)                    
            throws Exception {
                            
                statement = conexion.getConexion().createStatement();         
                
                String sql = 
                    "  SELECT id, presupuesto_id, pf1, pf2, pf3, pf4, pf5, pf6, pf7, pf8, pf9, \n" +
                    "       pf10, pf11, pf12\n" +
                    "  FROM public.plan_financiero\n" +
                    "  where presupuesto_id = " + idregistro +
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


