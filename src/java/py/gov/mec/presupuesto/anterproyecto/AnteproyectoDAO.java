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
    
                resultset = statement.executeQuery(sql);     
                
                return lista.resultsetToList(resultset ) ;
             
    }          
           



    
    
    
}
