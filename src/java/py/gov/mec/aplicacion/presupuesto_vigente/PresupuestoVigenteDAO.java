/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package py.gov.mec.aplicacion.presupuesto_vigente;


import java.io.IOException;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;
import java.util.Map;
import nebuleuse.ORM.Conexion;
import nebuleuse.util.Lista;

/**
 *
 * @author hugom_000
 */
public class PresupuestoVigenteDAO  {
        
        Conexion conexion = new Conexion();
        Statement  statement ;
        ResultSet resultset;  
        Lista lista ;
        
    
    public PresupuestoVigenteDAO ( ) throws IOException  {
        conexion.conectar();
        lista = new Lista();
    }
                

    
    public List<Map<String, Object>>  Lista  ( Integer tipo1, Integer tipo2, 
                Integer pg1,  Integer pg2, 
                Integer sp1,  Integer sp2,                 
                Integer py1,  Integer py2,    
                Integer obj1,  Integer obj2,    
                Integer ff1,  Integer ff2,    
                Integer of1,  Integer of2,    
                Integer dpt1,  Integer dpt2,                    
                Integer prd1,  Integer prd2
                )
            throws Exception {
            
            
                String where_tipo  = (tipo1 == tipo2 && tipo1 == 0) ? "" : "    and (tp between "+tipo1+" and " +tipo2+ ") " ;
                String where_pg  = (pg1 == pg2 && pg1 == 0) ? "" : "    and (pg between "+pg1+" and " +pg2+ ") " ;
                String where_sp  = (sp1 == sp2 && sp1 == 0) ? "" : "    and (sp between "+sp1+" and " +sp2+ ") " ;
                String where_py  = (py1 == py2 && py1 == 0) ? "" : "    and (py between "+py1+" and " +py2+ ") " ;
                String where_obj  = (obj1 == obj2 && obj1 == 0) ? "" : "    and (obj between "+obj1+" and " +obj2+ ") " ;
                String where_ff  = (ff1 == ff2 && ff1 == 0) ? "" : "    and (ff between "+ff1+" and " +ff2+ ") " ;
                String where_of  = (of1 == of2 && of1 == 0) ? "" : "    and (of between "+of1+" and " +of2+ ") " ;
                String where_dpt  = (dpt1 == dpt2 && dpt1 == 0) ? "" : "    and (dpt between "+dpt1+" and " +dpt2+ ") " ;
                String where_prd  = (prd1 == prd2 && prd1 == 0) ? "" : "    and (producto between "+prd1+" and " +prd2+ ") " ;
                
            
                statement = conexion.getConexion().createStatement();         

                
                String sql = "   "+
"                          select *,  (vigente - certificado) diferencia \n" +
"                         from \n" +
"                         ( \n" +
"				 SELECT  \n" +
"				  id, tp, pg, sp, py, obj, ff, of,  \n" +
"				  dpt, carpeta, producto, vigente,  \n" +
"				  ( \n" +
"				   CASE WHEN (certi.certificado  is null) THEN 0             \n" +
"				    ELSE certi.certificado \n" +
"				    END \n" +
"				  ) certificado \n" +
"				   \n" +
"				FROM  \n" +
"				public.presupuesto_vigente as presu left join \n" +
"				(  \n" +
"					SELECT presupuesto_id, certificado\n" +
"					FROM public.qry_certificaciones\n" +
"				\n" +
"				) as certi \n" +
"                         on ( \n" +
"                          presu.id = certi.presupuesto_id) \n" +
"                         ) as certi                         \n" +
"                         \n" +
"                            where  1 = 1  "    
                        +  where_tipo           
                        +  where_pg       
                        +  where_sp       
                        +  where_py
                        +  where_obj                                   
                        +  where_ff                                
                        +  where_of                                
                        +  where_dpt                                
                        +  where_prd                                
                        + "  "                
                        + "  Order by tp, pg, sp, py, obj, ff, dpt, producto ";
                
                resultset = statement.executeQuery(sql);     
                
                return lista.resultsetToList(resultset ) ;
             
    }          
           
    
    public List<Map<String, Object>>  ListaIngresos  ( )
            throws Exception {
            
                statement = conexion.getConexion().createStatement();         

                
                String sql = "   "+                        
"                          select *,  (vigente - certificado) diferencia \n" +
"                         from \n" +
"                         ( \n" +
"                         SELECT  \n" +
"                          id, tp, pg, sp, py,obj, ff, of,  \n" +
"                          dpt, carpeta, producto, vigente,  \n" +
"                           ( \n" +
"                        	CASE WHEN (certi.certificado  is null) THEN 0             \n" +
"                        	    ELSE certi.certificado \n" +
"                        	    END \n" +
"                           ) certificado \n" +
"                           \n" +
"                         FROM  \n" +
"                          public.presupuesto_vigente as presu  left join \n" +
"                          ( \n" +
"				SELECT presupuesto_id, certificado\n" +
"				FROM public.qry_certificaciones\n" +
"                          ) as certi \n" +
"                         on ( \n" +
"                          presu.id = certi.presupuesto_id) \n" +
"                         ) as certi                         \n" +
"                         \n" +
"                              where (obj = 834 or obj = 894) \n" +
"                        	and ( \n" +
"                        	      (tp = 1 and pg = 1) \n" +
"                        	   or (tp = 2 and pg  = 1 and sp = 3) \n" +
"                        	   or (tp = 2 and pg  = 1 and sp = 8) \n" +
"                        	   or (tp = 2 and pg  = 1 and sp = 4) \n" +
"                        	   or (tp = 2 and pg  = 1 and sp = 6) \n" +
"                        	   or (tp = 2 and pg  = 1 and sp = 7) \n" +
"                        	   or (tp = 2 and pg  = 1 and sp = 9) \n" +
"                        	   )                             \n" +
"                           Order by tp, pg, sp, obj ;";
                
                
                resultset = statement.executeQuery(sql);     
                
                return lista.resultsetToList(resultset ) ;
             
    }          
           
        
   
        public List<Map<String, Object>>  RegistroID  ( Integer registro)                
            throws Exception {
            
                statement = conexion.getConexion().createStatement();         

                
                String sql = 
                    "  SELECT id, tp, pg, sp, py, obj, ff, of, dpt, carpeta, producto, vigente\n" +
                    "  FROM public.presupuesto_vigente\n" +
                    "  where id = " + registro ;
                                
                resultset = statement.executeQuery(sql);     
                
                return lista.resultsetToList(resultset ) ;
             
    }          
            
    
    
    
}
