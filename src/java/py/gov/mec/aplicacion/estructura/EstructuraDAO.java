/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package py.gov.mec.aplicacion.estructura;


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
public class EstructuraDAO  {
        
        Conexion conexion = new Conexion();
        Statement  statement ;
        ResultSet resultset;  
        Lista lista ;
        
    
    public EstructuraDAO ( ) throws IOException  {
        conexion.conectar();
        lista = new Lista();
    }
                

    
    public List<Map<String, Object>>  Lista  ( Integer tipo1,  
                Integer pg1,  
                Integer sp1,  
                Integer py1,  
                Integer obj1, 
                Integer ff1,  
                Integer of1, 
                Integer dpt1,
                Integer prd1
                )
            throws Exception {
            
            
                String where_tipo  = (tipo1 == 0) ? "" : "  and tp = " + tipo1 ;
                String where_pg  = (pg1 == 0) ? "" : "  and pg = " + pg1 ;
                String where_sp  = (sp1 == 0) ? "" : "  and sp = " + sp1 ;
                String where_py  = (py1 == 0) ? "" : "  and py = " + py1 ;
                String where_obj  = (obj1 == 0) ? "" : "  and obj = " + obj1 ;
                String where_ff  = (ff1 == 0) ? "" : "  and ff = " + ff1 ;
                String where_of  = (of1 == 0) ? "" : "  and of = " + of1 ;
                String where_dpt  = (dpt1 == 0) ? "" : "  and dpt = " + dpt1 ;
                
                statement = conexion.getConexion().createStatement();         

                
                String sql = "   " +
                    " SELECT id, tp, pg, sp, py, obj, ff, of, dpt\n" +
                    "  FROM public.estructura\n" +
                    "  where 1 = 1  " 
                    +  where_tipo           
                    +  where_pg       
                    +  where_sp       
                    +  where_py
                    +  where_obj                                   
                    +  where_ff                                
                    +  where_of                                
                    +  where_dpt                                
                    + "  "                
                    + "  order by tp, pg, sp, py, obj, ff, of, dpt ";
                
                resultset = statement.executeQuery(sql);     
                
                return lista.resultsetToList(resultset ) ;
             
    }          
           
    

   
        public List<Map<String, Object>>  RegistroID  ( Integer registro)                
            throws Exception {
            
                statement = conexion.getConexion().createStatement();         
                
                String sql = 
                    "  SELECT id, tp, pg, sp, py, obj, ff, of, dpt\n" +
                    "  FROM public.estructura\n" +
                    "  where id = " + registro ;
                                
                resultset = statement.executeQuery(sql);     
                
                return lista.resultsetToList(resultset ) ;
             
    }          
            
    
    public List<Map<String, Object>>  Cabecera (Integer tp)
            throws Exception {
        
        statement = conexion.getConexion().createStatement();         
        String sql = "";
        
            if (tp == null)
            {
                tp = 0;
            }                            
                sql = " "+                        
                    "  	SELECT 1 as orden, 'Tipo' as titulo, tipo cod, descripcion \n" +
                    "	FROM estructura.tipos \n" +
                    "	WHERE tipo =  " + tp ;
                
                resultset = statement.executeQuery(sql);                     
                return lista.resultsetToList(resultset ) ;
             
    }             
            

    public List<Map<String, Object>>  Cabecera (Integer tp, Integer pg)
            throws Exception {
        
        statement = conexion.getConexion().createStatement();         
        String sql = "";
        
            if (tp == null)
            {
                tp = 0;
            }                            
                sql = " "+                        
                    "  	SELECT 1 as orden, 'Tipo' as titulo, tipo cod, descripcion \n" +
                    "	FROM estructura.tipos \n" +
                    "	WHERE tipo =  " + tp  +
                    "  	union\n" +
                    "	SELECT 2 as orden, 'Programa' as titulo, pg as cod, descripcion\n" +
                    "	FROM estructura.programas\n" +
                    "	where tp = \n" + tp  +
                    "	and pg = \n" + pg  +
                    "	order by orden"; 
                
                resultset = statement.executeQuery(sql);                     
                return lista.resultsetToList(resultset ) ;
             
    }             
                


