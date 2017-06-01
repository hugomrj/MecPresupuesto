/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package py.gov.mec.estructura.programa;





/**
 *
 * @author hugom_000
 */
public class ProgramaSQL  {
        
    
    public String  ListaSuma (Integer tp)
            throws Exception {
               
                 
                
                String sql = " "+                        
                "  	SELECT \n" +
                "	  programas.id, \n" +                        
                "	  programas.tp, \n" +
                "	  programas.pg, \n" +
                "	  programas.descripcion,\n" +
                "\n" +
                "		CASE WHEN (sum(vigente) is null) \n" +
                "		THEN 0\n" +
                "		ELSE sum(vigente)\n" +
                "		END as vigente,\n" +
                "\n" +
                "		CASE WHEN (sum(ideal) is null) \n" +
                "		THEN 0\n" +
                "		ELSE sum(ideal)\n" +
                "		END as ideal,\n" +
                "\n" +
                "		CASE WHEN (sum(vigente) -  sum(ideal) is null) \n" +
                "		THEN 0\n" +
                "		ELSE sum(vigente) -  sum(ideal)\n" +
                "		END as diferencia\n" +
                "\n" +
                "	 FROM \n" +
                "	  estructura.programas left join \n" +
                "	  presupuesto.anteproyecto2017 on (\n" +
                "		programas.tp = anteproyecto2017.tp AND\n" +
                "		programas.pg = anteproyecto2017.pg\n" +
                "	  )\n" +
                "	  \n" +
                "	 where programas.tp = \n" + tp +
                "	  \n" +
                "	 group by \n" +
                "		programas.id, \n" +                        
                "		programas.tp, \n" +
                "		programas.pg, \n" +
                "		programas.descripcion   " ;
                
                return sql ;
             
    }              

    
   
    
}
















