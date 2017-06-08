/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package py.gov.mec.estructura.proposito;





/**
 *
 * @author hugom_000
 */
public class PropositoSQL  {
        
    
    public String  Lista (Integer scom)
            throws Exception {
               
                 
                
                String sql = " "+                        
                "   SELECT id, item, descripcion\n" +
                "  FROM estructura.propositos\n" +
                "  where item = \n" + scom +
                "  order by id" ;
                 
                return sql ;
             
    }              

    
        
    
}
