    public List<Map<String, Object>>  Cabecera (Integer tp, Integer pg, Integer sp)
            throws Exception {
        
        statement = conexion.getConexion().createStatement();         
        String sql = "";
        
            if (tp == null)
            {
                tp = 0;
            }                            
                sql = " "+                        
                    "  	SELECT 1 as orden, 'Tipo' as titulo, tipo cod, descripcion \n" +
                    "	FROM estructura.tipos \n" +
                    "	WHERE tipo =  " + tp  +
                    "  	union\n" +
                    "	SELECT 2 as orden, 'Programa' as titulo, pg as cod, descripcion\n" +
                    "	FROM estructura.programas\n" +
                    "	where tp = \n" + tp  +
                    "	and pg = \n" + pg  +
                    "            union\n" +
                    "	SELECT 3 as orden, 'Sub programa' as titulo, sp as cod, descripcion\n" +
                    "	FROM estructura.subprogramas\n" +
                    "	where tp = \n" + tp  +
                    "	and pg = \n" + pg  +
                    "	and sp = \n" + sp +
                    "	order by orden\n" +
                    "                   "; 
                
                resultset = statement.executeQuery(sql);                     
                return lista.resultsetToList(resultset ) ;
             
    }    
    
    
    
    
    public List<Map<String, Object>>  Cabecera (Integer tp, Integer pg, Integer sp, Integer py)
            throws Exception {
        
        statement = conexion.getConexion().createStatement();         
        String sql = "";
        
            if (tp == null)
            {
                tp = 0;
            }              
            
            sql = " "+                        
                "  	SELECT 1 as orden, 'Tipo' as titulo, tipo cod, descripcion \n" +
                "	FROM estructura.tipos \n" +
                "	WHERE tipo =  " + tp  +
                "  	union\n" +
                "	SELECT 2 as orden, 'Programa' as titulo, pg as cod, descripcion\n" +
                "	FROM estructura.programas\n" +
                "	where tp = \n" + tp  +
                "	and pg = \n" + pg  +
                "            union\n" +
                "	SELECT 3 as orden, 'Sub programa' as titulo, sp as cod, descripcion\n" +
                "	FROM estructura.subprogramas\n" +
                "	where tp = \n" + tp  +
                "	and pg = \n" + pg  +
                "	and sp = \n" + sp +
                "	union\n" +
                "	SELECT  4 as orden, 'Proyecto' as titulo, py as cod, descripcion\n" +
                "	FROM estructura.proyectos\n" +
                "	where tp = \n" + tp  +
                "	and pg = \n" + pg  +
                "	and sp = \n" + sp  +
                "	and py = \n" + py  +
                "	order by orden" +
                "                   "; 
                
                resultset = statement.executeQuery(sql);                     
                return lista.resultsetToList(resultset ) ;
             
    }             
               
    public List<Map<String, Object>>  Cabecera (Integer tp, Integer pg, Integer sp, Integer py,
            Integer pr )
            throws Exception {
        
        statement = conexion.getConexion().createStatement();         
        String sql = "";
        
            if (tp == null)
            {
                tp = 0;
            }              
            
            sql = " "+                        
                "  	SELECT 1 as orden, 'Tipo' as titulo, tipo cod, descripcion \n" +
                "	FROM estructura.tipos \n" +
                "	WHERE tipo =  " + tp  +
                "  	union\n" +
                "	SELECT 2 as orden, 'Programa' as titulo, pg as cod, descripcion\n" +
                "	FROM estructura.programas\n" +
                "	where tp = \n" + tp  +
                "	and pg = \n" + pg  +
                "            union\n" +
                "	SELECT 3 as orden, 'Sub programa' as titulo, sp as cod, descripcion\n" +
                "	FROM estructura.subprogramas\n" +
                "	where tp = \n" + tp  +
                "	and pg = \n" + pg  +
                "	and sp = \n" + sp +
                "	union\n" +
                "	SELECT  4 as orden, 'Proyecto' as titulo, py as cod, descripcion\n" +
                "	FROM estructura.proyectos\n" +
                "	where tp = \n" + tp  +
                "	and pg = \n" + pg  +
                "	and sp = \n" + sp  +
                "	and py = \n" + py  +
                "	union\n" +
                "           SELECT 5 as orden, 'Producto' as titulo, producto as cod, descripcion\n" +
                "           FROM public.productos\n" +
                "           where producto  = \n" + pr +
                "           order by orden \n" +
                "           ;"; 
                
                resultset = statement.executeQuery(sql);                     
                return lista.resultsetToList(resultset ) ;
             
    }             
               
    
    
}

