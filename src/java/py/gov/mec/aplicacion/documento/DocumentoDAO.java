/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package py.gov.mec.aplicacion.documento;

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
public class DocumentoDAO  {
        
        Conexion conexion = new Conexion();
        Statement  statement ;
        ResultSet resultset;  
        Lista lista ;
        
    
    public DocumentoDAO ( ) throws IOException  {
        conexion.conectar();
        lista = new Lista();
    }


    /*
    public Integer  UsuarioPropietario ( Integer documento )
            throws Exception {
            
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
                
                Integer doc = 0;
                
                if (resultset.next()){
                    doc = Integer.parseInt( resultset.getString("usuario").toString() );
                }
                
            //    return lista.resultsetToList(resultset ) ;
                return doc;
             
    }          
    */
    
    
    public List<Map<String, Object>>  ListaEstado (  )
            throws Exception {
            
                statement = conexion.getConexion().createStatement();         
                
                String sql = " "+                        
" SELECT 	\n" +
"	public.documentos.id, \n" +
"	public.documentos.expediente_numero, \n" +
"	public.documentos.fecha_documento, \n" +
"	public.documentos.descripcion, \n" +
"	public.direcciones.descripcion direccion_descripcion, \n" +
"	sistema.usuarios.usuario, 	\n" +
"	sistema.usuarios.cuenta, 	\n" +
"	estado,\n" +
"	documentos_movimiento_estado.descripcion estado_descripcion\n" +
"FROM \n" +
"  public.documentos, \n" +
"  public.documentos_movimiento, \n" +
"  public.direcciones,\n" +
"  public.documentos_movimiento_estado,\n" +
"  sistema.usuarios,\n" +
"  (\n" +
"	  SELECT  documento, max(id) coddoc\n" +
"	  FROM public.documentos_movimiento\n" +
"	  group by documento\n" +
"  ) as ultimo\n" +
"\n" +
"WHERE \n" +
"  documentos_movimiento.documento = documentos.id \n" +
"  AND direcciones.id = documentos.direccion\n" +
"  and documentos_movimiento_estado.id = documentos_movimiento.estado\n" +
"  and ultimo.documento = documentos.id\n" +
"  and ultimo.coddoc =  documentos_movimiento.id\n" +
"  and sistema.usuarios.usuario = public.documentos_movimiento.usuario\n" +
"order by fecha_documento desc " ;
                        
                resultset = statement.executeQuery(sql);     
                
                return lista.resultsetToList(resultset ) ;
             
    }              

    
        
    
}
















