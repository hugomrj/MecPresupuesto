/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package py.gov.mec.sistema.permiso;




import java.io.IOException;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;
import java.util.Map;
import nebuleuse.ORM.Conexion;
import nebuleuse.util.Lista;
import py.gov.mec.sistema.usuario.Usuario;

/**
 *
 * @author hugom_000
 */

public class PermisoDAO  {
        
        Conexion conexion = new Conexion();
        Statement  statement ;
        ResultSet resultset;  
        Lista lista ;
        
    
    public PermisoDAO ( ) throws IOException  {
        conexion.conectar();
        lista = new Lista();
    }

        
        public List<Map<String, Object>>  Lista  ( Usuario u )                
            throws Exception {
                
                statement = conexion.getConexion().createStatement();         
                
                String sql = 
                " SELECT \n" +
                "  permisos.id, \n" +
                "  permisos.descripcion, \n" +
                "  permisos.path\n" +
                "FROM \n" +
                "  sistema.permisos, \n" +
                "  sistema.usuarios, \n" +
                "  sistema.usuarios_permisos\n" +
                "WHERE \n" +
                "  permisos.id = usuarios_permisos.permiso AND\n" +
                "  usuarios_permisos.usuario = usuarios.usuario\n" +
                "  and usuarios.usuario = " + u.getUsuario()   +
                "  order by permisos.id ";
                
                resultset = statement.executeQuery(sql);     
                
                return lista.resultsetToList(resultset ) ;
             
    }          
        

        

    
}
