

function Nivel_agregar ( com ){


    var niva_componente = document.getElementById('niva_componente');
    niva_componente.value = com;




    var niva_aceptar = document.getElementById('niva_aceptar');
    niva_aceptar.addEventListener('click',
        function() {

                var form = document.getElementById("niva_form");            
                var accion =  form.getAttribute('action') ; 
                var control = AjaxPeticionURL( accion, getDataForm(form) );      



                if (Nivel_agregar_editar_validacion()){
                    if (control == null){        
                        
                        //AjaxPeticion('../../Subcomponente/Coleccion/Lista?com='+com,'tab_body');  
                        Nivel_formulario();

                        niva_cerrar.click();
                    }
                    else{                    
                        alerta_error(control);
                    }                    
                }
                    
        },
        false
    );
    
  

  
    var niva_cerrar = document.getElementById('niva_cerrar');
    niva_cerrar.addEventListener('click',
        function() {    
            javascript:ocultarVentana('capa_oscura');
            javascript:ocultarVentana('capa_clara');
        },
        false
    );           

};










function Nivel_agregar_editar_validacion (  ){       
            
    return true;
}







