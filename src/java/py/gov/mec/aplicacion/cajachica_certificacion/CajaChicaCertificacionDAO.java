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
                
    
    
    public List<Map<String, Object>>  RegistroMeses  ( Integer idregistro)                
        throws Exception {

            statement = conexion.getConexion().createStatement();
            
            
            String sql = 
                " SELECT t.uoc_id, suma,\n" +
                " CASE WHEN (cr1 is null) THEN 0 ELSE (cr1)  END,\n" +
                " CASE WHEN (cr2 is null) THEN 0 ELSE (cr2)  END,\n" +
                " CASE WHEN (cr3 is null) THEN 0 ELSE (cr3)  END,\n" +
                " CASE WHEN (cr4 is null) THEN 0 ELSE (cr4)  END,\n" +
                " CASE WHEN (cr5 is null) THEN 0 ELSE (cr5)  END,\n" +
                " CASE WHEN (cr6 is null) THEN 0 ELSE (cr6)  END,\n" +
                " CASE WHEN (cr7 is null) THEN 0 ELSE (cr7)  END,\n" +
                " CASE WHEN (cr8 is null) THEN 0 ELSE (cr8)  END,\n" +
                " CASE WHEN (cr9 is null) THEN 0 ELSE (cr9)  END,\n" +
                " CASE WHEN (cr10 is null) THEN 0 ELSE (cr10)  END,\n" +
                " CASE WHEN (cr11 is null) THEN 0 ELSE (cr11)  END,\n" +
                " CASE WHEN (cr12 is null) THEN 0 ELSE (cr12)  END\n" +
                " \n" +
                " from \n" +
                " (\n" +
                " SELECT uoc_id, sum(monto_certificacion) as suma       \n" +
                "   FROM public.cajachica_certificacion\n" +
                "   where uoc_id = \n" + idregistro +
                "   group by uoc_id\n" +
                " ) as t left join \n" +
                " (\n" +
                " SELECT uoc_id, sum(monto_certificacion) cr1\n" +
                "   FROM public.cajachica_certificacion\n" +
                "   where uoc_id = \n" + idregistro +
                "   and mes = 1\n" +
                "   group by uoc_id\n" +
                "   ) cer1 on (t.uoc_id = cer1.uoc_id) left join\n" +
                " (\n" +
                "SELECT uoc_id, sum(monto_certificacion) cr2\n" +
                "  FROM public.cajachica_certificacion\n" +
                "  where uoc_id = \n" + idregistro +
                "  and mes = 2\n" +
                "  group by uoc_id\n" +
                "  ) cer2 on (t.uoc_id = cer2.uoc_id) left join\n" +
                " (\n" +
                " SELECT uoc_id, sum(monto_certificacion) cr3\n" +
                "   FROM public.cajachica_certificacion\n" +
                "   where uoc_id = \n" + idregistro +
                "   and mes = 3\n" +
                "   group by uoc_id\n" +
                "   ) cer3 on (t.uoc_id = cer3.uoc_id) left join\n" +
                "  (\n" +
                " SELECT uoc_id, sum(monto_certificacion) cr4\n" +
                "   FROM public.cajachica_certificacion\n" +
                "   where uoc_id = \n" + idregistro +
                "   and mes = 4\n" +
                "   group by uoc_id\n" +
                "   ) cer4 on (t.uoc_id = cer4.uoc_id) left join\n" +
                "  (\n" +
                " SELECT uoc_id, sum(monto_certificacion) cr5\n" +
                "   FROM public.cajachica_certificacion\n" +
                "   where uoc_id = \n" + idregistro +
                "   and mes = 5\n" +
                "   group by uoc_id\n" +
                "   ) cer5 on (t.uoc_id = cer5.uoc_id) left join\n" +
                "  (\n" +
                " SELECT uoc_id, sum(monto_certificacion) cr6\n" +
                "   FROM public.cajachica_certificacion\n" +
                "   where uoc_id = \n" + idregistro +
                "   and mes = 6\n" +
                "   group by uoc_id\n" +
                "   ) cer6 on (t.uoc_id = cer6.uoc_id) left join\n" +
                " (\n" +
                " SELECT uoc_id, sum(monto_certificacion) cr7\n" +
                "   FROM public.cajachica_certificacion\n" +
                "   where uoc_id = \n" + idregistro +
                "   and mes = 7\n" +
                "   group by uoc_id\n" +
                "   ) cer7 on (t.uoc_id = cer7.uoc_id) left join\n" +
                " (\n" +
                " SELECT uoc_id, sum(monto_certificacion) cr8\n" +
                "   FROM public.cajachica_certificacion\n" +
                "   where uoc_id = \n" + idregistro +
                "   and mes = 8\n" +
                "   group by uoc_id\n" +
                "   ) cer8 on (t.uoc_id = cer8.uoc_id) left join\n" +
                "  (\n" +
                " SELECT uoc_id, sum(monto_certificacion) cr9\n" +
                "   FROM public.cajachica_certificacion\n" +
                "   where uoc_id = \n" + idregistro +
                "   and mes = 9\n" +
                "   group by uoc_id\n" +
                "   ) cer9 on (t.uoc_id = cer9.uoc_id) left join\n" +
                "  (\n" +
                " SELECT uoc_id, sum(monto_certificacion) cr10\n" +
                "   FROM public.cajachica_certificacion\n" +
                "   where uoc_id = \n" + idregistro +
                "   and mes = 10\n" +
                "   group by uoc_id\n" +
                "   ) cer10 on (t.uoc_id = cer10.uoc_id) left join\n" +
                "  (\n" +
                " SELECT uoc_id, sum(monto_certificacion) cr11\n" +
                "   FROM public.cajachica_certificacion\n" +
                "   where uoc_id = \n" + idregistro +
                "   and mes = 11\n" +
                "   group by uoc_id\n" +
                "   ) cer11 on (t.uoc_id = cer11.uoc_id) left join\n" +
                "  (\n" +
                " SELECT uoc_id, sum(monto_certificacion) cr12\n" +
                "   FROM public.cajachica_certificacion\n" +
                "   where uoc_id = \n" + idregistro +
                "   and mes = 12\n" +
                "   group by uoc_id\n" +
                "   ) cer12 on (t.uoc_id = cer12.uoc_id)";
              
            
            
            resultset = statement.executeQuery(sql);     

            return lista.resultsetToList(resultset ) ;

    }              
    
    
    
    
    
    
    
}


