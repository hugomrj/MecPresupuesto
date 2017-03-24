

function CdpJson()
{

    var id = getParametroValor("id");    
    var jsonResponse = AjaxUrl( "../Cdp/Linea.json?id="+id );    
    
    if (jsonResponse.toString().trim() != "[]")
    {
        
        var objetoJson = JSON.parse(jsonResponse);    
              
        var cdpa_estructura_id = document.getElementById('cdpa_estructura_id');        
        cdpa_estructura_id.value =  objetoJson[0].estructura_id ;
        
        var cdpa_id = document.getElementById('cdpa_id');        
        cdpa_id.value =  objetoJson[0].id ;
        
        var cdpa_unr = document.getElementById('cdpa_unr');        
        cdpa_unr.value = objetoJson[0].unr ;        
        
        var cdpa_pac_numero = document.getElementById('cdpa_pac_numero');        
        cdpa_pac_numero.value = objetoJson[0].pac_numero ;        
        
        var cdpa_cc = document.getElementById('cdpa_cc');        
        cdpa_cc.value = objetoJson[0].cc ;        
        
        var cdpa_descripcion = document.getElementById('cdpa_descripcion');        
        cdpa_descripcion.value = objetoJson[0].descripcion ;        
        
        var cdpa_certificacion_actual = document.getElementById('cdpa_certificacion_actual');        
        cdpa_certificacion_actual.value = objetoJson[0].certificacion_actual ;        
        
        
        
        
        var cdpa_fecha = document.getElementById('cdpa_fecha');        

        cdpa_fecha.value = JSONtoYMD( objetoJson[0].fecha)  ;  
        
        
//alert(formatoJSONFecha(objetoJson[0].fecha))  ;
        
        
        var cdpa_cdp_numero = document.getElementById('cdpa_cdp_numero');        
        cdpa_cdp_numero.value = objetoJson[0].cdp_numero ;        
        
    }    




    
}