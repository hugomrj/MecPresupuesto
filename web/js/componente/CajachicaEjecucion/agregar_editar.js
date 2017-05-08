
function Cajachica_ejecucion_agregar_editar ( registro ){

    Cajachica_ejecucion_agregar_editar_json ( registro );
    Cajachica_ejecucion_agregar_editar_campos_interaccion();

    var pafeje_aceptar = document.getElementById('pafeje_aceptar');
    pafeje_aceptar.addEventListener('click',
        function() {

                if (Cajachica_ejecucion_agregar_editar_validacion()){

                    var pafeje_uoc_id = document.getElementById('pafeje_uoc_id');
                    pafeje_uoc_id.value = registro;

                    var form = document.getElementById("pafeje_form");            
                    var accion =  form.getAttribute('action') ; 
                                      
                    var control = AjaxPeticionURL( accion, getDataForm(form) );      
                    
                    if (control == null){    
                        Ejecucion_meses_valores () ;            
                        pafeje_cerrar.click();
                    }
                    else{                    
                        alerta_error(control);
                    }  
                }  
        },
        false
    );
    
   
    var pafeje_cerrar = document.getElementById('pafeje_cerrar');
    pafeje_cerrar.addEventListener('click',
        function() {    
            javascript:ocultarVentana('capa_oscura');
            javascript:ocultarVentana('capa_clara');
        },
        false
    );           
    
//    PlanFinanciero_agregar_sumar_formulario (  );

};



function Cajachica_ejecucion_agregar_editar_validacion (  ){

    var suma = 0;
    //suma = PlanFinanciero_suma();    
    return true;
    
}







function Cajachica_ejecucion_agregar_editar_campos_interaccion ( )
{
    
    var mes1 = document.getElementById( 'pafeje_ej1');
    if (mes1.value == ""){
        mes1.value = 0;
    }
    mes1.onblur  = function() {
        zero( 'pafeje_ej1');        
        mes1.value = formatoNumero_p(mes1.value);                      
    };

    
    var mes2 = document.getElementById( 'pafeje_ej2');
    if (mes2.value == ""){
        mes2.value = 0;
    }
    mes2.onblur  = function() {
        zero( 'pafeje_ej2');
        mes2.value = formatoNumero_p(mes2.value);                      
    };
    
    
    var mes3 = document.getElementById( 'pafeje_ej3');
    if (mes3.value == ""){
        mes3.value = 0;        
    }
    mes3.onblur  = function() {
        zero( 'pafeje_ej3');
        mes3.value = formatoNumero_p(mes3.value);        
    };
    
    var mes4 = document.getElementById( 'pafeje_ej4');
    if (mes4.value == ""){
        mes4.value = 0;
    }
    mes4.onblur  = function() {
        zero( 'pafeje_ej4');
        mes4.value = formatoNumero_p(mes4.value);        
    };
    

    var mes5 = document.getElementById( 'pafeje_ej5');
    if (mes5.value == ""){
        mes5.value = 0;
    }
    mes5.onblur  = function() {
        zero( 'pafeje_ej5');
        mes5.value = formatoNumero_p(mes5.value);
    };
    
    var mes6 = document.getElementById( 'pafeje_ej6');
    if (mes6.value == ""){
        mes6.value = 0;
    }
    mes6.onblur  = function() {
        zero( 'pafeje_ej6');
        mes6.value = formatoNumero_p(mes6.value);           
    };
    
    var mes7 = document.getElementById( 'pafeje_ej7');
    if (mes7.value == ""){
        mes7.value = 0;
    }
    mes7.onblur  = function() {
        zero( 'pafeje_ej7');
        mes7.value = formatoNumero_p(mes7.value);            
    };
    
    
    var mes8 = document.getElementById( 'pafeje_ej8');
    if (mes8.value == ""){
        mes8.value = 0;
    }
    mes8.onblur  = function() {
        zero( 'pafeje_ej8');
        mes8.value = formatoNumero_p(mes8.value);
    };

    
    var mes9 = document.getElementById( 'pafeje_ej9');
    if (mes9.value == ""){
        mes9.value = 0;
    }
    mes9.onblur  = function() {
        zero( 'pafeje_ej9');
        mes9.value = formatoNumero_p(mes9.value);             
    };
    
    
    
    var mes10 = document.getElementById( 'pafeje_ej10');
    if (mes10.value == ""){
        mes10.value = 0;
    }
    mes10.onblur  = function() {
        zero( 'pafeje_ej10');
        mes10.value = formatoNumero_p(mes10.value);
    };
    

    var mes11 = document.getElementById( 'pafeje_ej11');
    if (mes11.value == ""){
        mes11.value = 0;
    }
    mes11.onblur  = function() {
        zero( 'pafeje_ej11');
        mes11.value = formatoNumero_p(mes11.value);   
    };
    
    
    var mes12 = document.getElementById( 'pafeje_ej12');
    if (mes12.value == ""){
        mes12.value = 0;
    }
    mes12.onblur  = function() {
        zero( 'pafeje_ej12');
        mes12.value = formatoNumero_p(mes12.value);   
    };
    
    
    
}



