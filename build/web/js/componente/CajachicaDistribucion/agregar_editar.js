
function Cajachica_agregar_editar ( registro ){

    
    Cajachica_agregar_editar_json ( registro );

    Cajachica_agregar_editar_campos_interaccion();


    var pafa_aceptar = document.getElementById('pafa_aceptar');
    pafa_aceptar.addEventListener('click',
        function() {


                if (Cajachica_agregar_editar_validacion()){

                    var pafa_uoc_id = document.getElementById('pafa_uoc_id');
                    pafa_uoc_id.value = registro;

                    var form = document.getElementById("pafa_form");            
                    var accion =  form.getAttribute('action') ; 
                    var control = AjaxPeticionURL( accion, getDataForm(form) );      
                    
                    if (control == null){    
                        meses_valores (  ) ;
                        pafa_cerrar.click();
                    }
                    else{                    
                        alerta_error(control);
                    }  
                }  
        },
        false
    );
    
   
    var pafa_cerrar = document.getElementById('pafa_cerrar');
    pafa_cerrar.addEventListener('click',
        function() {    
            javascript:ocultarVentana('capa_oscura');
            javascript:ocultarVentana('capa_clara');
        },
        false
    );           
    
    PlanFinanciero_agregar_sumar_formulario (  );

};



function Cajachica_agregar_editar_validacion (  ){

        var suma = 0;
        suma = PlanFinanciero_suma();    
        
        var presupuesto = document.getElementById( 'pvcabe_vigente').innerHTML;
        presupuesto = presupuesto.replace(/\./g, "");

        var diferencia = 0;
        diferencia = parseInt( presupuesto ) - parseInt( suma )  ;
        
        if (diferencia < 0){
            alerta_error("Error en diferencia con distribucion la distribucion y el monto disponible");
            return false
        }
    
    return true;
}







function Cajachica_agregar_editar_campos_interaccion ( )
{
    
    var pf1 = document.getElementById( 'pafa_pf1');
    if (pf1.value == ""){
        pf1.value = 0;
    }
    pf1.onblur  = function() {
        zero( 'pafa_pf1');        
        pf1.value = formatoNumero_p(pf1.value);              
        PlanFinanciero_agregar_sumar_formulario();        
    };

    
    var pf2 = document.getElementById( 'pafa_pf2');
    if (pf2.value == ""){
        pf2.value = 0;
    }
    pf2.onblur  = function() {
        zero( 'pafa_pf2');
        pf2.value = formatoNumero_p(pf2.value);              
        PlanFinanciero_agregar_sumar_formulario();
    };
    
    
    var pf3 = document.getElementById( 'pafa_pf3');
    if (pf3.value == ""){
        pf3.value = 0;        
    }
    pf3.onblur  = function() {
        zero( 'pafa_pf3');
        pf3.value = formatoNumero_p(pf3.value);        
        PlanFinanciero_agregar_sumar_formulario();                
    };
    
    var pf4 = document.getElementById( 'pafa_pf4');
    if (pf4.value == ""){
        pf4.value = 0;
    }
    pf4.onblur  = function() {
        zero( 'pafa_pf4');
        pf4.value = formatoNumero_p(pf4.value);        
        PlanFinanciero_agregar_sumar_formulario();                
    };
    

    var pf5 = document.getElementById( 'pafa_pf5');
    if (pf5.value == ""){
        pf5.value = 0;
    }
    pf5.onblur  = function() {
        zero( 'pafa_pf5');
        pf5.value = formatoNumero_p(pf5.value);
        PlanFinanciero_agregar_sumar_formulario();                
    };
    
    var pf6 = document.getElementById( 'pafa_pf6');
    if (pf6.value == ""){
        pf6.value = 0;
    }
    pf6.onblur  = function() {
        zero( 'pafa_pf6');
        pf6.value = formatoNumero_p(pf6.value);           
        PlanFinanciero_agregar_sumar_formulario();                
    };
    
    
    
    var pf7 = document.getElementById( 'pafa_pf7');
    if (pf7.value == ""){
        pf7.value = 0;
    }
    pf7.onblur  = function() {
        zero( 'pafa_pf7');
        pf7.value = formatoNumero_p(pf7.value);            
        PlanFinanciero_agregar_sumar_formulario();                
    };
    
    
    var pf8 = document.getElementById( 'pafa_pf8');
    if (pf8.value == ""){
        pf8.value = 0;
    }
    pf8.onblur  = function() {
        zero( 'pafa_pf8');
        pf8.value = formatoNumero_p(pf8.value);
        PlanFinanciero_agregar_sumar_formulario();                
    };

    
    var pf9 = document.getElementById( 'pafa_pf9');
    if (pf9.value == ""){
        pf9.value = 0;
    }
    pf9.onblur  = function() {
        zero( 'pafa_pf9');
        pf9.value = formatoNumero_p(pf9.value);             
        PlanFinanciero_agregar_sumar_formulario();                
    };
    
    
    
    var pf10 = document.getElementById( 'pafa_pf10');
    if (pf10.value == ""){
        pf10.value = 0;
    }
    pf10.onblur  = function() {
        zero( 'pafa_pf10');
        pf10.value = formatoNumero_p(pf10.value);
        PlanFinanciero_agregar_sumar_formulario();                
    };
    

    var pf11 = document.getElementById( 'pafa_pf11');
    if (pf11.value == ""){
        pf11.value = 0;
    }
    pf11.onblur  = function() {
        zero( 'pafa_pf11');
        pf11.value = formatoNumero_p(pf11.value);   
        PlanFinanciero_agregar_sumar_formulario();                
    };
    
    
    var pf12 = document.getElementById( 'pafa_pf12');
    if (pf12.value == ""){
        pf12.value = 0;
    }
    pf12.onblur  = function() {
        zero( 'pafa_pf12');
        pf12.value = formatoNumero_p(pf12.value);   
        PlanFinanciero_agregar_sumar_formulario();                
    };
    
    
    
}



