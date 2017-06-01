/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package py.gov.mec.estructura.tipo;



/**
 *
 * @author hugom_000
 */
public class TipoSQL  {
        
    
    public String  ListaSuma ()
            throws Exception {
               
                 
                
                String sql = " "+                        
                "   	SELECT \n" +
                "	tipos.tipo, \n" +
                "	tipos.descripcion, \n" +
                "\n" +
                "	sum(vigente) vigente, sum(ideal) ideal,\n" +
                "	sum(vigente) -  sum(ideal) diferencia\n" +
                "  \n" +
                "	FROM \n" +
                "	  presupuesto.anteproyecto2017, \n" +
                "	  estructura.tipos\n" +
                "	WHERE \n" +
                "	  tipos.tipo = anteproyecto2017.tp\n" +
                "	group by tipo, descripcion\n" +
                "	order by tipo   " ;
                
                return sql ;
             
    }              

    
   
    
}
















