/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package py.gov.mec.estructura.nivel;





/**
 *
 * @author hugom_000
 */
public class NivelSQL  {
        
    
    public String  Lista (Integer com)
            throws Exception {
               
                 
                
                String sql = " "+                        
                "   SELECT id, componente, descripcion\n" +
                "  FROM estructura.niveles\n" +
                "  where componente = \n" + com +
                "  order by id" ;
                 
                return sql ;
             
    }              

    
    public String  PresupuestoLista (Integer com)
            throws Exception {
               
                 
                
                String sql = " "+                        
        "                   	SELECT  \n" +
        "                	  niveles.id,  \n" +
        "                	  niveles.componente, 	   \n" +
        "                	  niveles.descripcion, \n" +
        "                		CASE WHEN (sum(distribucion_componente.monto) is null)  \n" +
        "                		THEN 0 \n" +
        "                		ELSE sum(distribucion_componente.monto) \n" +
        "                		END as ideal	   \n" +
        "                	FROM  \n" +
        "\n" +
        "                	  estructura.niveles \n" +
        "                	  left join \n" +
        "                	  estructura.items on (niveles.id = items.nivel)   \n" +
        "                	  left join \n" +
        "                	  presupuesto.distribucion_componente on (items.id = distribucion_componente.item)   \n" +
        "                	  \n" +
        "                	  where niveles.componente =   \n" + com +
        "                	  group by  niveles.id, niveles.componente, niveles.descripcion \n" +
        "                	  order by niveles.id  " ;
                 
                return sql ;
             
    }              
    
    

        
    
}
