function Cajachica_agregar_editar_json ( registro )
{

    var jsonResponse = AjaxUrl( "../CajaChica/Distribucion.json?registro="+registro );  
    
    if (jsonResponse.toString().trim() != "[]")
    {
        var objetoJson = JSON.parse(jsonResponse);    
   
        var id_tabla = document.getElementById('id_tabla');        
        id_tabla.value =   objetoJson[0].id ;

        var pafa_uoc_id = document.getElementById('pafa_uoc_id');        
        pafa_uoc_id.value =   objetoJson[0].uoc_id ;
        
        var pf1 = document.getElementById('pafa_pf1');        
        pf1.value =   objetoJson[0].pf1 ;
        pf1.value = formatoNumero_p(pf1.value); 
        
        
        var pf2 = document.getElementById('pafa_pf2');        
        pf2.value =   objetoJson[0].pf2 ;
        pf2.value = formatoNumero_p(pf2.value); 

        
        var pf3 = document.getElementById('pafa_pf3');        
        pf3.value =   objetoJson[0].pf3 ;
        pf3.value = formatoNumero_p(pf3.value); 
                
        
        
        
        var pf4 = document.getElementById('pafa_pf4');        
        pf4.value =   objetoJson[0].pf4 ;
        pf4.value = formatoNumero_p(pf4.value); 
                             
        
        var pf5 = document.getElementById('pafa_pf5');        
        pf5.value =   objetoJson[0].pf5 ;
        pf5.value = formatoNumero_p(pf5.value); 
                          

        
        
        var pf6 = document.getElementById('pafa_pf6');        
        pf6.value =   objetoJson[0].pf6 ;
        pf6.value = formatoNumero_p(pf6.value); 
                                  
        
        
        var pf7 = document.getElementById('pafa_pf7');        
        pf7.value =   objetoJson[0].pf7 ;
        pf7.value = formatoNumero_p(pf7.value); 
                                        
        
        
        var pf8 = document.getElementById('pafa_pf8');        
        pf8.value =   objetoJson[0].pf8 ;
        pf8.value = formatoNumero_p(pf8.value); 
                                          
    
        var pf9 = document.getElementById('pafa_pf9');        
        pf9.value =   objetoJson[0].pf9 ;
        pf9.value = formatoNumero_p(pf9.value); 
                                            
        
        
        var pf10 = document.getElementById('pafa_pf10');        
        pf10.value =   objetoJson[0].pf10 ;    
        pf10.value = formatoNumero_p(pf10.value); 
                                             
        
        
        var pf11 = document.getElementById('pafa_pf11');        
        pf11.value =   objetoJson[0].pf11;    
        pf11.value = formatoNumero_p(pf11.value); 
                                                         
        
        
        var pf12 = document.getElementById('pafa_pf12');        
        pf12.value =   objetoJson[0].pf12 ;    
        pf12.value = formatoNumero_p(pf12.value); 
                                                      
        
    }
        
    


}

