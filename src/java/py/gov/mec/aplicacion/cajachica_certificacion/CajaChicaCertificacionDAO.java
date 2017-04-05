/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package py.gov.mec.aplicacion.cajachica_certificacion;


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
public class CajaChicaCertificacionDAO  {
        
        Conexion conexion = new Conexion();
        Statement  statement ;
        ResultSet resultset;  
        Lista lista ;
        
    
    public CajaChicaCertificacionDAO ( ) throws IOException  {
        conexion.conectar();
        lista = new Lista();
    }


    
    public List<Map<String, Object>>  ListaMes  ( Integer uoc_id, Integer mes )
            throws Exception {
            
                statement = conexion.getConexion().createStatement();         
                
                //falta arreglar este sql left join
                
                String sql = "   "+
                " SELECT cajachica_certificacion.id, uoc_id, monto_certificacion, \n" +
                "	direccion, monto_disponible, mes, descripcion, \n" +
                "	(  monto_disponible -  monto_certificacion  ) as diferencia \n" +
                "  FROM cajachica_certificacion,  direcciones\n" +
                "  where cajachica_certificacion.direccion = direcciones.id\n" +
                "  and uoc_id = " + uoc_id + 
                "  and mes = " + mes +
                "  order by cajachica_certificacion.id" ;

                
                resultset = statement.executeQuery(sql);     
                
                return lista.resultsetToList(resultset ) ;
             
    }          
    
      
    
    
    public List<Map<String, Object>>  DisponibleMes ( Integer uoc_id , Integer mes )
            throws Exception {
            
                statement = conexion.getConexion().createStatement();         

                
                String sql = " "+ 
                "                  SELECT id, cajachica_distribucion.uoc_id,  \n" +
                "                	(    \n" +
                "                	   CASE WHEN (monto_certificacion  is null) THEN pf"+mes+" \n" +
                "                	       ELSE (pf"+mes+" - monto_certificacion)    \n" +
                "                	       END    \n" +
                "                	) disponible  	 \n" +
                "                 \n" +
                "                  FROM cajachica_distribucion \n" +
                "                  left join \n" +
                "                 ( \n" +
                "			SELECT uoc_id, sum(monto_certificacion) monto_certificacion\n" +
                "			  FROM public.cajachica_certificacion\n" +
                "			  where mes = " + mes +
                "			group by uoc_id\n" +
                "                 ) as d \n" +
                "                 on d.uoc_id = cajachica_distribucion.uoc_id   \n" +
                "                  where cajachica_distribucion.uoc_id =  " + uoc_id +
                "; ";

                resultset = statement.executeQuery(sql);     
                
                return lista.resultsetToList(resultset ) ;
             
    }          
             
    
    
    
    public void actualizarSaldo ( Integer uoc_id , Integer mes ) 
            throws Exception{
        
        
        
        
        
        List<Map<String, Object>> list = this.ListaMes(uoc_id, mes);
       
        
        Integer i = 0;
        
        
        for (Map<String, Object> map : list) {
            
            
            for (Map.Entry<String, Object> entry : map.entrySet()) {
                
                String key = entry.getKey();
                Object value = entry.getValue();
                
                System.out.println(key);            
                System.out.println(value.toString());            
                
            }
            
            System.out.println("--------------------------");            
            
        }

        
        
    
    }



    
    
}


