/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package py.gov.mec.aplicacion.cajachica;



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
public class CajaChicaDAO  {
        
        Conexion conexion = new Conexion();
        Statement  statement ;
        ResultSet resultset;  
        Lista lista ;
        
    
    public CajaChicaDAO ( ) throws IOException  {
        conexion.conectar();
        lista = new Lista();
    }

        
        
        public List<Map<String, Object>>  Todos  ( )                
            throws Exception {
                
            
                statement = conexion.getConexion().createStatement();         
                
                
                String sql = " "+ 
"                      SELECT  \n" +
"                      presupuesto_vigente.id,  \n" +
"                      presupuesto_vigente.tp,  \n" +
"                      presupuesto_vigente.pg,  \n" +
"                      presupuesto_vigente.sp,  \n" +
"                      presupuesto_vigente.py,  \n" +
"                      presupuesto_vigente.obj,  \n" +
"                      presupuesto_vigente.ff,  \n" +
"                      presupuesto_vigente.of,  \n" +
"                      presupuesto_vigente.dpt,  \n" +
"                      uoc_certificacion.certificado as monto,  \n" +
"                      uoc_certificacion.detalle_tipo, \n" +
"                      uoc_certificacion.id uoc_id, \n" +
"			  (  \n" +
"			   CASE WHEN (d.certificado  is null) THEN 0              \n" +
"			    ELSE d.certificado  \n" +
"			    END  \n" +
"			  ) certificado ,\n" +
"\n" +
"			  (  \n" +
"			   CASE WHEN (d.certificado  is null) THEN 0              \n" +
"			    ELSE  uoc_certificacion.certificado - d.certificado  \n" +
"			    END  \n" +
"			  ) diferencia \n" +
"			  \n" +
"                    FROM  \n" +
"                      public.presupuesto_vigente,  \n" +
"                      public.uoc_certificacion \n" +
"			left join \n" +
"			(\n" +
"				SELECT \n" +
"				  cajachica_certificacion.uoc_id, \n" +
"				  sum(cajachica_certificacion.monto_certificacion) as certificado\n" +
"				FROM \n" +
"				  public.cajachica_certificacion\n" +
"				  group by cajachica_certificacion.uoc_id\n" +
"				  \n" +
"			) as d on ( uoc_certificacion.id = d.uoc_id)\n" +
"                      \n" +
"                    WHERE \n" +
"                      presupuesto_vigente.id = uoc_certificacion.presupuesto_id \n" +
"                      and detalle_tipo = 'CA' \n" +
"                      order by tp, pg, sp, py, obj, ff, of, dpt\n" +
"                      ;\n" +
"\n" +
"\n" +
"                       ";
                
                resultset = statement.executeQuery(sql);     
                
                return lista.resultsetToList(resultset ) ;
             
    }          
        

        

    public List<Map<String, Object>>  RegistroID  ( Integer registro)                
        throws Exception {

                statement = conexion.getConexion().createStatement();         

     
                
                String sql = " "+ 
                    " SELECT \n" +
                    "  presupuesto_vigente.id, \n" +
                    "  presupuesto_vigente.tp, \n" +
                    "  presupuesto_vigente.pg, \n" +
                    "  presupuesto_vigente.sp, \n" +
                    "  presupuesto_vigente.py, \n" +
                    "  presupuesto_vigente.obj, \n" +
                    "  presupuesto_vigente.ff, \n" +
                    "  presupuesto_vigente.of, \n" +
                    "  presupuesto_vigente.dpt, \n" +
                    "  uoc_certificacion.certificado as monto, \n" +
                    "  uoc_certificacion.detalle_tipo,\n" +
                    "  uoc_certificacion.id uoc_id   \n" +                        
                    "FROM \n" +
                    "  public.presupuesto_vigente, \n" +
                    "  public.uoc_certificacion\n" +
                    "WHERE\n" +
                    "  presupuesto_vigente.id = uoc_certificacion.presupuesto_id\n" +
                    "  and detalle_tipo = 'CA'\n" +
                    "  and  uoc_certificacion.id   =" + registro +
                    "\n" +
                    "\n" +
                    " ";           
                
                resultset = statement.executeQuery(sql);     
                
                return lista.resultsetToList(resultset ) ;
             
    }          
                   
    
        
        
        
        
        
}