function PlanFinanciero_agregar_sumar_formulario (  )
{
    
        var suma = 0;
        suma = PlanFinanciero_suma();       
    
        var presupuesto = document.getElementById( 'pvcabe_vigente').innerHTML;
        presupuesto = presupuesto.replace(/\./g, "");

        var diferencia = 0;
        diferencia = parseInt( presupuesto ) - parseInt( suma )  ;

        var pafa_mensaje = document.getElementById( 'pafa_mensaje');
        pafa_mensaje.innerHTML = diferencia;        
        pafa_mensaje.innerHTML = formatoNumero_p(pafa_mensaje.innerHTML);         

        if (diferencia < 0){            
            pafa_mensaje.style.color = 'red';            
            pafa_mensaje.innerHTML = "Sobrepasado : &nbsp;&nbsp;&nbsp; -&nbsp;"+formatoPunto(pafa_mensaje.innerHTML);        
        }
        else{
            pafa_mensaje.style.color = 'steelblue';                        
            pafa_mensaje.innerHTML = "Falta asignar: &nbsp;&nbsp;&nbsp; "+formatoPunto(pafa_mensaje.innerHTML);        
        }
    

//        pafa_mensaje.innerHTML = "Falta asignar: &nbsp;&nbsp;&nbsp; "+formatoPunto(pafa_mensaje.innerHTML);        
        
    
    
    
}




function PlanFinanciero_suma (  )
{
    
    var suma = 0;
        var numero = 0
    
        var val1 = document.getElementById( 'pafa_pf1');
        if (val1.value != "undefined"){            
            numero = val1.value;                            
            numero = numero.replace(/\./g, "");
            suma = suma +  parseInt( numero );
        }
    
        var val2 = document.getElementById( 'pafa_pf2');
        if (val2.value != "undefined"){            
            numero = val2.value;                            
            numero = numero.replace(/\./g, "");
            suma = suma +  parseInt( numero );
        }    
    
        var val3 = document.getElementById( 'pafa_pf3');
        if (val3.value != "undefined"){            
            numero = val3.value;                            
            numero = numero.replace(/\./g, "");
            suma = suma +  parseInt( numero );
        }        
    
        var val4 = document.getElementById( 'pafa_pf4');
        if (val4.value != "undefined"){            
            numero = val4.value;                            
            numero = numero.replace(/\./g, "");
            suma = suma +  parseInt( numero );
        }        

        var val5 = document.getElementById( 'pafa_pf5');
        if (val5.value != "undefined"){            
            numero = val5.value;                            
            numero = numero.replace(/\./g, "");
            suma = suma +  parseInt( numero );
        }        
    
        var val6 = document.getElementById( 'pafa_pf6');
        if (val6.value != "undefined"){            
            numero = val6.value;                            
            numero = numero.replace(/\./g, "");
            suma = suma +  parseInt( numero );
        }        
        
        var val7 = document.getElementById( 'pafa_pf7');
        if (val7.value != "undefined"){            
            numero = val7.value;                            
            numero = numero.replace(/\./g, "");
            suma = suma +  parseInt( numero );
        }        
    
        var val8 = document.getElementById( 'pafa_pf8');
        if (val8.value != "undefined"){            
            numero = val8.value;                            
            numero = numero.replace(/\./g, "");
            suma = suma +  parseInt( numero );
        }        
    
        var val9 = document.getElementById( 'pafa_pf9');
        if (val9.value != "undefined"){            
            numero = val9.value;                            
            numero = numero.replace(/\./g, "");
            suma = suma +  parseInt( numero );
        }        
    
        var val10 = document.getElementById( 'pafa_pf10');
        if (val10.value != "undefined"){            
            numero = val10.value;                            
            numero = numero.replace(/\./g, "");
            suma = suma +  parseInt( numero );
        }        
    
        var val11 = document.getElementById( 'pafa_pf11');
        if (val11.value != "undefined"){            
            numero = val11.value;                            
            numero = numero.replace(/\./g, "");
            suma = suma +  parseInt( numero );
        }        

        var val12 = document.getElementById( 'pafa_pf12');
        if (val12.value != "undefined"){            
            numero = val12.value;                            
            numero = numero.replace(/\./g, "");
            suma = suma +  parseInt( numero );
        }        

    return  suma;

}