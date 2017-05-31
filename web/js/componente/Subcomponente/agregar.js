

function Subcomponente_agregar ( com ){


    var subcoma_componente = document.getElementById('subcoma_componente');
    subcoma_componente.value = com;


// enfoque de textfiel
/*
    var subpa_sp = document.getElementById('subpa_sp');
    subpa_sp.focus();
    subpa_sp.setSelectionRange(0, subpa_sp.value.length);            
*/




    var subcoma_aceptar = document.getElementById('subcoma_aceptar');
    subcoma_aceptar.addEventListener('click',
        function() {

                var form = document.getElementById("subcoma_form");            
                var accion =  form.getAttribute('action') ; 
                var control = AjaxPeticionURL( accion, getDataForm(form) );      



                if (Subcomponente_agregar_editar_validacion()){
                    if (control == null){        
                        
                        //AjaxPeticion('../../Subcomponente/Coleccion/Lista?com='+com,'tab_body');  
                        Subcomponente_formulario();

                        subcoma_cerrar.click();
                    }
                    else{                    
                        alerta_error(control);
                    }                    
                }
                    
        },
        false
    );
    
  

  
    var subcoma_cerrar = document.getElementById('subcoma_cerrar');
    subcoma_cerrar.addEventListener('click',
        function() {    
            javascript:ocultarVentana('capa_oscura');
            javascript:ocultarVentana('capa_clara');
        },
        false
    );           

};










function Subcomponente_agregar_editar_validacion (  ){       
            
    return true;
}







