

/*
function validar_form(prefijo)
{

    var cedula = document.getElementById( prefijo+"cedula") ;
    if ((cedula.value.trim()=='') || (cedula.value.trim()=='0'))
    {
        alerta_error('Error en valor de numero de cedula');
        cedula.focus();
        return false;
    }

    var nombre = document.getElementById( prefijo+"nombres") ;
    if ((nombre.value.trim()==''))
    {
        alerta_error('Error en valor de numero de cedula');
        nombre.focus();
        return false;
    }

    return true;

}
*/

function PersonaJson()
{

    var id = getParametroValor("id");    
    var jsonResponse = AjaxUrl( "../Persona/Linea.json?id="+id );    
    
    if (jsonResponse.toString().trim() != "[]")
    {
        
        var objetoJson = JSON.parse(jsonResponse);    
              
        var pe_persona = document.getElementById('pe_persona');        
        pe_persona.value =  objetoJson[0].persona ;
        
        var pe_cedula = document.getElementById('pe_cedula');        
        pe_cedula.value = objetoJson[0].cedula ;        
        
        var pe_nombres = document.getElementById('pe_nombres');        
        pe_nombres.value = objetoJson[0].nombres ;        
        
    }    

    
}