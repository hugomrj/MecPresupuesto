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
import nebuleuse.ORM.Persistencia;
import nebuleuse.util.Lista;
import py.gov.mec.aplicacion.cajachica_distribucion.CajaChicaDistribucion;

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
             
    

    
    
    
    public boolean actualizarSaldo ( CajaChicaDistribucion cajaChicaDistri ) 
        throws Exception{
        
        boolean retornar = true;
        CajaChicaDistribucion cajaChicaAux = new CajaChicaDistribucion();
        Persistencia persistencia = new Persistencia();
        Long monto_certificacion  = 0L;
        Long monto_plan  = 0L;
        Long monto_plan_aux  = 0L;
        String metodo = "";
                
        for (int j = 1; j <= 12; j++) {
                        
            monto_certificacion  = 0L;
            cajaChicaAux = (CajaChicaDistribucion) persistencia.filtrarId(cajaChicaAux, cajaChicaDistri.getId());
            List<Map<String, Object>> list = this.ListaMes(cajaChicaDistri.getUoc_id(), j);

            Integer i = 0;
            for (Map<String, Object> map : list) {                        
                for (Map.Entry<String, Object> entry : map.entrySet()) {                
                    if (entry.getKey().toString().trim().endsWith("monto_certificacion"))
                    {
                        monto_certificacion = monto_certificacion + Long.parseLong(entry.getValue().toString());
                    }
                }            
            }
            
            metodo  = "getPf"+ j  ;            
            monto_plan = (Long) cajaChicaDistri.getClass().getMethod(metodo).invoke(cajaChicaDistri)  ;
            
            if (monto_certificacion  >   monto_plan){                    
                retornar =  false;
                break;
            }            
            
        }
        
        
        
        
        // si hay saldo para repartir
        if (retornar ==  true)
        {
            for (int x = 1; x <= 12; x++) {            

               
                metodo  = "getPf"+ x  ;            
                monto_plan = (Long) cajaChicaDistri.getClass().getMethod(metodo).invoke(cajaChicaDistri)  ;                
                monto_plan_aux = (Long) cajaChicaAux.getClass().getMethod(metodo).invoke(cajaChicaAux)  ;                
                
                if (!(monto_plan_aux.equals(monto_plan)))
                {                
                    this.ReCalcular(cajaChicaDistri.getUoc_id(), x, monto_plan);                                     
                }
                
                //cajaChicaDistri.getClass().getMethod(metodo).invoke(cajaChicaDistri)  ;      
            }
        }
        
        return retornar;        
        
    }

    
    
    
    public void ReCalcular ( Integer uoc_id , Integer mes, Long montoCertificacion )
            throws Exception {
            
            if (montoCertificacion > 0){
                
                statement = conexion.getConexion().createStatement();         
    
                String sql = " "+ 
                " SELECT id, uoc_id, monto_certificacion, direccion, monto_disponible, \n" +
                "       mes\n" +
                "  FROM public.cajachica_certificacion\n" +
                "  where uoc_id = " + uoc_id +
                "  and mes = " + mes +
                "  order by id ; ";

                resultset = statement.executeQuery(sql);     
                
                Long monto_disponible = montoCertificacion;
                
                CajaChicaCertificacion cajachicacerti = new CajaChicaCertificacion();
                Persistencia persistencia = new Persistencia();
                

                
                while(resultset.next())
                {
                    cajachicacerti = (CajaChicaCertificacion) persistencia.filtrarId(cajachicacerti, Integer.parseInt(resultset.getArray("id").toString()) );
                    cajachicacerti.setMonto_disponible(monto_disponible);
                    persistencia.update(cajachicacerti);
                    monto_disponible = monto_disponible - cajachicacerti.getMonto_certificacion();
                    
                }                            
            
            }
         
    }          
                
    
    
    
    
}


