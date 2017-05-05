

function DocumentoJson()
{


    var id = getParametroValor("id");    
    var jsonResponse = AjaxUrl( "../Documento/Linea.json?id="+id );    
 
    
    
    if (jsonResponse.toString().trim() != "[]")
    {
        
        var objetoJson = JSON.parse(jsonResponse);    
              
        var doci_id = document.getElementById('doci_id');        
        doci_id.value =  objetoJson[0].id ;

        var doci_expediente_numero = document.getElementById('doci_expediente_numero');        
        doci_expediente_numero.value =  objetoJson[0].expediente_numero ;




        var doci_fecha_documento = document.getElementById('doci_fecha_documento');        
        

        //doci_fecha_documento.value =  formatoJSONFecha( objetoJson[0].fecha_documento.toString().trim() ) ;        
        doci_fecha_documento.value =  formatoJSONFecha( objetoJson[0].fecha_documento) ;        
        //doci_fecha_documento.value =  objetoJson[0].fecha_documento;        
        
        
        
        
        var doci_direccion = document.getElementById('doci_direccion');        
        doci_direccion.value =  objetoJson[0].direccion.id ;
        
        var doci_direccion_descripcion = document.getElementById('doci_direccion_descripcion');        
        doci_direccion_descripcion.value =  objetoJson[0].direccion.descripcion ;
        
        var doci_descripcion = document.getElementById('doci_descripcion');        
        doci_descripcion.value =  objetoJson[0].descripcion ;        
       
 
    }    

    
}