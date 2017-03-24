/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package py.gov.mec.aplicacion.distribucion_ingreso;


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
public class DistribucionIngresoDAO  {
        
        Conexion conexion = new Conexion();
        Statement  statement ;
        ResultSet resultset;  
        Lista lista ;
        
    
    public DistribucionIngresoDAO ( ) throws IOException  {
        conexion.conectar();
        lista = new Lista();
    }

        
        
        public List<Map<String, Object>>  ListaPlan  ( Integer idreg)                
            throws Exception {
                
            
                statement = conexion.getConexion().createStatement();         
                
                String sql = 
                        "SELECT \n" +
                        "  direcciones_ingresos.descripcion as direccion_descripcion, \n" +
                        "  distribucion_ingresos.id, \n" +
                        "  distribucion_ingresos.plan_id, \n" +
                        "  distribucion_ingresos.direccion, \n" +
                        "  distribucion_ingresos.pf1, \n" +
                        "  distribucion_ingresos.pf2, \n" +
                        "  distribucion_ingresos.pf3, \n" +
                        "  distribucion_ingresos.pf4, \n" +
                        "  distribucion_ingresos.pf5, \n" +
                        "  distribucion_ingresos.pf6, \n" +
                        "  distribucion_ingresos.pf7, \n" +
                        "  distribucion_ingresos.pf8, \n" +
                        "  distribucion_ingresos.pf9, \n" +
                        "  distribucion_ingresos.pf10, \n" +
                        "  distribucion_ingresos.pf11, \n" +
                        "  distribucion_ingresos.pf12\n" +
                        "FROM \n" +
                        "  public.direcciones_ingresos, \n" +
                        "  public.distribucion_ingresos\n" +
                        "WHERE \n" +
                        "  direcciones_ingresos.direccion = distribucion_ingresos.direccion\n" +
                        "  and plan_id = " +   idreg  +
                        "Order by direccion; " ;
                                                
                
                resultset = statement.executeQuery(sql);     
                
                return lista.resultsetToList(resultset ) ;
             
    }          
        
   
        public List<Map<String, Object>>  RegistroID  ( Integer idregistro)                
            throws Exception {
            
                statement = conexion.getConexion().createStatement();         

                String sql = 
                    "  SELECT \n" +
                    "  distribucion_ingresos.id, \n" +
                    "  distribucion_ingresos.plan_id, \n" +
                    "  distribucion_ingresos.direccion, \n" +
                    "  direcciones_ingresos.descripcion direccion_descripcion, \n" +
                    "  distribucion_ingresos.pf1, \n" +
                    "  distribucion_ingresos.pf2, \n" +
                    "  distribucion_ingresos.pf3, \n" +
                    "  distribucion_ingresos.pf4, \n" +
                    "  distribucion_ingresos.pf5, \n" +
                    "  distribucion_ingresos.pf6, \n" +
                    "  distribucion_ingresos.pf7, \n" +
                    "  distribucion_ingresos.pf8, \n" +
                    "  distribucion_ingresos.pf9, \n" +
                    "  distribucion_ingresos.pf10, \n" +
                    "  distribucion_ingresos.pf11, \n" +
                    "  distribucion_ingresos.pf12\n" +
                    "FROM \n" +
                    "  public.distribucion_ingresos, \n" +
                    "  public.direcciones_ingresos\n" +
                    "WHERE \n" +
                    "  distribucion_ingresos.direccion = direcciones_ingresos.direccion\n" +
                    "  and distribucion_ingresos.id = " + idregistro +
                    "";
                
                
                resultset = statement.executeQuery(sql);     
                
                return lista.resultsetToList(resultset ) ;
             
    }          
        
        

        
        
        
        
        
    public List<Map<String, Object>>  DistribucionMes  ( Integer idregistro, Integer direccion,
                Integer mes)                
        throws Exception {

            String sql = "";
        
            if (mes >= 1 && mes <= 12){
                
                sql = 
                    "  SELECT id, plan_id, direccion, pf" + mes.toString().trim() 
                        + " as montomes\n" +
                    "  FROM public.distribucion_ingresos\n" +
                    " where plan_id = " + idregistro + 
                    " and direccion =  "  + direccion ;                

                
            }
            else
            {
                sql = 
                    "  SELECT id, plan_id, direccion " 
                        + " as montomes\n" +
                    "  FROM public.distribucion_ingresos\n" +
                    " where  1 = 2" ;                 

                
            }
            
            statement = conexion.getConexion().createStatement();         
            resultset = statement.executeQuery(sql);     
            return lista.resultsetToList(resultset ) ;            
            
            
    }                  
        
        
        
    
}


