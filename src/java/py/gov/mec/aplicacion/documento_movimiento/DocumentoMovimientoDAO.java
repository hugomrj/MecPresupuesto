/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package py.gov.mec.aplicacion.documento_movimiento;


import py.gov.mec.aplicacion.documento.*;


import java.io.IOException;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;
import java.util.Map;
import nebuleuse.ORM.Conexion;
import nebuleuse.util.Lista;
import py.gov.mec.aplicacion.documento_movimiento_estado.DocumentoMovimientoEstado;
import py.gov.mec.sistema.usuario.Usuario;

/**
 *
 * @author hugom_000
 */
public class DocumentoMovimientoDAO  {
        
        Conexion conexion = new Conexion();
        Statement  statement ;
        ResultSet resultset;  
        Lista lista ;
        
    
    public DocumentoMovimientoDAO ( ) throws IOException  {
        conexion.conectar();
        lista = new Lista();
    }


    public DocumentoMovimiento  UsuarioEstado ( Integer documento )
            throws Exception {
        
            DocumentoMovimiento doc = new DocumentoMovimiento();
            Usuario usuario = new Usuario();
            usuario.setUsuario(0);
            
            DocumentoMovimientoEstado estado = new DocumentoMovimientoEstado();
            estado.setId(0);
            
                    
            doc.setUsuario(usuario);
                        
                statement = conexion.getConexion().createStatement();         
                
                String sql = " "+                        
                "  SELECT \n" +
                "  documentos.id , usuario, estado \n" +
                " FROM \n" +
                "  public.documentos, \n" +
                "  public.documentos_movimiento\n" +
                " WHERE \n" +
                "  documentos_movimiento.documento = documentos.id\n" +
                "  and documento = " + documento + 
                "  order by documentos_movimiento.id desc\n" +
                " limit 1";                      
                        
                resultset = statement.executeQuery(sql);     
            
                
                
                if (resultset.next()){
                    usuario.setUsuario(Integer.parseInt( resultset.getString("usuario").toString()));                    
                    estado.setId(Integer.parseInt( resultset.getString("estado").toString()));
                }
                
                doc.setUsuario(usuario);
                doc.setEstado(estado);
                
            //    return lista.resultsetToList(resultset ) ;
                return doc;
             
    }          

    

    
        
    
}
















