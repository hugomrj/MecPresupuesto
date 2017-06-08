
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


package py.gov.mec.presupuesto.distribucion_componente;

/**
 *
 * @author hugom_000
 */
public class DistribucionComponenteSQL  {
        
    
    public String  Lista ( Integer presupuesto)
            throws Exception {
                               
                
        String sql = " "+                        
        "                  SELECT  \n" +
        "                  distribucion_componente.id,  \n" +
        "                  presupuesto,  \n" +
        "                  item,  \n" +
        "                  monto,  \n" +
        "                  items.descripcion \n" +
        "                 FROM  \n" +
        "                  presupuesto.distribucion_componente,  \n" +
        "                  estructura.items \n" +
        "                 WHERE  \n" +
        "                  items.id = distribucion_componente.item \n" +
        "                  and presupuesto =   \n" + presupuesto +
        "                  order by id \n" +
        "                      ;  " ;
                
                return sql ;
                
    }              


    public String  PresupuestoSuma ( Integer presupuesto)
            throws Exception {
                               
                
                String sql = " "+                        
                "  SELECT sum(monto) sumamonto\n" +
                "  FROM presupuesto.distribucion_componente\n" +
                "  where presupuesto = \n" +  presupuesto +              
                "     " ;
                
                return sql ;
                
    }              




    public String  LineaCompleta ( Integer id)
            throws Exception {
                               
                
                String sql = " "+                        
                "	SELECT  \n" +
                "	  distribucion_componente.id,  \n" +
                "	  distribucion_componente.presupuesto,  \n" +
                "	  distribucion_componente.monto,  \n" +
                "	  distribucion_componente.item,  \n" +
                "	  items.descripcion as item_descripcion,  \n" +
                "	  niveles.id as nivel, \n" +
                "	  niveles.descripcion as nivel_descripcion,  \n" +
                "	  niveles.componente,  \n" +
                "	  componentes.descripcion as componente_descripcion,  \n" +
                "	  componentes.eje,  \n" +
                "	  ejes.descripcion as eje_descripcion \n" +
                "	FROM  \n" +
                "	  presupuesto.distribucion_componente,                  	  \n" +
                "	  estructura.ejes,  \n" +
                "	  estructura.componentes,\n" +
                "	  estructura.niveles,  \n" +
                "	  estructura.items  \n" +
                "	WHERE  \n" +
                "	  ejes.eje = componentes.eje AND\n" +
                "	  componentes.componente = niveles.componente and \n" +
                "	  niveles.id = items.nivel and \n" +
                "	  niveles.id = distribucion_componente.item AND \n" +
                "	  componentes.componente = niveles.componente \n" +
                "	  and distribucion_componente.id =    "  + id;
                
                return sql ;
                
    }              


    

    
        
    
}
















