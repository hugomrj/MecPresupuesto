/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package py.gov.mec.estructura.proyecto;

/**
 *
 * @author hugom_000
 */
public class ProyectoSQL  {
        
    
    public String  ListaSuma (Integer subprogrma)
            throws Exception {
               
                 
                
                String sql = " "+                        
                "  	SELECT \n" +
                "	  proyectos.id, \n" +
                "	  proyectos.tp, \n" +
                "	  proyectos.pg, \n" +
                "	  proyectos.sp, \n" +
                "	  proyectos.py, \n" +
                "	  proyectos.descripcion, \n" +
                "\n" +
                "			CASE WHEN (sum(vigente) is null)  \n" +
                "			THEN 0 \n" +
                "			ELSE sum(vigente) \n" +
                "			END as vigente, \n" +
                "\n" +
                "			CASE WHEN (sum(ideal) is null)  \n" +
                "			THEN 0 \n" +
                "			ELSE sum(ideal) \n" +
                "			END as ideal, \n" +
                "\n" +
                "			CASE WHEN (sum(vigente) -  sum(ideal) is null)  \n" +
                "			THEN 0 \n" +
                "			ELSE sum(vigente) -  sum(ideal) \n" +
                "			END as diferencia \n" +
                "	  \n" +
                "	FROM \n" +
                "	  presupuesto.anteproyecto2017\n" +
                "	  left join \n" +
                "	  estructura.proyectos\n" +
                "	on (\n" +
                "	  proyectos.tp = anteproyecto2017.tp AND\n" +
                "	  proyectos.pg = anteproyecto2017.pg AND\n" +
                "	  proyectos.sp = anteproyecto2017.sp AND\n" +
                "	  proyectos.py = anteproyecto2017.py)\n" +
                "	  where subprograma = \n" +  subprogrma +
                "\n" +
                "	  group by \n" +
                "		proyectos.id, \n" +
                "		proyectos.tp, \n" +
                "		proyectos.pg, \n" +
                "		proyectos.sp, \n" +
                "		proyectos.py, \n" +
                "		proyectos.descripcion\n" +
                "\n" +
                "		" ;
                
                return sql ;
             
    }              

    
   
    
}
















