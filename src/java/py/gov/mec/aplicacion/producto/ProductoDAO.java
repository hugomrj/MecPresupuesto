/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package py.gov.mec.aplicacion.producto;


import java.io.IOException;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;
import java.util.Map;
import nebuleuse.ORM.Conexion;
import nebuleuse.util.Lista;

/**
 *
 * @author hugo
 */
public class ProductoDAO {
    
        Conexion conexion = new Conexion();
        Statement  statement ;
        ResultSet resultset;  
        Lista lista ;


    
    public ProductoDAO ( ) throws IOException  {
        conexion.conectar();
        lista = new Lista();
    }
        

    public List<Map<String, Object>>  ListaSuma (Integer tp, Integer pg, Integer sp, Integer py )
            throws Exception {
        
        
        statement = conexion.getConexion().createStatement();          
        
        String sql = " "+                        
                " 	SELECT \n" +
                "	  ante.tp, \n" +
                "	  ante.pg, \n" +
                "	  ante.sp, \n" +
                "	  ante.py,  \n" +
                "	ante.producto, \n" +
                "	productos.descripcion,\n" +
                "	  sum(ante.vigente ) as vigente,  \n" +
                "	  sum(ante.ideal ) as ideal,  \n" +
                "	  (sum(ante.vigente ) - sum(ante.ideal )) diferencia  \n" +                
                "	FROM \n" +
                "	  presupuesto.anteproyecto2017 ante, \n" +
                "	  public.productos\n" +
                "	WHERE \n" +
                "	  productos.producto = ante.producto\n" +
                "	  and tp = " + tp +
                "	  and pg = " + pg +
                "	  and sp = " + sp +
                "	  and py = " + py +
                "	GROUP BY ante.producto, descripcion, \n" +
                "		tp, pg, sp, py\n" +
                "	ORDER BY ante.producto " ;        
        
            resultset = statement.executeQuery(sql);     

            return lista.resultsetToList(resultset ) ;

    }             


    
        
    
}
