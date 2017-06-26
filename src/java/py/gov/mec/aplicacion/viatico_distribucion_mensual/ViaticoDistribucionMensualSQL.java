/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package py.gov.mec.aplicacion.viatico_distribucion_mensual;


/**
 *
 * @author hugom_000
 */
public class ViaticoDistribucionMensualSQL  {
        
    
    public String  ListaMes (Integer mes)
            throws Exception {
               
                 
                
        String sql = " "+                        
            "          SELECT  \n" +
            "          viatico_ditribucion_mensual.id,  \n" +
            "          viatico_ditribucion_mensual.direccion,  \n" +
            "          viatico_ditribucion_mensual.mes,  \n" +
            "          viatico_ditribucion_mensual.monto,  \n" +
            "          direcciones.descripcion ,\n" +
            "\n" +
            "\n" +
            "	CASE WHEN (sum_certificaciones is null)   \n" +
            "		THEN 0  \n" +
            "		ELSE sum_certificaciones  \n" +
            "		END as certificado,\n" +
            "\n" +
            "	CASE WHEN (sum_certificaciones is null)   \n" +
            "		THEN 0  \n" +
            "		ELSE (monto - sum_certificaciones) \n" +
            "		END as diferencia		\n" +
            "\n" +
            "	   \n" +
            "        FROM  \n" +
            "          public.direcciones,\n" +
            "          public.viatico_ditribucion_mensual\n" +
            "          left join \n" +
            "          (\n" +
            "\n" +
            "		SELECT \n" +
            "		  viatico_certificacion_numeracion.mes, \n" +
            "		  viatico_certificacion.direccion,\n" +
            "		  sum(viatico_certificacion.monto_certificacion) sum_certificaciones\n" +
            "		FROM \n" +
            "		  public.viatico_certificacion, \n" +
            "		  public.viatico_certificacion_numeracion\n" +
            "		WHERE \n" +
            "		  viatico_certificacion_numeracion.id = viatico_certificacion.certificacion_numeracion\n" +
            "		  and mes = \n" +  mes +
            "		  group by \n" +
            "			viatico_certificacion_numeracion.mes, \n" +
            "			viatico_certificacion.direccion\n" +
            "\n" +
            "          ) as t on ( (viatico_ditribucion_mensual.mes = t.mes) \n" +
            "			and viatico_ditribucion_mensual.direccion = t.direccion )\n" +
            "\n" +
            "          \n" +
            "        WHERE  \n" +
            "          direcciones.id = viatico_ditribucion_mensual.direccion \n" +
            "          and viatico_ditribucion_mensual.mes  =   \n" + mes +
            "          order by viatico_ditribucion_mensual.id ;" ;

        
        
        return sql ;
             
    }              

    
   
    
}
















