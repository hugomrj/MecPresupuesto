

function ViaticoCertificacionNumeracion_agregar ( planf, mes ){

    // hay que cargar algunos campos antes de insertar



    document.getElementById('vinum_plan_financiero_id').value = planf ;    
    document.getElementById('vinum_mes').value = mes ;



    var vinum_codigo_interno = document.getElementById('vinum_codigo_interno');
    vinum_codigo_interno.onblur  = function() {           
        vinum_codigo_interno.value = formatoNumero_p(vinum_codigo_interno.value);
        document.getElementById('vinum_tipo_viatico').focus();
    };  
        
    vinum_codigo_interno.addEventListener('keyup',
        function(event) {
            if(event.keyCode == 13)
            {
                vinum_codigo_interno.onblur();                               
            }
        },
        false
    );

    
    //vinum_dolar
    var vinum_dolar = document.getElementById('vinum_dolar');
    vinum_dolar.onblur  = function() {           
        vinum_dolar.value = formatoNumero_p(vinum_dolar.value);
        document.getElementById('vinum_aceptar').focus();
    };  
        
    vinum_dolar.addEventListener('keyup',
        function(event) {
            if(event.keyCode == 13)
            {
                vinum_dolar.onblur();                               
            }
        },
        false
    );    
    
    

    var vinum_aceptar = document.getElementById('vinum_aceptar');
    vinum_aceptar.addEventListener('click',
        function( ) {

                if (ViaticoCertificacionNumeracionAgregar_validacion())
                {

                    var form = document.getElementById("vinum_form");            
                    var accion =  form.getAttribute('action') ; 
                    var control = AjaxPeticionURL( accion, getDataForm(form) );      

                    if (control == null){                            
                        
                        var path = "../ViaticoCertificacionNumeracion/Coleccion/ListaMes?mes="+mes+"&planf="+planf;                            
                        AjaxPeticion(path,'tab_body');                         
                        ViaticoCertificacionNumeracion_listaMes_tabla(mes, planf);                        
                        vinum_cerrar.click();
                        
                    }
                    else{                    
                        alerta_error(control);
                    }                    
                }
                    
        },
        false
    );
    
    
    

    var vinum_cerrar = document.getElementById('vinum_cerrar');
    vinum_cerrar.addEventListener('click',
        function() {    
            javascript:ocultarVentana('capa_oscura');
            javascript:ocultarVentana('capa_clara');
        },
        false
    );   



}



function ViaticoCertificacionNumeracionAgregar_validacion (  ){
    
    
    
    var vinum_fecha = document.getElementById('vinum_fecha');    
    if (vinum_fecha.value == '') {
        alerta_error("El valor de la fecha esta vacio");
        vinum_fecha.focus();
        return false;
    }    
    
    
    var vinum_tipo_viatico = document.getElementById('vinum_tipo_viatico').value;
    var vinum_dolar = document.getElementById('vinum_dolar').value;
    
    if (!(vinum_tipo_viatico.toString().trim() == "E"  || vinum_tipo_viatico.toString().trim() == "I"))
    {
        alerta_error("En campo solo puede ser E o I"); 
        document.getElementById('vinum_tipo_viatico').focus();
        return false;    
    }
    
    if ((vinum_tipo_viatico.toString().trim() == "E"  && vinum_dolar.toString().trim() == "0") )
    {
        alerta_error("Falta cargar el valor del dolar");        
        return false;    
    }    
    
    
    
    var vinum_codigo_interno = document.getElementById('vinum_codigo_interno');        
    if (vinum_codigo_interno.value == 0) {
        alerta_error("Falta numero de expediente");
        document.getElementById('vinum_codigo_interno').focus();
        return false;
    }        
    
    
    
    
    
    //return false;
    return true;
    
}