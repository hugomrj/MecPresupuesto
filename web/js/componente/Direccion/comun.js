

function DireccionJson()
{

    var id = getParametroValor("id");    
    var jsonResponse = AjaxUrl( "../Direccion/Linea.json?id="+id );    
    
    if (jsonResponse.toString().trim() != "[]")
    {
        
        var objetoJson = JSON.parse(jsonResponse);    
              
        var di_id = document.getElementById('di_id');        
        di_id.value =  objetoJson[0].id ;
        
        var di_descripcion = document.getElementById('di_descripcion');        
        di_descripcion.value = objetoJson[0].descripcion ;        
        
    }    

    
}