function Cajachica_ejecucion_agregar_editar_json ( registro )
{

    var jsonResponse = AjaxUrl( "../CajaChica/Ejecucion.json?registro="+registro );  
    
    if (jsonResponse.toString().trim() != "[]")
    {
        var objetoJson = JSON.parse(jsonResponse);    
   
        var id_tabla = document.getElementById('id_eje_tabla');        
        id_tabla.value =   objetoJson[0].id ;

        var pafa_uoc_id = document.getElementById('pafeje_uoc_id');        
        pafa_uoc_id.value =   objetoJson[0].uoc_id ;
        
        var mes1 = document.getElementById('pafeje_ej1');        
        mes1.value =   objetoJson[0].ej1 ;
        mes1.value = formatoNumero_p(mes1.value); 
        
        var mes2 = document.getElementById('pafeje_ej2');        
        mes2.value =   objetoJson[0].ej2 ;
        mes2.value = formatoNumero_p(mes2.value); 

        var mes3 = document.getElementById('pafeje_ej3');        
        mes3.value =   objetoJson[0].ej3 ;
        mes3.value = formatoNumero_p(mes3.value); 
        
        var mes4 = document.getElementById('pafeje_ej4');        
        mes4.value =   objetoJson[0].ej4 ;
        mes4.value = formatoNumero_p(mes4.value); 
        
        var mes5 = document.getElementById('pafeje_ej5');        
        mes5.value =   objetoJson[0].ej5 ;
        mes5.value = formatoNumero_p(mes5.value); 
        
        var mes6 = document.getElementById('pafeje_ej6');        
        mes6.value =   objetoJson[0].ej6 ;
        mes6.value = formatoNumero_p(mes6.value); 
        
        var mes7 = document.getElementById('pafeje_ej7');        
        mes7.value =   objetoJson[0].ej7 ;
        mes7.value = formatoNumero_p(mes7.value); 
                                        
        var mes8 = document.getElementById('pafeje_ej8');        
        mes8.value =   objetoJson[0].ej8 ;
        mes8.value = formatoNumero_p(mes8.value); 
    
        var mes9 = document.getElementById('pafeje_ej9');        
        mes9.value =   objetoJson[0].ej9 ;
        mes9.value = formatoNumero_p(mes9.value); 
        
        var mes10 = document.getElementById('pafeje_ej10');        
        mes10.value =   objetoJson[0].ej10 ;    
        mes10.value = formatoNumero_p(mes10.value); 
        
        var mes11 = document.getElementById('pafeje_ej11');        
        mes11.value =   objetoJson[0].ej11;    
        mes11.value = formatoNumero_p(mes11.value); 
        
        var mes12 = document.getElementById('pafeje_ej12');        
        mes12.value =   objetoJson[0].ej12 ;    
        mes12.value = formatoNumero_p(mes12.value); 
        
    }

}



