
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package py.gov.mec.aplicacion.objeto;



/**
 *
 * @author hugom_000
 */


public class ObjetoSQL  {
        

    
        public String  RegistroId (Integer id)
            throws Exception {
               
                String sql = " " +
                "   SELECT obj, descripcion\n" +
                "  FROM public.objetos\n" +
                "  where obj =  " + id ;
  
                return sql ;
             
    }       
        

        
    
}
















