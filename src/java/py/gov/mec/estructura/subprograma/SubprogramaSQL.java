/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package py.gov.mec.estructura.subprograma;


/**
 *
 * @author hugom_000
 */
public class SubprogramaSQL  {
        
    
    public String  ListaSuma (Integer programa)
            throws Exception {
               
                 
                
                String sql = " "+                        
                "  	SELECT \n" +
                "	  subprogramas.id, \n" +
                "	  subprogramas.tp, \n" +
                "	  subprogramas.pg, \n" +
                "	  subprogramas.sp, \n" +
                "	  subprogramas.descripcion,\n" +
                "\n" +
                "		CASE WHEN (sum(vigente) is null)  \n" +
                "		THEN 0 \n" +
                "		ELSE sum(vigente) \n" +
                "		END as vigente, \n" +
                "\n" +
                "		CASE WHEN (sum(ideal) is null)  \n" +
                "		THEN 0 \n" +
                "		ELSE sum(ideal) \n" +
                "		END as ideal, \n" +
                "\n" +
                "		CASE WHEN (sum(vigente) -  sum(ideal) is null)  \n" +
                "		THEN 0 \n" +
                "		ELSE sum(vigente) -  sum(ideal) \n" +
                "		END as diferencia \n" +
                "			 \n" +
                "	FROM \n" +
                "	  presupuesto.anteproyecto2017\n" +
                "	  left join \n" +
                "	  estructura.subprogramas on\n" +
                "	  ( \n" +
                "	  subprogramas.tp = anteproyecto2017.tp AND\n" +
                "	  subprogramas.pg = anteproyecto2017.pg AND\n" +
                "	  subprogramas.sp = anteproyecto2017.sp\n" +
                "	  )\n" +
                "	where programa = \n" + programa +
                "\n" +
                "	group by \n" +
                "	  subprogramas.id, \n" +
                "	  subprogramas.tp, \n" +
                "	  subprogramas.pg, \n" +
                "	  subprogramas.sp, \n" +
                "	  subprogramas.descripcion\n" +
                "\n" +
                "	  \n" +
                "	  " ;
                
                return sql ;
             
    }              

    
   
    
}
















