/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package py.gov.mec.estructura.subcomponente;





/**
 *
 * @author hugom_000
 */
public class SubcomponenteSQL  {
        
    
    public String  Lista (Integer com)
            throws Exception {
               
                 
                
                String sql = " "+                        
                "   SELECT id, componente, descripcion\n" +
                "  FROM estructura.subcomponentes\n" +
                "  where componente = \n" + com +
                "  order by id" ;
                 
                return sql ;
             
    }              

    
    public String  PresupuestoLista (Integer com)
            throws Exception {
               
                 
                
                String sql = " "+                        
                "   	SELECT \n" +
                "	  subcomponentes.id, \n" +
                "	  subcomponentes.componente, 	  \n" +
                "	  subcomponentes.descripcion, \n" +
                "		CASE WHEN (sum(distribucion_subcomponente.monto) is null) \n" +
                "		THEN 0\n" +
                "		ELSE sum(distribucion_subcomponente.monto)\n" +
                "		END as ideal	  \n" +
                "	FROM \n" +
                "\n" +
                "	  estructura.subcomponentes\n" +
                "	  left join\n" +
                "	  presupuesto.distribucion_subcomponente\n" +
                "	  on (subcomponentes.id = distribucion_subcomponente.subcomponente)  \n" +
                "	  where subcomponentes.componente = \n" + com +
                "	  group by  subcomponentes.id, subcomponentes.componente, subcomponentes.descripcion\n" +
                "	  order by subcomponentes.id\n" +
                "	  " ;
                 
                return sql ;
             
    }              
    
    
    
    
        public String  RegistroId (Integer id)
            throws Exception {
               
                 
                
                String sql = " " +
                "	SELECT \n" +
                "	  subcomponentes.id, \n" +
                "	  subcomponentes.descripcion, \n" +
                "	  ejes.eje, \n" +
                "	  ejes.descripcion eje_descripcion, \n" +
                "	  componentes.descripcion componente_descripcion, \n" +
                "	  componentes.componente\n" +
                "	FROM \n" +
                "	  estructura.subcomponentes, \n" +
                "	  estructura.componentes, \n" +
                "	  estructura.ejes\n" +
                "	WHERE \n" +
                "	  componentes.componente = subcomponentes.componente AND\n" +
                "	  ejes.eje = componentes.eje\n" +
                "	  and id = " + id ;

                 
                return sql ;
             
    }       
    
        
    
}
















