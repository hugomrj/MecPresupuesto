/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package py.gov.mec.aplicacion.ingreso_certificacion;


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
public class IngresoCertificacionDAO  {
        
        Conexion conexion = new Conexion();
        Statement  statement ;
        ResultSet resultset;  
        Lista lista ;
        
    
    public IngresoCertificacionDAO ( ) throws IOException  {
        conexion.conectar();
        lista = new Lista();
    }

        
        
    public List<Map<String, Object>>  ListaPlan  ( Integer idreg)                
            throws Exception {
                
            
                statement = conexion.getConexion().createStatement();         
                
                String sql = 
                        "SELECT \n" +
                        "  direcciones_ingresos.descripcion as direccion_descripcion, \n" +
                        "  ingresos_certificacion.id, \n" +
                        "  ingresos_certificacion.plan_id, \n" +
                        "  ingresos_certificacion.direccion, \n" +
                        "  ingresos_certificacion.pf1, \n" +
                        "  ingresos_certificacion.pf2, \n" +
                        "  ingresos_certificacion.pf3, \n" +
                        "  ingresos_certificacion.pf4, \n" +
                        "  ingresos_certificacion.pf5, \n" +
                        "  ingresos_certificacion.pf6, \n" +
                        "  ingresos_certificacion.pf7, \n" +
                        "  ingresos_certificacion.pf8, \n" +
                        "  ingresos_certificacion.pf9, \n" +
                        "  ingresos_certificacion.pf10, \n" +
                        "  ingresos_certificacion.pf11, \n" +
                        "  ingresos_certificacion.pf12\n" +
                        "FROM \n" +
                        "  public.direcciones_ingresos, \n" +
                        "  public.ingresos_certificacion\n" +
                        "WHERE \n" +
                        "  direcciones_ingresos.direccion = ingresos_certificacion.direccion\n" +
                        "  and plan_id = " +   idreg  +
                        "Order by direccion; " ;
                                                
                
                resultset = statement.executeQuery(sql);     
                
                return lista.resultsetToList(resultset ) ;
             
    }          
        
        
    public boolean  isRegistroExiste  ( Integer plan_id, Integer direccion)                
            throws Exception {
                
            
                statement = conexion.getConexion().createStatement();         
                
                String sql = 
                        "SELECT id" +
                        "  FROM public.ingresos_certificacion\n" +
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
                

    public void  InsertMes  ( Integer plan_id, Integer direccion, Integer mes, Long monto)                
            {
                            
            try {        
                
                String sql = 
                        "    INSERT INTO public.ingresos_certificacion(\n" +
                        "    plan_id, direccion, pf"+mes+" )\n" +
                        "    VALUES ("+plan_id +","+direccion+","+monto+"); "   ;
                

                conexion.getConexion().createStatement().execute(sql);
                
            } catch (SQLException ex) {
                Logger.getLogger(IngresoCertificacionDAO.class.getName()).log(Level.SEVERE, null, ex);
                
            }

    }         
    
    public void  UpdateMes  ( Integer plan_id, Integer direccion, Integer mes, Long monto)                
            {
                            
            try {        
                
                String sql = "" +
                        " UPDATE public.ingresos_certificacion\n" +
                        "   SET pf"+mes+" =  " + monto +
                        "   WHERE plan_id =" + plan_id +
                        "   and direccion = " +direccion;

                conexion.getConexion().createStatement().execute(sql);
                
            } catch (SQLException ex) {
                Logger.getLogger(IngresoCertificacionDAO.class.getName()).log(Level.SEVERE, null, ex);
                
            }

    }             
        
        
    public List<Map<String, Object>>  DistribucionMes  ( Integer idregistro, Integer direccion,
                Integer mes)                
        throws Exception {

            String sql = "";
        
            if (mes >= 1 && mes <= 12){
                
                sql = 
                    "  SELECT id, plan_id, direccion, pf" + mes.toString().trim() 
                        + " as montomes\n" +
                    "  FROM public.ingresos_certificacion\n" +
                    " where plan_id = " + idregistro + 
                    " and direccion =  "  + direccion ;                

                
            }
            else
            {
                sql = 
                    "  SELECT id, plan_id, direccion " 
                        + " as montomes\n" +
                    "  FROM public.ingresos_certificacion\n" +
                    " where  1 = 2" ;                 

                
            }
            
            statement = conexion.getConexion().createStatement();         
            resultset = statement.executeQuery(sql);     
            return lista.resultsetToList(resultset ) ;            
            
            
    }                  
    
    
    
    
}





