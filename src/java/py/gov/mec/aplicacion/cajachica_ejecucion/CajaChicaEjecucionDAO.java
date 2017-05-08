/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package py.gov.mec.aplicacion.cajachica_ejecucion;

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
public class CajaChicaEjecucionDAO  {
        
        Conexion conexion = new Conexion();
        Statement  statement ;
        ResultSet resultset;  
        Lista lista ;
        
    
    public CajaChicaEjecucionDAO ( ) throws IOException  {
        conexion.conectar();
        lista = new Lista();
    }




    
    
    public List<Map<String, Object>>  Registro  ( Integer idregistro)                
        throws Exception {

            statement = conexion.getConexion().createStatement();    
            String sql = 
            "                   SELECT id, uoc_id, ej1, ej2, ej3, ej4, ej5, ej6, ej7, ej8, ej9,  \n" +
            "                       ej10, ej11, ej12,  \n" +
            "                      (ej1+ej2+ej3+ej4+ej5+ej6+ej7+ej8+ej9+ej10+ej11+ej12) as suma \n" +
            "                  FROM public.cajachica_ejecucion \n" +
            "                  where uoc_id =   " + idregistro +
            " ";
              
            resultset = statement.executeQuery(sql);     

            return lista.resultsetToList(resultset ) ;

    }             



    public boolean  isRegistroExiste  ( Integer idregistro)                    
            throws Exception {
                            
                statement = conexion.getConexion().createStatement();         
                String sql = 
                    "  SELECT id, uoc_id, ej1, ej2, ej3, ej4, ej5, ej6, ej7, ej8, ej9, \n" +
                    "       ej10, ej11, ej12\n" +
                    "  FROM public.cajachica_ejecucion\n" +
                    "  where uoc_id = " + idregistro +
                    " ";
                
                resultset = statement.executeQuery(sql);     

                if(resultset.next()) 
                {    
                    return true;          
                }
                else{
                    return false;
                }                
             
    }           
    
    
    public List<Map<String, Object>>  SaldoMesAnterior  ( Integer registro, Integer mes)                
        throws Exception {

        
        if (mes >= 1 &&  mes <= 12)
        {
            String sql = "";
            statement = conexion.getConexion().createStatement();    
            
            if (mes != 1)
            {
                mes = mes - 1;
                
                sql = 
                    " SELECT  \n" +
                    " cajachica_distribucion.uoc_id , \n" +
                    " pf"+mes+" , ej"+mes+" ,\n" +
                    "  CASE\n" +
                    "   WHEN (ej"+mes+" IS NULL) THEN pf"+mes+"\n" +
                    "   else (pf"+mes+" - ej"+mes+")\n" +
                    "  END AS saldo_anterior\n" +
                    " \n" +
                    "   FROM cajachica_distribucion left join cajachica_ejecucion\n" +
                    "   on (cajachica_distribucion.uoc_id = cajachica_ejecucion.uoc_id )\n" +
                    "   where cajachica_distribucion.uoc_id =  " + registro ;                
            }                
            else
            {
                sql =  
                    "        SELECT  \n" +
                    "    cajachica_distribucion.uoc_id , \n" +
                    "    pf1, 0 as ej1, 0 as saldo_anterior\n" +
                    "      FROM cajachica_distribucion \n" +
                    "      where cajachica_distribucion.uoc_id = " + registro ;   

            }


            resultset = statement.executeQuery(sql);     
            return lista.resultsetToList(resultset) ;                    
            
        }
        else
        {
            return null;        
        }
        
    }              
    
    

    public Long  getSaldoMesAnterior  ( Integer registro, Integer mes) 
            throws Exception {
    
        Long retornar = 0L;        
        List<Map<String, Object>> list =  this.SaldoMesAnterior(registro, mes);
        
        for (Map<String, Object> map : list) {
            for (Map.Entry<String, Object> entry : map.entrySet()) 
            {
                if (entry.getKey().trim().equals("saldo_anterior") )
                {
                    retornar = Long.parseLong( entry.getValue().toString() );
                    //retornar = 0L;
                }
            }
        }
        return retornar;
    }    
    
    
    
}


