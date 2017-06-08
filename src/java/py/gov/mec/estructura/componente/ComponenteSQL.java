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
        "                  	SELECT  \n" +
        "                	  componentes.componente,  \n" +
        "                	  componentes.eje,  \n" +
        "                	  componentes.descripcion,  \n" +
        "                		CASE WHEN (sum(distribucion_componente.monto) is null)  \n" +
        "                		THEN 0 \n" +
        "                		ELSE sum(distribucion_componente.monto) \n" +
        "                		END as ideal	   \n" +
        "                	FROM  \n" +
        "                	  estructura.componentes  \n" +
        "                	  left join \n" +
        "                	  estructura.niveles on (componentes.componente = niveles.componente) \n" +
        "                	  left join \n" +
        "                	  estructura.items on (niveles.id = items.nivel)   \n" +
        "                	  left join \n" +
        "                	  presupuesto.distribucion_componente on (items.id = distribucion_componente.item)   \n" +
        "                	  \n" +
        "                	  where componentes.eje =  \n" + eje +
        "                	  group by  componentes.componente, componentes.eje, componentes.descripcion \n" +
        "                	  order by componentes.componente  " ;
                 
                return sql ;
             
    }              
    



    
}
















