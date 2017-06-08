
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package py.gov.mec.estructura.item;

/**
 *
 * @author hugom_000
 */


public class ItemSQL  {
        
    
    public String  PresupuestoLista (Integer niv)
            throws Exception {
               
                 
                
                String sql = " "+                        
            "		SELECT  \n" +
            "		  items.id,  \n" +
            "		  items.nivel, 	   \n" +
            "		  items.descripcion, \n" +
            "			CASE WHEN (sum(distribucion_componente.monto) is null)  \n" +
            "			THEN 0 \n" +
            "			ELSE sum(distribucion_componente.monto) \n" +
            "			END as ideal	   \n" +
            "		FROM  \n" +
            "\n" +
            "		  estructura.items \n" +
            "		  left join \n" +
            "		  presupuesto.distribucion_componente on (items.id = distribucion_componente.item)   \n" +
            "		  \n" +
            "		  where items.nivel =  \n" + niv +
            "		  group by  items.id, items.nivel, items.descripcion \n" +
            "		  order by items.id \n" +
            " " ;
                 
                
                return sql ;
             
    }              
    
    
    
    
        public String  RegistroId (Integer id)
            throws Exception {
               
                 
                
                String sql = " " +
                "	SELECT  \n" +
                "	  items.id as item,  \n" +
                "	  items.descripcion item_descripcion,  \n" +
                "	  niveles.id as nivel,  \n" +
                "	  niveles.descripcion nivel_descripcion,  \n" +
                "	  ejes.eje,  \n" +
                "	  ejes.descripcion eje_descripcion,  \n" +
                "	  componentes.descripcion componente_descripcion,  \n" +
                "	  componentes.componente \n" +
                "	FROM  \n" +
                "	  estructura.ejes,\n" +
                "	  estructura.componentes,  \n" +
                "	  estructura.niveles,  \n" +
                "	  estructura.items\n" +
                "	WHERE  \n" +
                "	  ejes.eje = componentes.eje \n" +
                "	  and componentes.componente = niveles.componente \n" +
                "	  and niveles.id = items.nivel\n" +
                "	  and items.id =  " + id ;

                 
                return sql ;
             
    }       
        

        
    
}
















