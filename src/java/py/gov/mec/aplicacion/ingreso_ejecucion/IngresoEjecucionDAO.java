/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package py.gov.mec.aplicacion.ingreso_ejecucion;


import py.gov.mec.aplicacion.ingreso_certificacion.*;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import nebuleuse.ORM.Conexion;
import nebuleuse.util.Lista;

/**
 *
 * @author hugom_000
 */
public class IngresoEjecucionDAO  {
        
        Conexion conexion = new Conexion();
        Statement  statement ;
        ResultSet resultset;  
        Lista lista ;
        
    
    public IngresoEjecucionDAO ( ) throws IOException  {
        conexion.conectar();
        lista = new Lista();
    }

                
    public List<Map<String, Object>>  ListaPlan  ( Integer idreg)                
            throws Exception {
                            
                statement = conexion.getConexion().createStatement();         
                
                String sql = 
"                        SELECT  \n" +
"                          direcciones_ingresos.descripcion as direccion_descripcion,  \n" +
"                          ingresos_ejecucion.id,  \n" +
"                          ingresos_ejecucion.plan_id,  \n" +
"                          ingresos_ejecucion.direccion,  \n" +
"                          ingresos_ejecucion.pf1,  \n" +
"                          ingresos_ejecucion.pf2,  \n" +
"                          ingresos_ejecucion.pf3,  \n" +
"                          ingresos_ejecucion.pf4,  \n" +
"                          ingresos_ejecucion.pf5,  \n" +
"                          ingresos_ejecucion.pf6,  \n" +
"                          ingresos_ejecucion.pf7,  \n" +
"                          ingresos_ejecucion.pf8,  \n" +
"                          ingresos_ejecucion.pf9,  \n" +
"                          ingresos_ejecucion.pf10,  \n" +
"                          ingresos_ejecucion.pf11,  \n" +
"                          ingresos_ejecucion.pf12 \n" +
"                        FROM  \n" +
"                          public.direcciones_ingresos,  \n" +
"                          public.ingresos_ejecucion \n" +
"                        WHERE  \n" +
"                          direcciones_ingresos.direccion = ingresos_ejecucion.direccion \n" +
"                          and plan_id =  " +   idreg  +
"                        Order by direccion;  ;";
                
                                                               
                resultset = statement.executeQuery(sql);                     
                return lista.resultsetToList(resultset ) ;
             
    }          
        
        
    public boolean  isRegistroExiste  ( Integer plan_id, Integer direccion)                
            throws Exception {
                            
                statement = conexion.getConexion().createStatement();         
                
                String sql = 
                        "SELECT id" +
                        "  FROM public.ingresos_ejecucion\n" +
                        "  where plan_id = " + plan_id +
                        "  and  direccion = "  + direccion ;
                
                resultset = statement.executeQuery(sql);     

                if(resultset.next()) 
                {    
                    return true;          
                }
                else{
                    return false;
                }                
             
    }                  
        
        
    public void  UpdateMes  ( Integer plan_id, Integer direccion, Integer mes, Long monto)                
            {
                            
            try {        
                
                String sql = "" +
                        " UPDATE public.ingresos_ejecucion\n" +
                        "   SET pf"+mes+" =  " + monto +
                        "   WHERE plan_id =" + plan_id +
                        "   and direccion = " +direccion;

                conexion.getConexion().createStatement().execute(sql);
                
            } catch (SQLException ex) {
                Logger.getLogger(IngresoCertificacionDAO.class.getName()).log(Level.SEVERE, null, ex);
                
            }

    }        
    
    
    public void  InsertMes  ( Integer plan_id, Integer direccion, Integer mes, Long monto)                
            {
                            
            try {        
                
                String sql = 
                        "    INSERT INTO public.ingresos_ejecucion (\n" +
                        "    plan_id, direccion, pf"+mes+" )\n" +
                        "    VALUES ("+plan_id +","+direccion+","+monto+"); "   ;
                

                conexion.getConexion().createStatement().execute(sql);
                
            } catch (SQLException ex) {
                Logger.getLogger(IngresoCertificacionDAO.class.getName()).log(Level.SEVERE, null, ex);
                
            }

    }         
        
    
    
    
    public List<Map<String, Object>>  SaldoMes ( Integer mes, Integer plan_id, Integer direccion)                
            throws Exception {
                
        
                statement = conexion.getConexion().createStatement();         
                
                String sql = ""
                    + "SELECT pf.plan_id, pf.direccion, pf.pf"+mes+", ej.pf"+mes+", " +
                    " ( pf.pf"+mes+" - ej.pf"+mes+") saldomes " +
                    "  FROM public.ingresos_certificacion as pf " +
                    "  inner join  public.ingresos_ejecucion ej " +
                    "  on (pf.direccion = ej.direccion " +
                    "	and pf.plan_id = ej.plan_id ) " +
                    "  where pf.direccion = " + direccion + 
                    "  and pf.plan_id = " + plan_id  ;
                
                
            try {                        
                resultset = statement.executeQuery(sql);     
                return lista.resultsetToList(resultset ) ;  
            } catch (SQLException ex) {          
                                
                resultset = statement.executeQuery("select * from ingresos_ejecucion where 1 = 2;");     
                return lista.resultsetToList( resultset ) ;   
                
            }
            
             
    }       
    
    
    
}





