/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package py.gov.mec.estructura.componente;



/**
 *
 * @author hugom_000
 */
public class ComponenteSQL  {
        
    
    public String  Lista (Integer eje)
            throws Exception {
               
                 
                
                String sql = " "+                        
                "   SELECT componente, eje, descripcion\n" +
                "  FROM estructura.componentes\n" +
                "  where eje = \n" + eje + 
                "  ORDER By componente   " ;
                 
                return sql ;
             
    }              

    

    
    public String  PresupuestoLista (Integer eje)
            throws Exception {
               
                 
                
                String sql = " "+                        
                " 	SELECT \n" +
                "	  componentes.componente, \n" +
                "	  componentes.eje, \n" +
                "	  componentes.descripcion, \n" +
                "		CASE WHEN (sum(distribucion_subcomponente.monto) is null) \n" +
                "		THEN 0\n" +
                "		ELSE sum(distribucion_subcomponente.monto)\n" +
                "		END as ideal	  \n" +
                "	FROM \n" +
                "	  estructura.componentes \n" +
                "	  left join\n" +
                "	  estructura.subcomponentes on (componentes.componente = subcomponentes.componente)\n" +
                "	  left join\n" +
                "	  presupuesto.distribucion_subcomponente\n" +
                "	  on (subcomponentes.id = distribucion_subcomponente.subcomponente)  \n" +
                "	  where componentes.eje = \n" + eje +
                "	  group by  componentes.componente, componentes.eje, componentes.descripcion\n" +
                "	  order by componentes.componente\n" +
                "	     " ;
                 
                return sql ;
             
    }              
    



    
}
















