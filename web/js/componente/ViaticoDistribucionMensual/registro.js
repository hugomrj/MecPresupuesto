


function ViaticoDistribucionMensual_registro (  registro ){
    
    
    
    // trer json
    ViaticoDistribucionMensual_registro_json ( registro );
    
    
   
    
    var vdma_direccion = document.getElementById( 'vdma_direccion');
    if (vdma_direccion.value == ""){
        vdma_direccion.value = 0;
    }        
    vdma_direccion.onblur  = function() {        
        valor_json_direccion ( "vdma_direccion_descripcion", vdma_direccion )     ;
        zero( 'vdma_direccion' );     
    };         
    
    
    
    var vdma_monto = document.getElementById( 'vdma_monto');
    vdma_monto.onblur  = function() {        
        vdma_monto.value  = formatoNumero_p(vdma_monto.value).trim();         
    };     
    vdma_monto.onblur();
    
    
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
    
    
    
    

    var vdma_aceptar = document.getElementById('vdma_aceptar');
    vdma_aceptar.addEventListener('click',
        function() {

                var form = document.getElementById("vdma_form");            
                var accion =  form.getAttribute('action') ; 
                var control = AjaxPeticionURL( accion, getDataForm(form) );      

            
                if (ViaticoDistribucionMensual_agregar_validacion()){
                    if (control == null){      
                        
                        var vdma_mes = document.getElementById("vdma_mes");
                        var mes = vdma_mes.value;
                        
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





function ViaticoDistribucionMensual_registro_validacion (  ){
    
    return true;    
    
}





function ViaticoDistribucionMensual_registro_json ( registro )
{

    var jsonResponseViatico = AjaxUrl( "../ViaticoDistribucionMensual/Linea.json?idregistro="+registro );  
    
    if (jsonResponseViatico.toString().trim() != "[]")
    {
        var objetoJson = JSON.parse(jsonResponseViatico);    
   
        var vdma_id = document.getElementById('vdma_id');        
        vdma_id.value =   objetoJson[0].id ;


        var vdma_mes = document.getElementById('vdma_mes');        
        vdma_mes.value =   objetoJson[0].mes ;



        var vdma_direccion = document.getElementById('vdma_direccion');        
        vdma_direccion.value =   objetoJson[0].direccion ;

        
        var vdma_monto = document.getElementById('vdma_monto');     
        
        vdma_monto.value = objetoJson[0].monto ;
        
    }
        
    
    
    var vdma_direccion = document.getElementById('vdma_direccion');        
    valor_json_direccion ( "vdma_direccion_descripcion", vdma_direccion )     ;


}



