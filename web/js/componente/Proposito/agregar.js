

function Proposito_agregar ( scom ){


    var metaa_subcomponente = document.getElementById('metaa_subcomponente');
    metaa_subcomponente.value = scom;




    var metaa_aceptar = document.getElementById('metaa_aceptar');
    metaa_aceptar.addEventListener('click',
        function() {

                var form = document.getElementById("metaa_form");            
                var accion =  form.getAttribute('action') ; 
                var control = AjaxPeticionURL( accion, getDataForm(form) );      



                if (Meta_agregar_validacion()){
                    if (control == null){        
                        

                        Proposito_formulario();

                        metaa_cerrar.click();
                    }
                    else{                    
                        alerta_error(control);
                    }                    
                }
                    
        },
        false
    );
    
  

  
    var metaa_cerrar = document.getElementById('metaa_cerrar');
    metaa_cerrar.addEventListener('click',
        function() {    
            javascript:ocultarVentana('capa_oscura');
            javascript:ocultarVentana('capa_clara');
        },
        false
    );           

};










function Meta_agregar_validacion (  ){       
            
    return true;
}







