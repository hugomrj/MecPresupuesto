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
import nebuleuse.ORM.xml.Global;
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
        Integer lineas = Integer.parseInt(new Global().getValue("lineasLista"));
        public Integer totalRegistros = 0;
        
    
    public DocumentoDAO ( ) throws IOException  {
        conexion.conectar();
        lista = new Lista();
    }

    
    public List<Map<String, Object>>  ListaEstado ( String buscar, Integer usuario, Integer page)
            throws Exception {
    
        
            this.lineas = 10;
        
            
            
            page = (page==0) ? 1 : page;
        
            page = (lineas * page) - lineas ;        
            String limite_offset = "  limit " + lineas + " "+ 
                    " offset " + page  ;
            
               statement = conexion.getConexion().createStatement();  
               DocumentoSQL documentoSQL = new DocumentoSQL();
               String sql = documentoSQL.ListaEstado(buscar, usuario);

               
               
               String sqlCount = " select count(*) as rows from ( "
                       + sql 
                       + " ) as C ";
               
                resultset = statement.executeQuery(sqlCount);                 
                if (resultset.next()){
                    this.totalRegistros =  Integer.parseInt(resultset.getString(1));
                }
                
                
                
                sql = sql + limite_offset ;
                resultset = statement.executeQuery(sql);     
                
                return lista.resultsetToList(resultset ) ;
             
    }              
    
}
















