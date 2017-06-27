

function ViaticoDistribucionMensual_agregar (mes){
    
    
    var vdma_mes = document.getElementById( 'vdma_mes');
    vdma_mes.value = mes;
    
    
    var vdma_direccion = document.getElementById( 'vdma_direccion');
    if (vdma_direccion.value == ""){
        vdma_direccion.value = 0;
    }        
    vdma_direccion.onblur  = function() {        
        valor_json_direccion ( "vdma_direccion_descripcion", vdma_direccion )     ;
        zero( 'vdma_direccion' );     
    };         
    
    var vdma_qry_direccion = document.getElementById( 'vdma_qry_direccion');
    vdma_qry_direccion.addEventListener('click',
        function()
        {
                mostrarVentana('capa_oscura_segunda');
                mostrarVentana('capa_clara_segunda');
                dimensionarVentana('capa_clara_segunda', 700, 500);
                Busqueda_relacionada("Direccion", "vdma_" , "vicai_direccion_descripcion", "Descripcion");
                
                
                document.getElementById( 'vdma_monto').focus();
                
        },
        false
    );        
    
    
    var vdma_monto = document.getElementById( 'vdma_monto');
    vdma_monto.onblur  = function() {        
        vdma_monto.value  = formatoNumero_p(vdma_monto.value).trim();         
    };     
    vdma_monto.onblur();
    
    
    var vdma_certificado = document.getElementById( 'vdma_certificado');
    vdma_certificado.onblur  = function() {        
        vdma_certificado.value  = formatoNumero_p(vdma_certificado.value).trim();         
    };     
    vdma_certificado.onblur();
    
    
    
        
    
    
    

    var vdma_aceptar = document.getElementById('vdma_aceptar');
    vdma_aceptar.addEventListener('click',
        function() {

                var form = document.getElementById("vdma_form");            
                var accion =  form.getAttribute('action') ; 
                var control = AjaxPeticionURL( accion, getDataForm(form) );      

            
                if (ViaticoDistribucionMensual_agregar_validacion()){
                    if (control == null){      
                        
                        //var vdml_mes = document.getElementById("vdml_mes");
                        //var mes = vdml_mes.value;
                        AjaxPeticion('../ViaticoDistribucionMensual/Coleccion/Lista?mes='+mes,'tab_body'); 
                        ViaticoDistribucionMensual_tabla( );


                        vdma_cerrar.click();
                    }
                    else{                    
                        alerta_error(control);
                    }                    
                }

                    
                    
        },
        false
    );
    
  

  
    var vdma_cerrar = document.getElementById('vdma_cerrar');
    vdma_cerrar.addEventListener('click',
        function() {    
            javascript:ocultarVentana('capa_oscura');
            javascript:ocultarVentana('capa_clara');
        },
        false
    );           





}





function ViaticoDistribucionMensual_agregar_validacion (  ){
    
    return true;
    
    
}






