/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package py.gov.mec.aplicacion.viatico_certificacion;


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
public class ViaticoCertificacionDAO  {
        
        Conexion conexion = new Conexion();
        Statement  statement ;
        ResultSet resultset;  
        Lista lista ;
        
    
    public ViaticoCertificacionDAO ( ) throws IOException  {
        conexion.conectar();
        lista = new Lista();
    }


    
    public List<Map<String, Object>>  ListaInterior  ( Integer codigo )
            throws Exception {
            
                statement = conexion.getConexion().createStatement();         

                
                String sql = " "+
                " SELECT " +
                "  viatico_certificacion.id, \n" +
                "  direcciones.descripcion, \n" +
                "  tipo_viatico, \n" +
                "  tp, pg, sp, py, obj, ff, of, dpt, \n" +
                "  monto_certificacion, \n" +
                "  monto_disponible, \n" +
                "  (  monto_disponible -  monto_certificacion  ) as diferencia,\n" +
                "  mes\n" +
                " FROM \n" +
                "  viatico_certificacion, \n" +
                "  direcciones, \n" +
                "  viatico_certificacion_numeracion, \n" +
                "  plan_financiero, \n" +
                "  presupuesto_vigente\n" +
                " WHERE \n" +
                "  direcciones.id = viatico_certificacion.direccion AND\n" +
                "  viatico_certificacion_numeracion.id = viatico_certificacion.certificacion_numeracion AND\n" +
                "  viatico_certificacion_numeracion.plan_financiero_id = plan_financiero.id AND\n" +
                "  presupuesto_vigente.id = plan_financiero.presupuesto_id\n" +
                "  and tipo_viatico = 'I'\n" +
                "  and viatico_certificacion_numeracion.codigo_interno = " + codigo +
                " ORDER BY viatico_certificacion.id ";                      
                        
                resultset = statement.executeQuery(sql);     
                
                return lista.resultsetToList(resultset ) ;
             
    }          
    
    

    public List<Map<String, Object>>  ListaExterior  ( Integer codigo )
            throws Exception {
            
                statement = conexion.getConexion().createStatement();         

                
                String sql = " "+
                    "  SELECT \n" +
                    "  viatico_certificacion.id, \n" +
                    "  personas.cedula, \n" +
                    "  personas.nombres, \n" +
                    "  categoria_funcionario, \n" +
                    "  monto_certificacion, \n" +
                    "  plan_financiero_id, \n" +
                    "  tipo_viatico\n" +
                    "FROM \n" +
                    "  viatico_certificacion, \n" +
                    "  viatico_certificacion_numeracion, \n" +
                    "  personas\n" +
                    "WHERE \n" +
                    "  viatico_certificacion_numeracion.id = certificacion_numeracion AND\n" +
                    "  personas.persona = viatico_certificacion.persona\n" +
                    "  and tipo_viatico = 'E'\n" +
                    "  and codigo_interno = " + codigo;
                        
                resultset = statement.executeQuery(sql);     
                
                return lista.resultsetToList(resultset ) ;
             
    }          
    



    
    
    
    

    
    public List<Map<String, Object>>  DisponibleMes ( Integer planfin , Integer mes )
            throws Exception {
            
                statement = conexion.getConexion().createStatement();         

                
                String sql = " "+ 
                "  SELECT id, presupuesto_id, \n" +
                "	(   \n" +
                "	   CASE WHEN (monto_certificacion  is null) THEN pf"+mes+"\n" +
                "	       ELSE (pf"+mes+" - monto_certificacion)   \n" +
                "	       END   \n" +
                "	) disponible  	\n" +
                "\n" +
                "  FROM public.plan_financiero\n" +
                "  left join\n" +
                " (\n" +
                " SELECT plan_financiero_id,\n" +
                "	sum( monto_certificacion) monto_certificacion  \n" +
                " FROM \n" +
                "  viatico_certificacion, \n" +
                "  viatico_certificacion_numeracion\n" +
                " WHERE \n" +
                "  viatico_certificacion_numeracion.id = viatico_certificacion.certificacion_numeracion\n" +
                "  and viatico_certificacion_numeracion.mes = \n" + mes +
                "  and viatico_certificacion_numeracion.plan_financiero_id = \n" + planfin +
                "  group by plan_financiero_id\n" +
                " ) as d\n" +
                " on d.plan_financiero_id = plan_financiero.id  \n" +
                "  where plan_financiero.id = " + planfin +
                "  ; ";

                resultset = statement.executeQuery(sql);     
                
                return lista.resultsetToList(resultset ) ;
             
    }          
    
    

    
    
    public List<Map<String, Object>>  ExteriorMemo ( Integer planfin , Integer mes, Integer certificacion_nro )
            throws Exception {
            
                statement = conexion.getConexion().createStatement();         

                
                String sql = " "+ 
                    "  SELECT \n" +
                    "  viatico_certificacion_numeracion.id, \n" +
                    "  presupuesto_vigente.tp, \n" +
                    "  presupuesto_vigente.pg, \n" +
                    "  presupuesto_vigente.sp, \n" +
                    "  presupuesto_vigente.py, \n" +
                    "  presupuesto_vigente.obj, \n" +
                    "  presupuesto_vigente.ff, \n" +
                    "  presupuesto_vigente.of, \n" +
                    "  presupuesto_vigente.dpt,   \n" +
                    "  'Pasajes y Viaticos' as descripcion, \n" +
                    "  plan_financiero.pf"+mes+" planmes, \n" +
                    "  viatico_certificacion_numeracion.anteriores, \n" +
                    "  vc.certificacion_actual,   \n" +
                    "  ( pf"+mes+" - (  certificacion_actual - anteriores) )  saldo,\n" +
                    "  plan_financiero.id planf,\n" +
                    "  viatico_certificacion_numeracion.mes,\n" +
                    "  dolar\n" +
                    " FROM \n" +
                    "  (\n" +
                    "	SELECT certificacion_numeracion, sum(monto_certificacion) certificacion_actual \n" +
                    "	FROM public.viatico_certificacion\n" +
                    "	group by certificacion_numeracion\n" +
                    "  ) vc, \n" +
                    "  viatico_certificacion_numeracion, \n" +
                    "  plan_financiero, \n" +
                    "  presupuesto_vigente\n" +
                    "WHERE \n" +
                    "  vc.certificacion_numeracion = viatico_certificacion_numeracion.id AND\n" +
                    "  viatico_certificacion_numeracion.plan_financiero_id = plan_financiero.id AND\n" +
                    "  plan_financiero.presupuesto_id = presupuesto_vigente.id\n" +
                    "  and plan_financiero.id  =  " + planfin + 
                    "  and certificacion_numeracion = " + certificacion_nro +
                    " ; ";

                resultset = statement.executeQuery(sql);     
                
                return lista.resultsetToList(resultset ) ;
             
    }             

    
    
    
        
    
}


