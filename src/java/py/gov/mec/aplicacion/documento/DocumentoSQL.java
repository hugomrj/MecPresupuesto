/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package py.gov.mec.aplicacion.documento;


/**
 *
 * @author hugo
 */
public class DocumentoSQL {
    
    
public String  ListaEstado ( String buscar, Integer usuario)
            throws Exception {
    
            String sql = "";
        
            String condicionBusqueda = "";
            
            if (!(buscar.equals("")))
            {

                buscar = "%"+buscar+"%";
                buscar = buscar.replaceAll(" ", "%");
            
                condicionBusqueda = " "+ 
                    "  and (\n" +
                    "   cast(expediente_numero as text) || \n" +
                    "   cast(direcciones.descripcion as text) || \n" +
                    "   cast(documentos.descripcion as text)  || \n" +                    
                    "   cast(documentos_movimiento_estado.descripcion as text)  || \n" +
                    "   cast(cuenta as text) ilike '"+buscar+"'\n" +                        
                    "   ) ";
                
            }

                
        sql = " "+                        
                "  SELECT 	 \n" +
                "	public.documentos.id,  \n" +
                "	public.documentos.expediente_numero,  \n" +
                "	public.documentos.fecha_documento,  \n" +
                "	public.documentos.descripcion,  \n" +
                "	public.direcciones.descripcion direccion_descripcion,  \n" +
                "	sistema.usuarios.usuario, 	 \n" +
                "	sistema.usuarios.cuenta, 	 \n" +
                "	estado, \n" +
                "	documentos_movimiento_estado.descripcion estado_descripcion \n" +
                " FROM  \n" +
                "  public.documentos,  \n" +
                "  public.documentos_movimiento,  \n" +
                "  public.direcciones, \n" +
                "  public.documentos_movimiento_estado, \n" +
                "  sistema.usuarios, \n" +
                "  ( \n" +
                "	  SELECT  documento, max(id) coddoc \n" +
                "	  FROM public.documentos_movimiento \n" +
                "	  group by documento \n" +
                "  ) as ultimo \n" +
                " WHERE  \n" +
                "  documentos_movimiento.documento = documentos.id  \n" +
                "  AND direcciones.id = documentos.direccion \n" +
                "  and documentos_movimiento_estado.id = documentos_movimiento.estado \n" +
                "  and ultimo.documento = documentos.id \n" +
                "  and ultimo.coddoc =  documentos_movimiento.id \n" +
                "  and sistema.usuarios.usuario = public.documentos_movimiento.usuario \n" +
                "  and sistema.usuarios.usuario  = \n" + usuario +
                "  and (documentos_movimiento.estado = 1 or documentos_movimiento.estado = 2)\n" +
                "\n" +
                " union\n" +
                "\n" +
                " select *\n" +
                " from(\n" +
                "\n" +
                "\n" +
                " SELECT 	 \n" +
                "	public.documentos.id,  \n" +
                "	public.documentos.expediente_numero,  \n" +
                "	public.documentos.fecha_documento,  \n" +
                "	public.documentos.descripcion,  \n" +
                "	public.direcciones.descripcion direccion_descripcion,  \n" +
                "	sistema.usuarios.usuario, 	 \n" +
                "	sistema.usuarios.cuenta, 	 \n" +
                "	estado, \n" +
                "	documentos_movimiento_estado.descripcion estado_descripcion \n" +
                " FROM  \n" +
                "  public.documentos,  \n" +
                "  public.documentos_movimiento,  \n" +
                "  public.direcciones, \n" +
                "  public.documentos_movimiento_estado, \n" +
                "  sistema.usuarios, \n" +
                "  ( \n" +
                "	  SELECT  documento, max(id) coddoc \n" +
                "	  FROM public.documentos_movimiento \n" +
                "	  group by documento \n" +
                "  ) as ultimo \n" +
                " \n" +
                " WHERE  \n" +
                "  documentos_movimiento.documento = documentos.id  \n" +
                "  AND direcciones.id = documentos.direccion \n" +
                "  and documentos_movimiento_estado.id = documentos_movimiento.estado \n" +
                "  and ultimo.documento = documentos.id \n" +
                "  and ultimo.coddoc =  documentos_movimiento.id \n" +
                "  and sistema.usuarios.usuario = public.documentos_movimiento.usuario   \n" +
                condicionBusqueda +
                " ) as nn\n" +
                " order by fecha_documento desc  \n" +
                "\n" +
                " " ;


                return sql ;
             
    }              




public String  ListaEstadoCount ( String buscar, Integer usuario)
            throws Exception {
    
            String sql = "";
        
            String condicionBusqueda = "";
            
            if (!(buscar.equals("")))
            {

                buscar = "%"+buscar+"%";
                buscar = buscar.replaceAll(" ", "%");
            
                condicionBusqueda = " "+ 
                    "  and (\n" +
                    "   cast(expediente_numero as text) || \n" +
                    "   cast(direcciones.descripcion as text) || \n" +
                    "   cast(documentos.descripcion as text)  || \n" +                    
                    "   cast(documentos_movimiento_estado.descripcion as text)  || \n" +
                    "   cast(cuenta as text) ilike '"+buscar+"'\n" +                        
                    "   ) ";
                
            }

                
        sql = " "+                        
                "  SELECT 	 \n" +
                "	public.documentos.id,  \n" +
                "	public.documentos.expediente_numero,  \n" +
                "	public.documentos.fecha_documento,  \n" +
                "	public.documentos.descripcion,  \n" +
                "	public.direcciones.descripcion direccion_descripcion,  \n" +
                "	sistema.usuarios.usuario, 	 \n" +
                "	sistema.usuarios.cuenta, 	 \n" +
                "	estado, \n" +
                "	documentos_movimiento_estado.descripcion estado_descripcion \n" +
                " FROM  \n" +
                "  public.documentos,  \n" +
                "  public.documentos_movimiento,  \n" +
                "  public.direcciones, \n" +
                "  public.documentos_movimiento_estado, \n" +
                "  sistema.usuarios, \n" +
                "  ( \n" +
                "	  SELECT  documento, max(id) coddoc \n" +
                "	  FROM public.documentos_movimiento \n" +
                "	  group by documento \n" +
                "  ) as ultimo \n" +
                " WHERE  \n" +
                "  documentos_movimiento.documento = documentos.id  \n" +
                "  AND direcciones.id = documentos.direccion \n" +
                "  and documentos_movimiento_estado.id = documentos_movimiento.estado \n" +
                "  and ultimo.documento = documentos.id \n" +
                "  and ultimo.coddoc =  documentos_movimiento.id \n" +
                "  and sistema.usuarios.usuario = public.documentos_movimiento.usuario \n" +
                "  and sistema.usuarios.usuario  = \n" + usuario +
                "  and (documentos_movimiento.estado = 1 or documentos_movimiento.estado = 2)\n" +
                "\n" +
                " union\n" +
                "\n" +
                " select *\n" +
                " from(\n" +
                "\n" +
                "\n" +
                " SELECT 	 \n" +
                "	public.documentos.id,  \n" +
                "	public.documentos.expediente_numero,  \n" +
                "	public.documentos.fecha_documento,  \n" +
                "	public.documentos.descripcion,  \n" +
                "	public.direcciones.descripcion direccion_descripcion,  \n" +
                "	sistema.usuarios.usuario, 	 \n" +
                "	sistema.usuarios.cuenta, 	 \n" +
                "	estado, \n" +
                "	documentos_movimiento_estado.descripcion estado_descripcion \n" +
                " FROM  \n" +
                "  public.documentos,  \n" +
                "  public.documentos_movimiento,  \n" +
                "  public.direcciones, \n" +
                "  public.documentos_movimiento_estado, \n" +
                "  sistema.usuarios, \n" +
                "  ( \n" +
                "	  SELECT  documento, max(id) coddoc \n" +
                "	  FROM public.documentos_movimiento \n" +
                "	  group by documento \n" +
                "  ) as ultimo \n" +
                " \n" +
                " WHERE  \n" +
                "  documentos_movimiento.documento = documentos.id  \n" +
                "  AND direcciones.id = documentos.direccion \n" +
                "  and documentos_movimiento_estado.id = documentos_movimiento.estado \n" +
                "  and ultimo.documento = documentos.id \n" +
                "  and ultimo.coddoc =  documentos_movimiento.id \n" +
                "  and sistema.usuarios.usuario = public.documentos_movimiento.usuario   \n" +
                condicionBusqueda +
                "  limit 30	\n" +
                " ) as nn\n" +
                " order by fecha_documento desc  \n" +
                "\n" +
                " " ;


                return sql ;
             
    }              

    
    
    
}
