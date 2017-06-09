/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package py.gov.mec.presupuesto.anterproyecto;

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
public class AnteproyectoDAO  {
        
        Conexion conexion = new Conexion();
        Statement  statement ;
        ResultSet resultset;  
        Lista lista ;
        
    
    public AnteproyectoDAO ( ) throws IOException  {
        conexion.conectar();
        lista = new Lista();
    }
                

    
    public List<Map<String, Object>>  ObjetoLista  ( Integer tp, Integer pg, Integer sp,
            Integer py, Integer pr
                )
            throws Exception {
            
                statement = conexion.getConexion().createStatement();         

/*                
                String sql = "   " +                        
                "	SELECT \n" +
                "	  id, tp, pg, sp, py, ante.obj, \n" +
                "	  ff, of, dpt, producto, objetos.descripcion,\n" +
                "	  vigente, ideal , \n" +
                "	  (vigente - ideal ) diferencia \n" +
                "	FROM \n" +
                "	  presupuesto.anteproyecto2017 ante, \n" +
                "	  public.objetos\n" +
                "	WHERE \n" +
                "	  objetos.obj = ante.obj\n" +
                "	  and tp = " + tp +
                "	  and pg = " + pg +
                "	  and sp = " + sp +
                "	  and py = " + py +
                "	  and producto = " +pr +
                "	ORDER BY \n" +
                "	 tp, pg, sp, py, ante.obj, \n" +
                "	 ff, of, dpt, producto\n" +
                "	  ";
   */ 
                
                

                String sql = "   " +                        
                "    SELECT  \n" +
                "      id, tp, pg, sp, py, ante.obj,  \n" +
                "      ff, of, dpt, producto, objetos.descripcion, \n" +
                "      vigente, ideal ,  \n" +
                "      (vigente - ideal ) diferencia ,\n" +                        
                "             CASE\n" +
                "              WHEN (ideal = 0) THEN '0' \n" +
                "              WHEN (sumaitem is null) THEN '11' \n" +
                "              ELSE (ideal - sumaitem)\n" +
                "             END AS marca              	  \n" +
                "\n" +
                "    FROM  \n" +
                "            public.objetos, \n" +
                "            presupuesto.anteproyecto2017 ante\n" +
                "            left join \n" +
                "            (\n" +
                "                    SELECT presupuesto, sum(monto) sumaitem\n" +
                "                      FROM presupuesto.distribucion_componente\n" +
                "                      group by presupuesto\n" +
                "            ) as t on (ante.id = t.presupuesto)\n" +
                "    WHERE  \n" +
                "      objetos.obj = ante.obj \n" +
                "      and tp =    \n" + tp +
                "      and pg =   \n" + pg +
                "      and sp =   \n" + sp +
                "      and py =   \n" + py +
                "          and producto = " +pr +                        
                "    ORDER BY  \n" +
                "     tp, pg, sp, py, ante.obj,  \n" +
                "     ff, of, dpt, producto \n" +
                "	";
   
                              
                
                
                
                
                
                resultset = statement.executeQuery(sql);     
                
                return lista.resultsetToList(resultset ) ;
             
    }          
           



    public List<Map<String, Object>>  ObjetoProductoLista  ( Integer tp, Integer pg, Integer sp,
            Integer py)
            throws Exception {
            
                statement = conexion.getConexion().createStatement();         

             
                String sql = "   " +                        
                "	SELECT  tp, pg, sp, py, presu.obj, ff, of, presu.producto, \n" +
                "		productos.descripcion productos,\n" +
                "		objetos.descripcion objetos,\n" +
                "		sum(vigente) vigente, sum(ideal) ideal,\n" +
                "		sum(vigente) -  sum(ideal) diferencia\n" +
                "	FROM presupuesto.anteproyecto2017 presu\n" +
                "	  inner join public.productos on \n" +
                "	  (presu.producto = productos.producto)\n" +
                "	  left join objetos on \n" +
                "	  (presu.obj = objetos.obj)\n" +
                "	WHERE tp = \n" + tp +
                "	and pg = \n" + pg +
                "	and sp = \n" + sp +
                "	and py = \n" + py +
                "	group by  tp, pg, sp, py, presu.obj, ff, of, presu.producto, productos.descripcion, objetos.descripcion\n" +
                "	order by  tp, pg, sp, py, presu.obj, ff, of, presu.producto\n" +
                " ";


  
                

                
                
                resultset = statement.executeQuery(sql);     
                
                return lista.resultsetToList(resultset ) ;
             
    }          
           
    
    
    
    
    
}
