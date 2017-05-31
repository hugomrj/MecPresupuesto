/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package py.gov.mec.estructura.eje;

/**
 *
 * @author hugom_000
 */
public class EjeSQL  {
        
    
    public String  Lista ()
            throws Exception {
               
                 
                
                String sql = " "+                        
                "   SELECT eje, descripcion\n" +
                "  FROM estructura.ejes\n" +
                "  order by eje   " ;
                
                return sql ;
             
    }              

    
    
    public String  PresupuestoLista ()
            throws Exception {
               
                 
                
                String sql = " "+                        
                "  	SELECT \n" +
                "	  ejes.eje, \n" +
                "	  ejes.descripcion, \n" +
                "		CASE WHEN (sum(distribucion_subcomponente.monto) is null) \n" +
                "		THEN 0\n" +
                "		ELSE sum(distribucion_subcomponente.monto)\n" +
                "		END as ideal\n" +
                "	  \n" +
                "	FROM \n" +
                "	  estructura.ejes\n" +
                "	  left join \n" +
                "	  estructura.componentes on (ejes.eje = componentes.eje)\n" +
                "	  left join\n" +
                "	  estructura.subcomponentes on (componentes.componente = subcomponentes.componente)\n" +
                "	  left join\n" +
                "	  presupuesto.distribucion_subcomponente\n" +
                "	  on (subcomponentes.id = distribucion_subcomponente.subcomponente)  \n" +
                "	  group by ejes.eje, ejes.descripcion\n" +
                "	  order by eje\n" +
                "	     " ;
                
                return sql ;
             
    }           
        
    
}
















