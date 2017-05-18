
function AnteproyectoObjeto_TablaRegistro_registro_editar ( id  ){
    
     AnteproyectoJson(id);
         
    var antea_id = document.getElementById('antea_id') ;
    antea_id.value = id;         
    
    var proya_vigente = document.getElementById('proya_vigente') ;
    proya_vigente.disabled = true;
    
    
    var proya_ideal = document.getElementById( 'proya_ideal');
    if (proya_ideal.value == ""){
        proya_ideal.value = 0;
    }
    proya_ideal.onblur  = function() {
        zero( 'proya_ideal');        
        proya_ideal.value = formatoNumero_p(proya_ideal.value);                      
    };
    proya_ideal.setSelectionRange(0, proya_ideal.value.length);
    //proya_ideal.focus();
    
    
    
    var antee_aceptar = document.getElementById('antee_aceptar');
    antee_aceptar.addEventListener('click',
        function() {

                if (AnteproyectoObjeto_TablaRegistro_registro_validacion()){

                    //var pafeje_uoc_id = document.getElementById('pafeje_uoc_id');
                    //pafeje_uoc_id.value = registro;

                    var form = document.getElementById("antee_form");            
                    var accion =  form.getAttribute('action') ;                                       
                    var control = AjaxPeticionURL( accion, getDataForm(form) );      
                    
                    if (control == null){    
                        AnteproyectoObjeto_funcionalidad();
                        antee_cerrar.click();
                    }
                    else{                    
                        alerta_error(control);
                    }  
                }  
        },
        false
    );    
    
    
    
    
    
    
    var antee_cerrar = document.getElementById('antee_cerrar');
    antee_cerrar.addEventListener('click',
        function() {    
            javascript:ocultarVentana('capa_oscura');
            javascript:ocultarVentana('capa_clara');
        },
        false
    );       
    
    
    
    
    
}



function AnteproyectoJson(id)
{
  
    var jsonResponse = AjaxUrl( "../../Anteproyecto/Linea.json?id="+id );    
    
    if (jsonResponse.toString().trim() != "[]")
    {        
        var objetoJson = JSON.parse(jsonResponse);    
            
        var proya_vigente = document.getElementById('proya_vigente');        
        proya_vigente.value =  formatoNumero_p(objetoJson[0].vigente);                      
  
        var proya_ideal = document.getElementById('proya_ideal');        
        proya_ideal.value =  formatoNumero_p(objetoJson[0].ideal);      
        
        
    }    

    
}


function AnteproyectoObjeto_TablaRegistro_registro_validacion(){
    
    return true;
}