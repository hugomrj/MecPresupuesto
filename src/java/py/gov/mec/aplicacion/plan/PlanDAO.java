/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package py.gov.mec.aplicacion.plan;


import java.io.IOException;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import nebuleuse.ORM.Conexion;
import nebuleuse.ORM.RegistroMap;
import nebuleuse.util.Lista;

/**
 *
 * @author hugom_000
 */
public class PlanDAO  {
        
        Conexion conexion = new Conexion();
        Statement  statement ;
        ResultSet resultset;  
        Lista lista ;
        
    
    public PlanDAO ( ) throws IOException  {
        conexion.conectar();
        lista = new Lista();
    }
                
        
    public List<Map<String, Object>>  ListaFiltrada  ( Integer tipo1, Integer tipo2, 
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
                        " select *,  (vigente - certificado) diferencia\n" +
                        " from\n" +
                        " (\n" +
                        " SELECT \n" +
                        "  plan.id, plan.tp, plan.pg, plan.sp, plan.py, plan.obj, plan.ff, plan.of, \n" +
                        "  plan.dpt, plan.carpeta, plan.producto, plan.vigente, \n" +
                        "   (\n" +
                        "	CASE WHEN (detalle.certificado  is null) THEN 0            \n" +
                        "	    ELSE detalle.certificado\n" +
                        "	    END\n" +
                        "   ) certificado\n" +
                        "  \n" +
                        " FROM \n" +
                        "  public.plan left join\n" +
                        "  (\n" +
                        "	SELECT plan_id, sum(certificado) certificado\n" +
                        "	FROM public.plan_detalle\n" +
                        "	group by plan_id\n" +
                        "  ) as detalle\n" +
                        " on (\n" +
                        "  plan.id = detalle.plan_id)\n" +
                        " ) as certi\n" +                        
                        "\n" 
                        +  "  where  1 = 1 "
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
                        + "  Order by tp, pg, sp, obj ";
                
                resultset = statement.executeQuery(sql);     
                
                return lista.resultsetToList(resultset ) ;
             
    }          
           

        
    public List<Map<String, Object>>  RegistroId  ( Integer codigo)
            throws Exception {
            

        
                statement = conexion.getConexion().createStatement();         


                String sql = "   "+                        
                        " select *,  (vigente - certificado) diferencia\n" +
                        " from\n" +
                        " (\n" +
                        " SELECT \n" +
                        "  plan.id, plan.tp, plan.pg, plan.sp, plan.py, plan.obj, plan.ff, plan.of, \n" +
                        "  plan.dpt, plan.carpeta, plan.producto, plan.vigente, \n" +
                        "   (\n" +
                        "	CASE WHEN (detalle.certificado  is null) THEN 0            \n" +
                        "	    ELSE detalle.certificado\n" +
                        "	    END\n" +
                        "   ) certificado\n" +
                        "  \n" +
                        " FROM \n" +
                        "  public.plan left join\n" +
                        "  (\n" +
                        "	SELECT plan_id, sum(certificado) certificado\n" +
                        "	FROM public.plan_detalle\n" +
                        "	group by plan_id\n" +
                        "  ) as detalle\n" +
                        " on (\n" +
                        "  plan.id = detalle.plan_id)\n" +
                        " ) as certi\n" +                        
                        "\n" 
                        +  "  where  id =  "
                                +  codigo   ;

                                               
                resultset = statement.executeQuery(sql);     
                
                return lista.resultsetToList(resultset ) ;
             
    }          
                
        
              
        
    public List<Map<String, Object>>  SumaPlan  ( Integer tipo1, Integer tipo2, 
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
                        " select "
                        + "sum(vigente) suma_vigente, "
                        + "sum(certificado) suma_certificado, "
                        + "sum((vigente  + certificado)) suma_diferencia  \n" +
                        " from\n" +
                        " (\n" +
                        " SELECT \n" +
                        "  plan.id, plan.tp, plan.pg, plan.sp, plan.py, plan.obj, plan.ff, plan.of, \n" +
                        "  plan.dpt, plan.carpeta, plan.producto, plan.vigente, \n" +
                        "   (\n" +
                        "	CASE WHEN (detalle.certificado  is null) THEN 0            \n" +
                        "	    ELSE detalle.certificado\n" +
                        "	    END\n" +
                        "   ) certificado\n" +
                        "  \n" +
                        " FROM \n" +
                        "  public.plan left join\n" +
                        "  (\n" +
                        "	SELECT plan_id, sum(certificado) certificado\n" +
                        "	FROM public.plan_detalle\n" +
                        "	group by plan_id\n" +
                        "  ) as detalle\n" +
                        " on (\n" +
                        "  plan.id = detalle.plan_id)\n" +
                        " ) as certi\n" +                        
                        "\n" 
                        +  "  where  1 = 1 "
                        +  where_tipo           
                        +  where_pg       
                        +  where_sp       
                        +  where_py
                        +  where_obj                                   
                        +  where_ff                                
                        +  where_of                                
                        +  where_dpt                                
                        +  where_prd                                
                        + " ";
                
                
                
                resultset = statement.executeQuery(sql);     

                
                return lista.resultsetToList(resultset ) ;
             
    }          
                
        
    public List<Map<String, Object>>  ListaIngresos  ( )
            throws Exception {
            
                statement = conexion.getConexion().createStatement();         

                
                String sql = "   "+                        
                        " select *,  (vigente - certificado) diferencia\n" +
                        " from\n" +
                        " (\n" +
                        " SELECT \n" +
                        "  plan.id, plan.tp, plan.pg, plan.sp, plan.py, plan.obj, plan.ff, plan.of, \n" +
                        "  plan.dpt, plan.carpeta, plan.producto, plan.vigente, \n" +
                        "   (\n" +
                        "	CASE WHEN (detalle.certificado  is null) THEN 0            \n" +
                        "	    ELSE detalle.certificado\n" +
                        "	    END\n" +
                        "   ) certificado\n" +
                        "  \n" +
                        " FROM \n" +
                        "  public.plan left join\n" +
                        "  (\n" +
                        "		select plan_id, sum(suma) certificado\n" +
                        "				from (\n" +
                        "				SELECT plan_id, (pf1 + pf2 + pf3 + pf4 + pf5 + pf6 + pf7 + pf8 + pf9+ pf10 + pf11 + pf12) suma\n" +
                        "				  FROM public.ingresos_certificacion\n" +
                        "				  ) a\n" +
                        "				group by plan_id " +
                        "  ) as detalle\n" +
                        " on (\n" +
                        "  plan.id = detalle.plan_id)\n" +
                        " ) as certi\n" +                        
                        "\n" 
                        +  "    where (obj = 834 or obj = 894)\n" +
                        "	and (\n" +
                        "	      (tp = 1 and pg = 1)\n" +
                        "	   or (tp = 2 and pg  = 1 and sp = 3)\n" +
                        "	   or (tp = 2 and pg  = 1 and sp = 8)\n" +
                        "	   or (tp = 2 and pg  = 1 and sp = 4)\n" +
                        "	   or (tp = 2 and pg  = 1 and sp = 6)\n" +
                        "	   or (tp = 2 and pg  = 1 and sp = 7)\n" +
                        "	   or (tp = 2 and pg  = 1 and sp = 9)\n" +
                        "	   ) "                            
                        + "  Order by tp, pg, sp, obj ";
                
                
                resultset = statement.executeQuery(sql);     
                
                return lista.resultsetToList(resultset ) ;
             
    }          
           
    
    
    
        
        
    
}
