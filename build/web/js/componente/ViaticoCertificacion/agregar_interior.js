

function ViaticoCertificacion_agregar_interior ( planf, presupuesto_id, mes, nroid, codint ){

    document.getElementById('vicai_certificacion_numeracion').value = nroid ;
    document.getElementById('vicai_presupuesto_id').value = presupuesto_id ;
    
    // cargar en tiempo de ejecucion    
    var disponible = document.getElementById('vicai_monto_disponible') ;
    disponible.value = 0;
    


    
    
    var jsonResponse = AjaxUrl( "../ViaticoCertificacion/SaldoMes.json?mes="+mes
            +"&planf="+planf );    
   
    if (jsonResponse.toString().trim() != "[]")
    {
        var objetoJson = JSON.parse(jsonResponse);              
        disponible.value =   objetoJson[0].disponible ;        
    }   
    disponible.value = formatoNumero_p(disponible.value); 
    
    
    var vicai_direccion = document.getElementById( 'vicai_direccion');
    if (vicai_direccion.value == ""){
        vicai_direccion.value = 0;
    }    
    vicai_direccion.onblur  = function() {        
        valor_json_direccion ( "vicai_direccion_descripcion", vicai_direccion ) ; 
        zero( 'vicai_direccion' );     
    };    
    
    var vicai_qry_direccion = document.getElementById( 'vicai_qry_direccion');
    vicai_qry_direccion.addEventListener('click',
        function()
        {
            
                mostrarVentana('capa_oscura_segunda');
                mostrarVentana('capa_clara_segunda');
                dimensionarVentana('capa_clara_segunda', 700, 500);
                Busqueda_relacionada("Direccion", "vicai_" , "vicai_direccion_descripcion", "Descripcion");            
            
        },
        false
    );    
    
    
    // agregar direciones si no existe
    var vicai_qry_direccion_agregar = document.getElementById( 'vicai_qry_direccion_agregar');
    vicai_qry_direccion_agregar.addEventListener('click',
        function()
        {
            
                mostrarVentana('capa_oscura_segunda');
                mostrarVentana('capa_clara_segunda');
                dimensionarVentana('capa_clara_segunda', 700, 500);
                    
                AjaxPeticion( '../Direccion/jspf/agregar_modal.jspx' , 'capa_clara_segunda' );            
                dimensionarVentana('capa_clara', 900, 250)   ;
                
                Direccion_agregar_modal();
                
        },
        false
    );    
    
    
    var vicai_monto_certificacion = document.getElementById('vicai_monto_certificacion');   
    vicai_monto_certificacion.onblur  = function() {        
        
        vicai_monto_certificacion.value = formatoNumero_p(vicai_monto_certificacion.value); 
        zero( 'vicai_monto_certificacion' );     
    };        
    
    
    
    
    var vicai_aceptar = document.getElementById('vicai_aceptar');
    vicai_aceptar.addEventListener('click',
        function( ) {


            if (ViaticoCertificacion_validacion()){

                    var form = document.getElementById("vicai_form");            
                    var accion =  form.getAttribute('action') ; 
                    var control = AjaxPeticionURL( accion, getDataForm(form) );      

                    if (control == null){                           
                        
                        var path = "../ViaticoCertificacion/Coleccion/Interior?codigointerno="+codint;      
                        AjaxPeticion(path,'tab_body');                                    
                        vicai_cerrar.click();
                        
                    }
                    else{                    
                        alerta_error(control);
                    }                    
                }
                    
        },
        false
    );
    
    
    

    var vicai_cerrar = document.getElementById('vicai_cerrar');
    vicai_cerrar.addEventListener('click',
        function() {    
            javascript:ocultarVentana('capa_oscura');
            javascript:ocultarVentana('capa_clara');
        },
        false
    );   



}



function ViaticoCertificacion_validacion (  ){
    
    
    
    
    var monto = document.getElementById("vicai_monto_certificacion").value;        
    monto = monto.toString().trim().replace(/\./g,'');

    var disponible = document.getElementById("vicai_monto_disponible").value;        
    disponible = disponible.toString().trim().replace(/\./g,'');
    
    
    if ( (disponible.valueOf() - monto.valueOf()) < 0  ) {
        alerta_error("No hay suficiente saldo disponible");        
        return false;
    }    
    
    
    return true;
}