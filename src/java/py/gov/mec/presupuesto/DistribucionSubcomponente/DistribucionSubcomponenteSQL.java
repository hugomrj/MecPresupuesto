
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


package py.gov.mec.presupuesto.DistribucionSubcomponente;

/**
 *
 * @author hugom_000
 */
public class DistribucionSubcomponenteSQL  {
        
    
    public String  Lista ( Integer presupuesto)
            throws Exception {
                               
                
                String sql = " "+                        
                "  SELECT \n" +
                "  distribucion_subcomponente.id, \n" +
                "  presupuesto, \n" +
                "  subcomponente, \n" +
                "  monto, \n" +
                "  subcomponentes.descripcion\n" +
                " FROM \n" +
                "  presupuesto.distribucion_subcomponente, \n" +
                "  estructura.subcomponentes\n" +
                " WHERE \n" +
                "  subcomponentes.id = distribucion_subcomponente.subcomponente\n" +
                "  and presupuesto = \n" + presupuesto +
                "  order by id\n" +
                "     " ;
                
                return sql ;
                
    }              


    public String  PresupuestoSuma ( Integer presupuesto)
            throws Exception {
                               
                
                String sql = " "+                        
                "  SELECT sum(monto) sumamonto\n" +
                "  FROM presupuesto.distribucion_subcomponente\n" +
                "  where presupuesto = \n" +  presupuesto +              
                "     " ;
                
                return sql ;
                
    }              




    public String  LineaCompleta ( Integer id)
            throws Exception {
                               
                
                String sql = " "+                        
                "	SELECT \n" +
                "	  distribucion_subcomponente.id, \n" +
                "	  distribucion_subcomponente.presupuesto, \n" +
                "	  distribucion_subcomponente.monto, \n" +
                "	  distribucion_subcomponente.subcomponente, \n" +
                "	  subcomponentes.descripcion as subcomponente_descripcion, \n" +
                "	  subcomponentes.componente, \n" +
                "	  componentes.descripcion as componente_descripcion, \n" +
                "	  componentes.eje, \n" +
                "	  ejes.descripcion as eje_descripcion\n" +
                "	FROM \n" +
                "	  presupuesto.distribucion_subcomponente, \n" +
                "	  estructura.ejes, \n" +
                "	  estructura.subcomponentes, \n" +
                "	  estructura.componentes\n" +
                "	WHERE \n" +
                "	  ejes.eje = componentes.eje AND\n" +
                "	  subcomponentes.id = distribucion_subcomponente.subcomponente AND\n" +
                "	  componentes.componente = subcomponentes.componente\n" +
                "	  and distribucion_subcomponente.id = "  + id;
                
                return sql ;
                
    }              


    

    
        
    
}
















