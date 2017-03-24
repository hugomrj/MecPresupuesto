/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package py.gov.mec.aplicacion.viatico_certificacion_numeracion;


import java.io.IOException;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;
import java.util.Map;
import nebuleuse.ORM.Conexion;
import nebuleuse.ORM.Persistencia;
import nebuleuse.util.Lista;

/**
 *
 * @author hugom_000
 */
public class ViaticoCertificacionNumeracionDAO  {
        
        Conexion conexion = new Conexion();
        Statement  statement ;
        ResultSet resultset;  
        Lista lista ;
        
    
    public ViaticoCertificacionNumeracionDAO ( ) throws IOException  {
        conexion.conectar();
        lista = new Lista();
    }


    
    public List<Map<String, Object>>  ListaPlanFinacieroMes  ( Integer planf, Integer mes )
            throws Exception {
            
                statement = conexion.getConexion().createStatement();         

                
                //falta arreglar este sql left join
                
                String sql = "   "+
                " SELECT id, plan_financiero_id, fecha, codigo_interno, mes,  tipo_viatico, dolar, anteriores, \n" +
                "  	  (  \n" +
                "	   CASE WHEN (monto_certificacion  is null) THEN 0              \n" +
                "               ELSE monto_certificacion  \n" +
                "               END  \n" +
                "               ) monto_certificacion " +
                "  FROM public.viatico_certificacion_numeracion n\n" +
                "  left join \n" +
                "  (\n" +
                "	SELECT \n" +
                "	certificacion_numeracion, \n" +
                "	sum(monto_certificacion)  as monto_certificacion \n" +
                "	  FROM public.viatico_certificacion\n" +
                "	group by certificacion_numeracion\n" +
                "  ) as c \n" +
                "	on (n.id = c.certificacion_numeracion )\n" +
                "	where mes = " + mes +
                "	and plan_financiero_id = " + planf +
                "        ORDER BY id;\n" ;

                
                resultset = statement.executeQuery(sql);     
                
                return lista.resultsetToList(resultset ) ;
             
    }          
    
      
    
        public List<Map<String, Object>>  RegistroID  ( Integer idregistro)                
            throws Exception {
                
                statement = conexion.getConexion().createStatement();         
                
                String sql = 
                    " SELECT id, fecha, codigo_interno, mes, plan_financiero_id, tipo_viatico, dolar\n" +
                    "  FROM public.viatico_certificacion_numeracion\n" +
                    "  where id = " + idregistro +
                    "   " ;                
                
                resultset = statement.executeQuery(sql);     
                
                return lista.resultsetToList(resultset ) ;
             
    }             
    
      
    
        
        
    public void  CertificadoAnterior ( ViaticoCertificacionNumeracion viatico  )
            throws Exception {
            
                statement = conexion.getConexion().createStatement();         
                Persistencia persistencia = new Persistencia();
                
                String sql = " "+ 
                    "  SELECT \n" +
                    "  sum(monto_certificacion) as suma\n" +
                    "   FROM \n" +
                    "  public.viatico_certificacion, \n" +
                    "  public.viatico_certificacion_numeracion\n" +
                    "  WHERE \n" +
                    "  viatico_certificacion.certificacion_numeracion = viatico_certificacion_numeracion.id\n" +
                    "  and plan_financiero_id =" + viatico.getPlan_financiero_id() +
                    "  and mes =  " + viatico.getMes() +" ;" ;

                resultset = statement.executeQuery(sql);     
                /*
                //ViaticoCertificacionNumeracion viatico = new ViaticoCertificacionNumeracion();
                
                viatico = (ViaticoCertificacionNumeracion) persistencia.filtrarId(viatico, id);
                */
                
                if(resultset.next()) 
                {    
                    if (resultset.getString("suma") == null ) {
                        viatico.setAnteriores( 0L ) ;                    
                    }
                    else
                    {
                        viatico.setAnteriores( Long.parseLong( resultset.getString("suma") ) ) ;                    
                    }

                }
                else{
                    viatico.setAnteriores( 0L ) ;                    
                }                     
                viatico = (ViaticoCertificacionNumeracion) persistencia.update(viatico);
                //si es registo vacio insertar 0
                //return lista.resultsetToList(resultset ) ;
             
    }          
        
        
        
    
}


